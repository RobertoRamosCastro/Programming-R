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

gg_bars <- ggplot(data=Carseats, aes(x=Sales, fill=Urban))
gg_bars + geom_histogram(position='dodge',bins=50) # bins numero de barras q salen en el histograma
# position = 'dodge' para q no esten juntas unas con otra

gg_bars + geom_bar(col='darkblue', size=10)

gg_bars + geom_density(alpha=0.3)

#
Carseats$Education <- as.ordered(Carseats$Education)
ggplot(data=Carseats, aes(x=Education)) + geom_bar()
# coord_flip() podemos rotar las coordenadas
##FACETS
gg_bars + geom_density(alpha=0.3) + facet_grid(Urban ~ .) #separas la leyenda

# Juntando todo 
ggplot(data=diamonds, aes(x=carat, y=price, col=color)) + 
  geom_point()+
  scale_x_continuous(name='Peso') +# nombre del eje X
  scale_y_sqrt(name = 'Precio') +# nombre del eje Y y ademas escalado cuadratico
  geom_smooth(method = 'lm', col='black') +# hacer mas smooth con el model linear model
  scale_color_manual( # para controlar la leyenda
    name = 'Colorcito',
    breaks = c('D','E','F','G','H','I','J'), # lo q habia antes
    labels = c('dd','ee','ff','gg','hh','ii','jj'), # lo q voya poner ahora a la leyenda
    values= c('red','blue','yellow','orange','green','brown','gray')
  )

# multiples graficos
library(gridExtra)
g1<- ggplot(data=diamonds, aes(x= carat, y=price, col=color))
g1_1 <- g1 + geom_point(alpha=0.4)
g1_2 <- g1_1 + scale_color_discrete(name='Color')
g1_2

g2<- ggplot(data=diamonds, aes(x= carat, y=price, col=clarity))
g2_1 <- g1 + geom_point(alpha=0.4)
g2_2 <- g1_1 + scale_color_discrete(name='Color')
g2_2

grid.arrange(g1_2, g2_2, nrow=1)
