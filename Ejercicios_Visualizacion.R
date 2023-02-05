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

## Ej3
#Disintos tipos de graficas
data("iris")
head(iris)
# Una variable continua
gg<- ggplot(iris, aes(x=Petal.Length))
#Hist
gg + geom_histogram()
#Bars
gg + geom_bar()
#Density
gg+geom_density()

# Overplotting en scatter plots 
data("mtcars")
gg <- ggplot(mtcars,aes(x=as.factor(cyl), y=as.factor(am), col=as.factor(gear))) #no se porq los pone en tipo factor
gg+
  geom_point(size=3)

gg+
  geom_jitter(size=3)
             
gg+
  geom_point(size=2, position=position_jitter(width = 0.5,height = 0.5))

# Dos variables continuas
ggplot(diamonds, aes(x=carat, y=price))+
  geom_jitter()# con ruido, scatter es con geom_point()
#linea
ggplot(diamonds, aes(x=carat, y=price))+
  geom_line()

# var discreta y continua
ggplot(diamonds, aes(x=carat, y=cut))+
  geom_boxplot()
ggplot(diamonds, aes(x=carat, y=cut))+
  geom_violin() #siguiente paso al boxplot, te dice donde estan los datos y la distribucion de los mismos

#Posicionamiento de las barras en un grafico de barras
gg<-ggplot(mtcars, aes(x=as.factor(cyl), fill=as.factor(am)))
gg+
  geom_bar() # por defecto sale una encima de la otra pero si no, ponemos position='stack'
gg+
  geom_bar(position='dodge')

#uno encima del otro normalizado
gg+
  geom_bar(position='fill')

## STATS 
ggplot(iris, aes(x=Sepal.Length,
                 y=Sepal.Width,
                 col=Species)) +
  geom_point()+
  stat_smooth()# Intenta dibujar la linea q se adapta a los puntos con su intervalo de confianza

# Pintamos unicamente el stat
ggplot(iris, aes(x=Sepal.Length,
                 y=Sepal.Width,
                 col=Species)) +
  stat_smooth()

# Modificamos el geom del stat: geom='line'
ggplot(iris, aes(x=Sepal.Length,
                 y=Sepal.Width,
                 col=Species)) +
  stat_smooth(geom='line') # se = F, es decir que quitemos el intervalo ese de confianaz creo 

# Modificamos los aesthetics del stat: fill=Species y un valor de alpha
ggplot(iris, aes(x=Sepal.Length,
                 y=Sepal.Width,
                 )) +
  stat_smooth(aes(fill=Species), alpha=0.1)

# FACETS
# Multigraficos en un eje
gg <- ggplot(diamonds, aes(x=carat,y=price,col=clarity))+
  geom_point()
gg

# De una forma mucho mas clara ("desagregando" por clarity) -> facet_wrap(~clarity)
gg + 
  facet_wrap(~clarity) # crea un grafico por cada clarity q haya, en vez de 1 grafico con 7 puntos en la leyenda crea 7 graficas

# veamos un grafico de barras de distribucion de precios por corte
ggplot(diamonds, aes(x=price, col=cut))+geom_bar()

# Mejorar la visualizacion normalizando
ggplot(diamonds, aes(x=price, col=cut))+geom_bar(position='fill')

# Como hay tantos datos, los desengranamos por cut
ggplot(diamonds, aes(x=price, col=cut))+
  geom_bar(position='fill')+
  facet_wrap(~cut)

# SCLAES
gg_cont<- ggplot(diamonds,aes(x=x*y*z, y=price))+
  geom_point()
gg_cont

gg_cont+
  # usamos continuous porq el eje X es continua, es decir, es una variable numerica
  scale_x_continuous(name='size',
                     limits= c(0,800), # unicamente ver del eje X los 800 primeros
                     breaks= seq(0,800,200), #q los 800 puntos del eje se situen cada 200
                     minor_breaks = seq(0,800,100)) 


# Modificcion de escala sobre variable discreta_ modifica la variable discreta segun 4 lniveles
# I1 SI2, VVS2, IF con las etiquetas Bad Normal Good Ideal, respectivamente
# Limita la variable "y" entre 1000 y 2000
gg_disc<- ggplot(diamonds,aes(x=clarity, y=price))+
  geom_jitter()
gg_disc+
  scale_y_continuous(limits = c(1000,2000))+
  scale_x_discrete(limits=c("I1","SI2","VVS2","IF"),
                   labels=c("Bad","Normal","Good","Ideal"))
