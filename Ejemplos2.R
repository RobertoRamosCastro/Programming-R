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
