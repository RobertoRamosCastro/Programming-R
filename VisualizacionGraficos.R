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
ggplot(data=diamonds,mapping = aes(x=carat,y=price)) + geom_point(color='red')
# podemos poner color tanto en aes() donde podemos usar otra variable para ponerle color o bien en la geometria pero solo colores por defecto

