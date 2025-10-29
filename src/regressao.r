library(ggplot2)
data(mtcars)

mpg_coluna <- mtcars$mpg
wt_coluna  <- mtcars$wt

plot(wt_coluna, mpg_coluna)
    
abline(lm(mpg ~ wt, data = mtcars), col = "red", lwd = 2)

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(color = "steelblue") +
  geom_smooth(method = "lm", se = TRUE, color = "darkred") +
  labs(x = "Peso (wt)", y = "Milhas por Galão (mpg)")

retas <- ggplot(mtcars, aes(x = wt, y = mpg)) + 
  geom_point(color = "steelblue") +
  geom_smooth(method = "lm", se = FALSE, color = "darkred") + 
  geom_hline(yintercept = mean(mpg), 
             linetype = "dashed", color = "blue") +
  geom_segment(aes(xend = wt, yend = mean(mpg)),
               color = "red", alpha = 0.5) +
  labs(x = "Peso (wt)", y = "Combustivel (mpg)")
retas

sqt  <- sum((mtcars$mpg - mean(mtcars$mpg))^2)   
modelo <- lm(mpg ~ wt, data = mtcars)
sqres <- sum(residuals(modelo)^2)                
r2 <- 1 - (sqres / sqt)

cat("Coeficiente de Determinação (R²):", round(r2, 4), "\n")

novos_pesos <- data.frame(wt = c(2.5, 3.0, 4.5))
predicoes <- predict(modelo, novos_pesos)

data.frame(novos_pesos, mpg_previsto = round(predicoes, 2))
