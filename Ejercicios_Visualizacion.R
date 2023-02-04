## Ejercicios
library(ggplot2)

## Ej1
#Resumen del contenido del set de datos de iris
data("iris")

str(iris)
summary(iris)

#Base: Scatter plot de longitud vs anchura de sepalos
plot(iris$Sepal.Length, iris$Sepal.Width)

#ggplot2: Scatter plot de longitud vs anchura de sepalos
ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width)) + geom_point()

#ggplot2: Scatter plot de longitud vs anchura de sepalos. Colro de los puntos sean verdes
ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width)) + 
  geom_point(col='green')

#ggplot2: Scatter plot de longitud vs anchura de sepalos. Colro de los puntos sean segun la especie
ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width)) + geom_point(aes(col=Species))

## Ej2
#Set de datos diamonds
data("diamonds")
str(diamonds)
summary(diamonds)

#Aesthetics de posicion
#Variables continuas
ggplot(diamonds, aes(x=carat, y=price))+
  geom_point()

# Scatter plot de una variable continua versus una discreta
ggplot(diamonds, aes(x=carat, y=cut))+
  geom_point() # demostracion que geom_point no es bueno para var discretas, en su lugar usamos geom_jitter

ggplot(diamonds, aes(x=carat, y=cut))+
  geom_jitter() # aleatoriza en un intervalo de datos

# OTRA MANERA DE PONER geom_jitter
ggplot(diamonds, aes(x=carat, y=cut))+
  geom_point(position='jitter')

# Scatter plot de dos variables discretas
ggplot(diamonds, aes(x=color, y=cut))+
  geom_point(position='jitter')

# Aesthetic de transparencia con alpha
ggplot(diamonds, aes(x=carat, y=price, alpha=clarity))+ #en funcion de la claridad del diamante, pone la transparencia de los circulos
  geom_point()

# Transparencia como atributo: dar un valor concreto de alpha entre 0 y 1
ggplot(diamonds, aes(x=carat, y=price))+
  geom_point(alpha=0.4,aes(col=depth))
              