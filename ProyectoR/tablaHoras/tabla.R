#Importamos la tabla
datos <- read.delim("vehículoTabla.csv", header = TRUE, sep = ";")

#FUNCIÓN: Pone un 1 mientras la persona esté en el parking y un 0 cuando no está
# h <- Hora del día
# f <- Fila por la que vamos
# ci <- Columna de viaje de ida
# cv <- Columna de viaje de vuelta
# dtFrame <- DataFrame al que se le aplica
# cuen <- Para ver cuantas iteraciones positivas hay
fCalculoUnoCero <- function(f, ci, cv, h, dtFrame, cuen) {
  
   aux1 <- as.integer((strsplit(toString(dtFrame[f,ci]), ":"))[[1]][1])
   aux2 <- as.integer((strsplit(toString(dtFrame[f,cv]), ":"))[[1]][1])
  
  if(length(aux1) != 0 & length(aux2) != 0 & !is.na(aux1) & !is.na(aux2)){
    cuen <- cuen + 1
  if((aux1 <= h) & (aux2 >= h)){
    y <- 1
    return(y)
  } else{
    y <- 0
    return(y)
  }
 }
}

#Se crea el vector que almacena las horas:
vectorHoras <- c()
for(i in 1:24){
vectorHoras <- c(vectorHoras, paste(i, ":00", sep = ""))
}
#Matriz donde se va a guardar la tabla y nueva fila a añadir
matriz <- matrix(vectorHoras, nrow = 1)
filaNueva <- c()
colnames(matriz) <- vectorHoras
#Para ver cuantas iteraciones hay:
cuenta <- 0

#Recorremos toda la tabla por filas:
for(i in 2: (length(datos[,1])-1)){ 
# i es la fila (persona) por la que vamos
  
for(n in 1:24){
# n es la columna (hora) por la que vamos
filaNueva <- c(filaNueva, fCalculoUnoCero(i, 1, 6, n, datos, cuenta)[[1]])
}
  
#Se mete la nueva fila en la tabla 
matriz <- rbind(matriz, filaNueva)  
filaNueva <- c()
}

matriz <-matriz[2:length(matriz[,1]),]
rownames(matriz) <- 1:length(matriz[,1])

#Se hace el dataframe y se guarda el csv:
d <- data.frame(matriz)
write.csv(d, file = "TablaPorHoras.csv")
