install.packages("ggplot2")
library(ggplot2)

peso = c(45,50,60,55,58,56,48,53)
altura = c(1.54, 1.56, 1.65, 1.60, 1.65, 1.63, 1.58, 1.59)

# Grafico
plot (peso, altura)

# Colocando no gráfico
abline(lm(altura~peso))

# Melhorando o gráfico
ggplot(mapping = aes(peso,altura)) + geom_point() + geom_smooth(method = "lm")

retas <- ggplot(mapping = aes(peso, altura)) + 
  geom_point() + geom_smooth(se = FALSE, method = "lm") + 
  geom_hline(yintercept = mean(altura))
print(retas)

retas + geom_segment(aes(x=peso, y=altura, xend=peso, yend=mean(altura), color="red"))

sqt = sum((mean(altura) - altura)^2)
sqres = sum((predict(lm(altura~peso)) - altura)^2)
r2=(sqt - sqres)/sqt
r2

modelo <- lm(altura ~ peso)
predict(modelo)

pesos <- data.frame(peso=c(48, 51, 52))
pesos

predict(modelo, pesos)
