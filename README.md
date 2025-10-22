# Desenvolvimento com Dev Container (R)

Este repositório usa um Dev Container para desenvolvimento em R. O container é configurado em `.devcontainer/devcontainer.json` e o `Dockerfile` na raiz é usado para construir a imagem.

Use este README para reconstruir o container, verificar as extensões instaladas e resolver problemas comuns.

## Como (re)construir o Dev Container (VS Code)

1. Abra o repositório no VS Code.

2. Abra a Paleta de Comandos (Ctrl+Shift+P) e execute:

   - `Dev Containers: Rebuild and Reopen in Container`

Isso irá reconstruir a imagem com o `Dockerfile` e aplicar as configurações em `.devcontainer/devcontainer.json` (incluindo instalação das extensões listadas).

## Como verificar se as extensões foram instaladas no container

- Após o container abrir, abra a visão de Extensões no VS Code (Ctrl+Shift+X) e filtre por "Installed in: Dev Container" para ver as extensões instaladas dentro do container.

- Alternativamente, a seção `customizations.vscode.extensions` em `.devcontainer/devcontainer.json` lista as extensões que o VS Code tentará instalar automaticamente.

## Extensões adicionadas

As extensões que o `devcontainer.json` tenta instalar incluem (exemplos):

- Ikuyadeu.r (R)
- REditorSupport.r-lsp
- REditorSupport.r
- formulahendry.code-runner
- usernamehw.errorlens
- PKief.material-icon-theme
- meganrogge.rainbow-csv
- GitHub.copilot
- GitHub.copilot-chat
- ms-azuretools.vscode-docker
- ms-vscode-remote.vscode-dev-containers
- ms-ceintl.vscode-language-pack-pt-BR
- ms-vscode-remote.remote-containers
- ms-azuretools.vscode-container

> Observação: se alguma extensão não instalar automaticamente, veja a seção de troubleshooting abaixo.

## Troubleshooting rápido

- Extensão não aparece instalada:

  - Abra a paleta (Ctrl+Shift+P) → `Dev Containers: Rebuild and Reopen in Container`.

  - Verifique a rede/timeout — a instalação de extensões exige acesso ao Marketplace.

  - Se houver erro, abra o `F1` → `Developer: Toggle Developer Tools` para ver logs da instalação.

- GitHub Copilot / Copilot Chat:

  - O Copilot pode requerer login pelo GitHub. Após o container abrir, habilite/autorize o Copilot quando solicitado.

  - Se o `GitHub.copilot` ou `GitHub.copilot-chat` não aparecer automaticamente, tente instalar manualmente dentro do VS Code (no contexto do container).

- R / R LSP / R Syntax:

  - As extensões R (Ikuyadeu.r e REditorSupport.*) dependem de ter R instalado no container.

  - O `Dockerfile` do projeto deve instalar R; se o LSP não inicializar, verifique se o binário `R` está no PATH dentro do container.

  - Nos settings de `devcontainer.json` definimos `r.lsp.path` e `r.rterm.linux` como `R` (use `which R` dentro do container para verificar).

- Snapcode (nome ambíguo):

  - Não foi possível identificar um ID único para "Snapcode" no Marketplace.

  - Se quiser que eu adicione, por favor forneça o ID da extensão (ex: `publisher.extension`) ou link do Marketplace.

## Teste rápido do lintr (exemplo)

1. Abra um terminal integrado no container (Terminal → New Terminal).

2. Execute no terminal dentro do container (PowerShell ou bash conforme configurado):

```powershell
# exemplo em Rscript para rodar lintr em um arquivo
R -e "lintr::lint('src/atividade.r')"
```

Se o lintr reportar erros de configuração, verifique o arquivo `config/.lintr` (já atualizado para `linters_with_defaults` se necessário).

## Automação (opcional)

Se quiser, posso adicionar um script PowerShell em `.devcontainer/` para automatizar o rebuild (requer VS Code CLI/Dev Container CLI). Diga se quer que eu gere.

## Contato

Se algo falhar, cole aqui as mensagens de erro (logs do VS Code ou saída do terminal) e eu ajudo a diagnosticar.
