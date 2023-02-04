# libreria ggplot2
#podemos definir grafico base y podemos añadirle capas 
# hay que decirle a R obligatoriamente: Data, Aesthethics (caracteristicas visuales asociadas a los datos),
# Geomteries (forma, line,bar,point,hist etc)
# Facets es lo de las capas creo
library(ggplot2)
library(dplyr) #interactuar con dataframes. 

data(diamonds)
str(diamonds)
summary(diamonds)

# le pasamos data, mapping tipo aes con sus ejes X e Y para enfrentar dos variables y por ultimo su geomeotria
ggplot(data=diamonds,mapping = aes(x=carat,y=price, col=color)) + geom_point(alpha=1/10)# alpha es para la opacidad
# podemos poner color tanto en aes() donde podemos usar otra variable para ponerle color o bien en la geometria pero solo colores por defecto
# podemos tamb añadir size en vez de color con mas variables
#dentro de la geometria podemos tocar: x,y,color,shape,fill,alpha,size

##
data("iris")
str(iris)

gg<- ggplot(data=iris, mapping=aes(x=Sepal.Length,y=Sepal.Width)) # esto es lo de hacerlo por capas
gg2 <- gg + geom_point()# vamos creando distintas capas y le vamos sumando cosas
gg3 <- gg + geom_boxplot()
gg4 <- gg + geom_contour_filled()
gg + geom_point(size=3, col="lightblue") + geom_line(aes(col=Species, linetype=Species)) #podemos meter aes en la geometira asi el color q elijamos de otra variable unicamente estara en esa figura geometrica

##
library(ISLR)
data(Carseats)
str(Carseats)

gg_bars <- ggplot(data=Carseats, aes(x=Sales))
gg_bars + geom_histogram(bins=50,fill='red')
gg_bars + geom_bar(col='darkblue', size=10)

##
