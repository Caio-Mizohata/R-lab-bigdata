print(str(iris))

View(iris)

nrow(iris)

sample(1:150, 105)
set.seed(123)

filtro <- sample(1:nrow(iris), nrow(iris) * 0.7)
treino <- iris[filtro, ]
teste <- iris[-filtro, ]

install.packages("rpart")
library(rpart)

modelo <- rpart(Species ~., data = treino)

install.packages("rpart.plot")
library(rpart.plot)
prp(modelo, extra=1)
install.packages("caret")
library(caret)

prev = predict(modelo, teste, type="class")
confusionMatrix(prev, teste$Species)
