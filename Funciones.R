# Como usar funciones
name_function <- function(parameters){
  print(parameters)
}

name_function(9)

# para ver los argumentos de una funcion usamos args(f)

# CRAN donde se almacenan todos los paqutes de R 
# Familia de apply 
m<- matrix(1:12, nrow = 3)
m

apply(m, 1:2, sqrt) #le pasamos la lsita, vector o lo q queramos, luego 1->fila, 2-> columna o 1:2 para todas las filas y columnas y luego la fucnion q quieras aplicar
# lapply te devuelve una lista
lapply(m, class) #parecido si fuera un for 
#saplly intenta simplificar a un vector o matriz si es posible, evitandonos usar unlist
#vapply le indicamos que datos queremos que nos devuelva

## Ej7
pioneers <- c("GAUSS:1777","BAYES:1702","PASCAL:1623","PEARSON:1857")

#Separa los nombres y años usando strplit()
split_names<- strsplit(pioneers,":")

# Aplica la funcion tolower  todos los elementos de split_math para convertirlos en minusculas
split_low<- lapply(split_names, tolower) #lo mete en una lista
split_low

# Escriba una funcion que devuelva el primer elemento de un vector
select_second <- function(x){
  return (x[[2]])
}
select_second(pioneers)

#Aplica la funcion select_second a split_low
lapply(split_low, select_second)


# do.call(rbind, allframes) donde lo q tenemos es allframes que es una lista de frames y queremos bindearlos 