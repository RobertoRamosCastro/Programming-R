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

# Aesthetics de color
# Relleno como aesthetic y como atributo
ggplot(diamonds, aes(x=carat, y=price, fill='orange'))+
  geom_point()
ggplot(diamonds, aes(x=carat, y=price))+
  geom_point(fill='orange')

# Aesthetics como forma
# continua
ggplot(diamonds, aes(x=carat, y=price,shape=x*y*z))+
  geom_point() # la forma no puede ser de una variable continua
#discreta
ggplot(diamonds, aes(x=carat, y=price,shape=clarity))+
  geom_point() 
#discreta
ggplot(diamonds, aes(x=carat, y=price))+
  geom_point(shape=1) # el valor 1 significa el primer valor de la lista de formas, es decir hay mas

# Tipo de linea como aesthetic, conitnua
ggplot(diamonds, aes(x=carat, y=price,linetype=x*y*z))+
  geom_point() # tampoco se puede con una continua
# discreta
ggplot(diamonds, aes(x=carat, y=price,linteype=cut, col=cut))+
  geom_smooth(se=F,size=1)
#tipo de linea como atributo
ggplot(diamonds, aes(x=carat, y=price, col=cut))+
  geom_smooth(se=F,size=1, linetype="dotdash")


#Aesthetic de size
#continua
ggplot(diamonds, aes(x=carat, y=price, size=price))+
  geom_point()
#discreta
ggplot(diamonds, aes(x=carat, y=price, size=cut))+
  geom_point()
#como atributo
ggplot(diamonds, aes(x=carat, y=price, size=cut))+
  geom_point(size=2)
