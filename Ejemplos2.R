# joins como en SQL

c1 <- 1:10
c2 <- letters[1:10]
c3 <- 5:20
c4 <- letters[5:20]

df.x <- data.frame(col1=c1,col2=c2)
df.x
df.y <- data.frame(col1=c3,col2=c4)
df.y

join <- merge(df.x,df.y, by=c("col1")) #crea un dataframe con los valores que coinciden en la columna 'col1'
join

left.join <- merge(df.x,df.y, by=c("col1"), all.x = T) # crea un dataframe con todos los valroes que coincide en la columna 'col1' aunq una de las dos tablas no tenga valores 
left.join # y depende de que dataframe pongas en la izq, se copian sus columnas q no coincide

right.join <- merge(df.x,df.y, by=c('col1'), all.y = T)
right.join
# tocando los parametros all.x,all.y, colocando en la posicion izq o derecha cada dataframe puedo obtener lo mismo con right o left join
full.join <- merge(df.x,df.y, by=c('col1'), all = T) # asi unificamos por completo ambos dataframes
full.join
#borrar variables
rm(join)


##Ejercicios 5
planets <- c("Mercury","Venus","Earth","Mars","Jupiter","Saturn","Uranus","Neptune")
type <- c("Terrestral planet","Terrestral planet","Terrestral planet","Terrestral planet","Terrestral planet","Terrestral planet","Terrestral planet","Terrestral planet")
diameter <- c(0.382,0.949,1,0.532,11.209,9.449,4.007,3.883)
rotation <- c(58.64,-243.02,1,1.03,0.41,0.43,-0.72,0.67)
rings <- c(F,F,F,F,T,T,T,T)

planets_df <- data.frame(planets, type, diameter,rotation, rings)
planets_df

# Compruebo contenido del df
str(planets_df)
summary(planets_df)

# selecciona la informacion de los tres primeros planetsa (mas cercanos al sol)
tres_primeros<-planets_df[1:3,]
tres_primeros
# selecciona 3 ultimos
tres_ultimos<-tail(planets_df,3)
tres_ultimos

View(planets_df) # visualizar contenidos en tipo tabla

#Selecciona la columna diameter de los ultimos seis planetas (los mas lejanos al sol)
tail(planets_df$diameter,6)

# selecciona solo planetas q tienen anillos
planets_rings <- planets_df[planets_df$rings,]
planets_rings

# seleccionar los planetas que tiene un diametro inferior al de la tierra
diameter_menor_1 <- planets_df[planets_df$diameter < 1,]
diameter_menor_1

# La funcion order devuevle las posiciones de un vector ordenado ascendentemente
a<-c(4,10,3)
order(a) #te dice como deberias de cober las posiciones 
a[order(a)]

# ordenamos el data frame segun el diametro de los planetas ascendentemente
planets_df$diameter[order(diameter)]

# descendentemente
planets_df$diameter[order(diameter, decreasing = T)]


my_list <- list(1,2,3,4,5)
class(my_list[3]) # devuelve una lista
class(my_list[[3]])# devuelve un numeric en este caso, pero creo q depende de lo q le metas te devuelve su clase
#la mayorai de veces usaremos dobles corchetes o $

## EJ6
actors<- c("Jack", "Sheely","Danny","Scatman","Barry")
scores <- c(4.5,4.0,5.0)
comments <- c("Best Horror Film I Have Ever Seen","A truly brillian and scary film from Stanley Kubrick","A masterpiece of psychological horro")
sources<-c("IMDb1","IMDb2","IMDb3")
reviews<- data.frame(scores,sources,comments)

reviews

# Crea una lista q contenga los siguitnes components:
  # 1. moviename: The Shinning
  # 2. actors: el vector de actores
  # 3. reviews: el data frame de reviews
shinning_list <- list(moviename= "The Shinning", actores=actors, reviews=reviews)
shinning_list

# selecciona el ultimo ctor del vector de ac tores de la lsita
shinning_list[["actores"]][5]

#Selecciona la segunda de las criticas del dat frame de reviews de la lista
shinning_list[["reviews"]][2,]

# A??ade un nuevo elemento a la lista
  # 1. year: 1980
shinning_list <- c(shinning_list, year=1980)
shinning_list


str(shinning_list)

