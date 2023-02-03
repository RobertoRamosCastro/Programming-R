inputs <- list(1,2,3,4,-5, "oops")
for (input in inputs){
  tryCatch(print(paste("Logaritmo de", log(input))),
    warning = function(w) { print(paste("Warning de argumento erroneo", input)); log(-input)}, #eso lo hace para hacer return del log del -5 pero psositivo
    error = function(e) { print(paste("Argumento erroneo", input));NaN})} #los corchetes son porq estamos dentro de la funcion error, y el return es NaN



# built-in importantes: str(x)-> imprimre un resumen de la etructura de x, summary(x)-> muestra un resumen d los estadisticos basicos de x 
#head(x)->muestra ls primeras filas o primeros elemntos de un objeto tail(x)-> muestra los ultimos

# la funcion c() crea un vector
# la funcion vector() tamb crea un vector que podemos decirle q tipos recogera y tamaño fijo
v1 <- vector(mode='logical', length <- 3)
v1

v2 <- c(1.4,7,'pedro')
for (i in v2){
  print(typeof(i)) #YASEPORQ ES ESTO. Porq hace coerciones automaticas entonces como no le cuadra, lo pone todo del mismo tipo
}

# crear mi primer dataframe

mi_df <- data.frame('pepe' = c("46", "hombre"),
                    'pedro'= c("15","hombree"))
mi_df

mi_df[,1] #para imprimir todas las filas
mi_df[1,] #para imprimir todas las columnas

# suma de vectores
a <- c(6,7,3,4,5,6,7,8,9,10) # replica los valores, en orden, del vector hsata llegar a la longitud del vector mas largo, en este caso
# c(1,2,3,1,2)
b <- c(5,5,5,5,5) 
a_b <- a + b

# Indexacion de vectores con numeros postiivos
a[4] #no devuelve error si no q devuelve un NA

a[c(1,1,2)] # asi digo a las posiciones que quiero entrar
a[which(a>5)] #te devuelve los valores mayores que 5

# Indexacion de vectores con numeros negativos
#los numeros negativos a diferencia de python, no nos devuelven las posiciones del final del array si no que 
# nos devuelven el array sin esa posicion
a[-length(a)] # no devolvemos el final


#Indexacion por nombres
v0 <- (1:5)
v0

names(v0) <- c("alpha","pedro","alex","david","jose")
v0

v0["alpha"] # devuelve el valor q tiene como un diccionario
v0["pedro"] <- 500
v0["pedro"]
v0[!(names(v0) %in% c("alpha", "pedro"))] # %in% indica pertenencia, aqui es como si le estamos diciendo:
# no me devuelvas, de esta lista, estos valores q la pertenecen

# is.atomic(*vector*) TURE si solo contiene elementos del mismo tipo
is.atomic(inputs)
is.atomic(a)
# is.vector() TRUE si es un vector
#is.revursive() TRUE si es una estructira recursiva
#names(v) es un vector de caracteres con los nombres de cada elemento



#EJERCICIO 
#EJ2. Crea dos vectores numericos que representen las ganacias y las perdidsa de la semana
#vector con los dias de la semana
v_dias <- c("M", "T", "X", "TH", "F")
poker_vector <- c(140, -50, 20, -120, 240)
names(poker_vector) <- v_dias
roulette_vector <- c(-24,-50,100,-350,10)
names(roulette_vector) <- v_dias
poker_vector
roulette_vector

#Calcula el total de ganacias semanal
sum(poker_vector)
sum(roulette_vector)


# Calcula el total de ganacias diario
suma <- poker_vector + roulette_vector
suma

# Selecciono las gancias del martes al viernes
poker_vector[1:4]


# Imrpimir solo si hay ganacias
poker_vector > 0
poker_vector[which(poker_vector>0)]
poker_vector[poker_vector>0]

is.logical(v_dias)
is.list(a[1])


x <- as.Date("2018-10-01")
months(x)

a<-c(3,0,TRUE)
B<-c(4,0,FALSE)
c<-(a|b)


class(length(iris[["Petal.Length"]]))
class(length(iris["Petal.Length"]))


a[2]<-"Ind"
a


mylist<-list(1,2,3,"C",4)
unlist(mylist)

StD <- as.Date("2020/2/28")
StoD<-as.Date("2020/3/1")
StD-StoD

ve1<-c(1:4)
ve2<-c(1:2)
ve1*ve2

# Creacion de matrices
m1 <- matrix(1:9, nrow=4, ncol=5)
m1
rownames(m1) <- c("Sara","Claudia","Alex","Rober")
colnames(m1) <- c("Estuche","Lapiz","Cartera","Clase","Mochila")
m1[c(1,4),c("Estuche","Mochila")]

m2 <- matrix(c(1,0,-4,1,2,3), nrow = 3, ncol = 2)
m2

# crear matriz diagonal
d1 <- diag(3)
d1

t_m1 <- t(m1)
t_m1
m1

# lista con autovlares y autovectores
e <- eigen(m1)
e

d<-det(m1) # determinante de la matriz
d

# Al hacer operaciones se autocompletan como con los arrays, pero parece q tienen q tener mismo numero de columnas
matriz2 <- matrix(1:9, nrow = 4)
suma_matrices <- matriz2 + m1
suma_matrices

# Ejercicios matrices
new_hope <- c(461, 314.4)
empire_strikes <- c(290.5, 247.9)
return_jedi <- c(309.3, 165.8)

# crear matriz con tod la informacion con tres filas
star_Wars_matix <- matrix(c(new_hope, empire_strikes, return_jedi), nrow = 3, byrow = T)
star_Wars_matix

rownames(star_Wars_matix) <- c("A new Hope", "The Empire Strikes Back", "Return of the jedi")
colnames(star_Wars_matix) <- c("US", "non-US")

# Si el precio de la etnrada es de 5€, estiam el numero de espectadores de cada pelicula
star_Wars_matix / 5 #numero de espectadores por peli si lo divido entre %/% sale sin decimales

# el precio de las entradas varia
ticket_prices_matrix <- matrix(c(5,5,6,6,7,7), nrow = 3, byrow = T, dimnames = list(rownames(star_Wars_matix),colnames(star_Wars_matix)))
ticket_prices_matrix

# repetir calculo con los precios de cada peli en cada sitio
star_Wars_matix / ticket_prices_matrix

# calcular numero de espectadores medio en US
nº_espectdaores_US <- mean(star_Wars_matix[, "US"])
nº_espectdaores_US

#calcular la recaudacion por pelicla
recaudaxpeli <- rowSums(star_Wars_matix)

# añadir el vector anterior con los totales por pelicula como una nueva columna
all_wars_matrix <- cbind(star_Wars_matix, recaudaxpeli) # con esto bindemos, añadimos columanas o rowbind pa filas
all_wars_matrix


# FACTORES 
# los hay ordenados o no y son un tipo de estructura de datos para almacenar variables categoricas, ejemplo de tallas de ropa
gender_vector <- c('M','F','F','M','M','F')
gender_factor <- factor(gender_vector)
gender_factor #est chulo porq te pone los levels, es decir, las categorias 

#crear vector con orden pero sin especificar el orden
size_vector <- c('S','L','M','L','S','M')
size_factor <- factor(size_vector, ordered = T) #al no especificar el orden, levels nos da un orden alfabetico
size_factor

#le damos el orden
size_vector <- c('S','L','M','L','S','M')
size_factor <- factor(size_vector, ordered = T, levels = c('S','M','L')) # asi le damos el orden
size_factor

#creacion de factor especificando etiquetas
gender_leves2 <- c('M','F','-') # como se leen los datos de entrada
gender_labels2 <- c('Male','Female', NA) # Como se etiquetan
gender_vector2 <- c('M','F','F','M','M','-')
gender_factor2 <- factor(gender_vector2, levels = gender_leves2, labels = gender_labels2)
gender_factor2

#obtener los niveles 
levels(gender_factor)
#comprobar si existe un nivel
any(levels(size_factor) %in% c('L','S'))
#aádir nuevos niveles
levels(size_factor) <- c(levels(size_factor),'XS')
size_factor
# reordenar niveles
size_factor <- factor(size_factor, ordered = T, levels(size_factor)[c(4,1:3,5)])
size_factor
#renombrar un level
levels(size_factor)[1] <- 'ExtraL'

# eliminar niveles no usados
size_factor <- size_factor[drop<- T]
droplevels(size_factor)

# traps sobre factores
# al usar read.tables y read.csv usaremos el parametro stringAsFactors = FALSE porque si no nos pone los datos como factores

# EJ4
animals_vector <- c("Elef","Jirafa","Perro","cat")
tem_vector <- c("High","Low","Medium","Low")

# crear dos factores, uno sin orden y otro con orden
animales_factor <- factor(animals_vector)
animales_factor

tem_factor <- factor(tem_vector, ordered = T, levels = c("Low","Medium","High"))
tem_factor


# modifica los niveles de l siguiente facotr para q sean femanle y male
# presta atencion al orden en q los establces
survey_actor <- c("M","F","F","M","M")
factor_survey_actor <- factor(survey_actor)
levels(factor_survey_actor) <- c("Female","Male")

factor_survey_actor

# Haz summary sobre el ector y sobre el factor
summary(survey_actor)
summary(factor_survey_actor) #contear el numero de datos en una etiqueta

# Crear un facotr ordenador para el siguiente vector
speed_vector <- c("Fast","Slow","Slow","Fast","Ultra-Fast")
speed_factor <- factor(speed_vector, ordered = T, levels = c("Slow","Fast","Ultra-Fast"))
speed_factor[2] > speed_factor[5]

# Crear dataframe a mano
empy <- data.frame()

c1 <- 1:10 # vector de enteros
c2 <- letters[1:10] # vector de letras
df <- data.frame(col1 = c1, col2=c2)
df
tail(df,4)
# funcion head(df, X) devuelve los primeros X valores del dataframe
# funcion tail(df, X) devuelve los ultimos X valores del dataframe
# funcion str(df) muestra de forma rapida la estrucutrar de la informacion almcenada
str(df)
summary(df)