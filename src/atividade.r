# Formula de bhaskhara com R

bhaskara <- function(a, b, c) {
  delta <- b ^ 2 - 4 * a * c
  if (delta < 0) {
    print("Não existem raízes reais")
  } else if (delta == 0) {
    raiz <- -b / (2 * a)
    print(paste("Existe uma raiz real:", raiz))
  } else {
    raiz1 <- (-b + sqrt(delta)) / (2 * a)
    raiz2 <- (-b - sqrt(delta)) / (2 * a)
    print(paste("Existem duas raízes reais:", raiz1, "e", raiz2))
  }
}
# Exemplo de uso
bhaskara(1, -3, 2)