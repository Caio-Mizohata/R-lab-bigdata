dados = read.csv("databases/brasileirao_a.csv", sep = ";", header = TRUE)

desempenho_time <- function(time) {
    nome_time = dados$Time == time
    gols_pro = dados$Gols.pró[nome_time]
    gols_contra = dados$Gols.contra[nome_time]
    jogos = dados$Jogos[nome_time]
    classificacao = dados$Classificação[nome_time]
    total_gols = dados$Saldo.de.gols[nome_time]

    media_gols_pro = gols_pro / jogos
    media_gols_contra = gols_contra / jogos

    if (classificacao <= 4) {
        resultado_time <- paste(time, "está classificado para a Copa Libertadores")
    } else if (classificacao >= 17) {
        resultado_time <- paste(time, "está rebaixado para a Série B")
    } else {
        resultado_time <- paste(time, "não está classificado para a Libertadores nem rebaixado")
    }

    resultado = list(
        "Resultado da classificação" = resultado_time,
        "Média de Gols Pró" = media_gols_pro,
        "Média de Gols Contra" = media_gols_contra
    )

    return(resultado)
}

desempenho_time("Corinthians SP")
