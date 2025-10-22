# Dockerfile para ambiente de desenvolvimento R (apenas linguagem, sem RStudio)
FROM r-base:4.3.3

WORKDIR /app

# Dependências de sistema (camada que raramente muda)
RUN apt-get update && apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Criar diretório e configurar Rprofile.site (camada que raramente muda)
RUN mkdir -p /usr/local/lib/R/etc \
    && cat > /usr/local/lib/R/etc/Rprofile.site <<'RPROFILE'
options(repos = c(CRAN = "https://packagemanager.rstudio.com/cran/__linux__/bookworm/latest"))
options(stringsAsFactors = FALSE)
options(warn = 1)
options(error = NULL)
RPROFILE

# Instala pacotes R usando um script separado para melhor cache
# O build só re-executa esta camada se 'install_packages.R' mudar.
COPY install_packages.R /tmp/install_packages.R
RUN Rscript /tmp/install_packages.R && rm /tmp/install_packages.R

# Criar usuário/grupo 'dev' (se não existirem), criar diretórios e ajustar permissões
RUN set -eux; \
    if ! id -u dev >/dev/null 2>&1; then \
    groupadd -r dev || true; \
    useradd -m -r -g dev dev || true; \
    fi; \
    mkdir -p /app/src /app/config /app/data; \
    chown -R dev:dev /app || true

WORKDIR /app/src

# Copia a configuração do lintr (ótimo que está no FIM do arquivo)
# Isso garante que mudar o lintr não reinstale todos os pacotes R
COPY config/.lintr /home/dev/.lintr
COPY config/.lintr /app/.lintr
RUN chown dev:dev /home/dev/.lintr /app/.lintr || true

VOLUME ["/app"]
USER dev
CMD ["R"]