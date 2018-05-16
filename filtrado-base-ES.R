#' ---
#' title: "Indexación y filtrado en R - base"
#' author: "Ana Laura Diedrichs"
#' date: "15 de mayo de 2018"
#' ---
#'  
#'  
#' # Indexación y filtrado en R
#' 
#' Vamos a trabajar con tablas en R para aprender como indexarlas y de esa forma encontrar la información
#' que nos interesa.
#' Para ello vamos a utilizar funciones básicas en R, sin necesidad de instalar paquetes extras.
#' 
#' La finalidad es poder entender sentencias bases de R y como indexa, 
#' es decir, como acceder a elementos del dataset (fila, columna).
#'  
#' Cargamos el dataset UCBAdmissions 
#' 

library(ggplot2)

#' lo convertimos a data.frame para realizar operaciones sobre el mismo.
datos <- as.data.frame(mpg)
print(datos)

#' Un resumen del dataset
summary(datos)

#' Observamos los nombres de sus filas y columnas
dimnames(datos)
#' Nro total de filas 
nrow(datos)
#' Nro total de columnas 
ncol(datos)
#' 
#' Podemos acceder a las columnas por su nombre o ubicación (se comienza a indexar desde 1 hasta el tamaño máximo de fila/columna).
#' 
#' ## Ejemplos:
#' 
#' 1) Obtener el valor de una fila y columna específica
columna_nro <- 2
fila_nro <-3
print(datos[fila_nro,columna_nro])

#' 2) Mostrar un rango de filas y columnas
print(datos[1:5,1:3])
#' Observe que el primer lugar antes de la coma es para indexar filas y luego de la coma para columnas.
#' 
#' 3) Cuantos autos compactos
sum(datos[,"model"])
#' 4) Obtener un listado de fabricantes
unique(datos$manufacturer)
#' 5) Obtener el total de corolla
sum(datos[,"model"]=="corolla")
#' Si observamos el ejemplo anterior, vemos que `datos[,"class"]=="compact"` 
#' nos regresa un vector de valores lógicos (TRUE / FALSE). 
#' 
#' Si revisa en la ayuda de R
#' (tipeando ?sum en la consola) a TRUE lo cuenta como 1 y a FALSE como 0
print(datos[,"model"]=="corolla")
sum(datos[,"model"]=="corolla")

#'
#' # Filtrar filas
#' 
#'
#' Las filas pueden ser accedidas por su indice, nombre o "índice lógico", al igual que las columnas.
#' 
print(datos["4",])
print(datos[5,])
#' Note que en las siguientes sentencias solo me regresa las primeras 10 filas, porque indexo con val,
#' un vector de valores logicos.

val <-  c(rep(TRUE,10),rep(FALSE,224))
datos[val,]

#' # Filtrar usando sentencias lógicas
#' 
#' Si quiero filtrar la columna Clientes donde Esperar sea 1 (que si prefieren esperar),
#' puedo usar variables que guarden el valor que me interesa obtener/filtrar.
atributo <- "Clientes"
target <- "Esperar"
label <- 1
#' Filtramos usando lo siguiente
restaurant[restaurant[,target]==label,atributo]
#' Note que ``restaurant[,target]==label`` regresa un vector con valores TRUE y FALSE
print(restaurant[,target]==label)
#' Luego si quiero contar cuantas veces aparece el valor del atributo, 
#' guardo los datos en una variable c (para hacer legible el ejemplo) y usamos la función table.
c <- restaurant[restaurant[,target]==label,atributo]
print(c)
table(c)

#' Para obtener la cantidad en tipo numérico de uno de los atributos
table(c)["Lleno"]
is.numeric(table(c)["Lleno"]) # acceder al valor numérico de Lleno
#' Puedo calcular las proporciones (cantidad de elementos sobre su total)
print(table(c)/sum(table(c)))

#' ## Indexar o filtrar por más de una condición
#' Ejemplo, filtrar con clientes=Algunos y Esperar=1
restaurant[(restaurant[,target]==label) & (restaurant[,atributo]=="Algunos"),]

#' Puedo crear varias condiciones, agregamos un filtro por tipo de restaurant
condicion <- (restaurant[,target]==label) & (restaurant[,atributo]=="Algunos") & (restaurant[,"Tipo"] %in% c("Frances","Italiano"))

restaurant[condicion,]

#' Cuantos cumplen que Clientes sea igual a "Algunos" y "Esperar" = 1
#' 
nrow(restaurant[(restaurant[,target]==label) & (restaurant[,atributo]=="Algunos"),] )

#' Asi como usamos el operado logico AND & se puede usar OR | o el NOT !. 
#' Para ello consulte [este link](https://www.statmethods.net/management/operators.html),
#' o [este](https://www.r-bloggers.com/logical-operators-in-r/)  u otros de su interés

