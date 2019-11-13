encuesta <- read.csv(file = "~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Limpieza encuesta/Vehículo Eléctrico.csv", header = T, sep = ";")
encuesta <- encuesta[1:170,]

########
#Tiempo en la universidad
########
#
#h_in <- Vector con las horas de entrada
#h_in_aux <- Columna del las horas de llegada del lunes para los valores NA
#h_out <- Vector con las horas de salida
#h_out_aux <- Columna del las horas de salida del lunes para los valores NA
t_medioEnEscuela <- function(h_in, h_in_aux, h_out, h_out_aux) {
  menos3h <- 0
  entre3y4 <- 0
  entre4y5 <- 0
  entre5y6 <- 0
  entre6y7 <- 0
  entre7y8 <- 0
  entre8y9 <- 0
  entre9y10 <- 0
  entre10y12 <- 0
  mas12 <- 0
  for(i in 1:length(h_in_aux)){
    if(nchar(toString(h_in[i])) != 0){
      h_entrada <- h_in[i]
    }else{
      h_entrada <- h_in_aux[i]
    }
    if(nchar(toString(h_out[i])) != 0){
      h_salida <- h_out[i]
    }else{
      h_salida <- h_out_aux[i]
    }
    
    h_ent <- sapply(strsplit(toString(h_entrada),":"),
           function(x) {
             x <- as.numeric(x)
             x[1]+x[2]/60
           })
    
    h_sal <- sapply(strsplit(toString(h_salida),":"),
                    function(x) {
                      x <- as.numeric(x)
                      x[1]+x[2]/60
                    })
    
    tiempo <- h_sal-h_ent
    if(tiempo < 3){
      menos3h <- menos3h + 1
    }else if(tiempo >= 3 && tiempo < 4){
      entre3y4 <- entre3y4 + 1
    }else if(tiempo >= 4 && tiempo < 5){
      entre4y5 <- entre4y5 + 1
    }else if(tiempo >= 5 && tiempo < 6){
      entre5y6 <- entre5y6 + 1
    }else if(tiempo >= 6 && tiempo < 7){
      entre6y7 <- entre6y7 + 1
    }else if(tiempo >= 7 && tiempo < 8){
      entre7y8 <- entre7y8 + 1
    }else if(tiempo >= 8 && tiempo < 9){
      entre8y9 <- entre8y9 + 1
    }else if(tiempo >= 9 && tiempo < 10){
      entre9y10 <- entre9y10 + 1
    }else if(tiempo >= 10 && tiempo < 12){
      entre10y12 <- entre10y12 + 1
    }else if(tiempo >= 12){
      mas12 <- mas12 + 1
    }
  }
  return(c(menos3h, entre3y4, entre4y5, entre5y6, entre6y7, entre7y8, entre8y9, entre9y10, entre10y12, mas12)) 
}

#Tiempo medio del total
t_medio <- c("Menosde 3 horas", "Entre 3 y 4 horas", "Entre 4 y 5 horas", "Entre 5 y 6 horas", "Entre 6 y 7 horas", "Entre 7 y 8 horas", "Entre 8 y 9 horas", "Entre 9 y 10 horas", "Entre 10 y 12 horas", "Más de 12 horas") 
Lunes <- t_medioEnEscuela(encuesta$Hora.llegada.Lunes, encuesta$Hora.llegada.Lunes, encuesta$Hora.salida.Lunes, encuesta$Hora.salida.Lunes)
Martes <- t_medioEnEscuela(encuesta$Hora.llegada.Martes , encuesta$Hora.llegada.Lunes, encuesta$Hora.salida.Martes, encuesta$Hora.salida.Lunes)
Miércoles <- t_medioEnEscuela(encuesta$Hora.llegada.Miércoles , encuesta$Hora.llegada.Lunes, encuesta$Hora.salida.Miércoles, encuesta$Hora.salida.Lunes)
Jueves <- t_medioEnEscuela(encuesta$Hora.llegada.Jueves , encuesta$Hora.llegada.Lunes, encuesta$Hora.salida.Jueves, encuesta$Hora.salida.Lunes)
Viernes <- t_medioEnEscuela(encuesta$Hora.llegada.Viernes , encuesta$Hora.llegada.Lunes, encuesta$Hora.salida.Viernes, encuesta$Hora.salida.Lunes)

df_tMedio_Total <- data.frame(t_medio, Lunes, Martes, Miércoles, Jueves, Viernes) 


#Tiempo medio por grupos -> Chuleta
# t_medio <- c("Menosde 3 horas", "Entre 3 y 4 horas", "Entre 4 y 5 horas", "Entre 5 y 6 horas", "Entre 6 y 7 horas", "Entre 7 y 8 horas", "Entre 8 y 9 horas", "Entre 9 y 10 horas", "Entre 10 y 12 horas", "Más de 12 horas") 
# Lunes <- t_medioEnEscuela(encuesta$Hora.llegada.Lunes[], encuesta$Hora.llegada.Lunes[], encuesta$Hora.salida.Lunes[], encuesta$Hora.salida.Lunes[])
# Martes <- t_medioEnEscuela(encuesta$Hora.llegada.Martes[] , encuesta$Hora.llegada.Lunes[], encuesta$Hora.salida.Martes[], encuesta$Hora.salida.Lunes[])
# Miércoles <- t_medioEnEscuela(encuesta$Hora.llegada.Miércoles[] , encuesta$Hora.llegada.Lunes[], encuesta$Hora.salida.Miércoles[], encuesta$Hora.salida.Lunes[])
# Jueves <- t_medioEnEscuela(encuesta$Hora.llegada.Jueves[] , encuesta$Hora.llegada.Lunes[], encuesta$Hora.salida.Jueves[], encuesta$Hora.salida.Lunes[])
# Viernes <- t_medioEnEscuela(encuesta$Hora.llegada.Viernes[] , encuesta$Hora.llegada.Lunes[], encuesta$Hora.salida.Viernes[], encuesta$Hora.salida.Lunes[])
# 
# df_tMedio <- data.frame(t_medio, Lunes, Martes, Miércoles, Jueves, Viernes) 


#Tiempo medio por grupos -> PDI 
t_medio <- c("Menosde 3 horas", "Entre 3 y 4 horas", "Entre 4 y 5 horas", "Entre 5 y 6 horas", "Entre 6 y 7 horas", "Entre 7 y 8 horas", "Entre 8 y 9 horas", "Entre 9 y 10 horas", "Entre 10 y 12 horas", "Más de 12 horas") 
Lunes <- t_medioEnEscuela(encuesta$Hora.llegada.Lunes[which(encuesta$Grupo=="PDI")], encuesta$Hora.llegada.Lunes[which(encuesta$Grupo=="PDI")], encuesta$Hora.salida.Lunes[which(encuesta$Grupo=="PDI")], encuesta$Hora.salida.Lunes[which(encuesta$Grupo=="PDI")])
Martes <- t_medioEnEscuela(encuesta$Hora.llegada.Martes[which(encuesta$Grupo=="PDI")] , encuesta$Hora.llegada.Lunes[which(encuesta$Grupo=="PDI")], encuesta$Hora.salida.Martes[which(encuesta$Grupo=="PDI")], encuesta$Hora.salida.Lunes[which(encuesta$Grupo=="PDI")])
Miércoles <- t_medioEnEscuela(encuesta$Hora.llegada.Miércoles[which(encuesta$Grupo=="PDI")] , encuesta$Hora.llegada.Lunes[which(encuesta$Grupo=="PDI")], encuesta$Hora.salida.Miércoles[which(encuesta$Grupo=="PDI")], encuesta$Hora.salida.Lunes[which(encuesta$Grupo=="PDI")])
Jueves <- t_medioEnEscuela(encuesta$Hora.llegada.Jueves[which(encuesta$Grupo=="PDI")] , encuesta$Hora.llegada.Lunes[which(encuesta$Grupo=="PDI")], encuesta$Hora.salida.Jueves[which(encuesta$Grupo=="PDI")], encuesta$Hora.salida.Lunes[which(encuesta$Grupo=="PDI")])
Viernes <- t_medioEnEscuela(encuesta$Hora.llegada.Viernes[which(encuesta$Grupo=="PDI")] , encuesta$Hora.llegada.Lunes[which(encuesta$Grupo=="PDI")], encuesta$Hora.salida.Viernes[which(encuesta$Grupo=="PDI")], encuesta$Hora.salida.Lunes[which(encuesta$Grupo=="PDI")])

df_tMedio_PDI <- data.frame(t_medio, Lunes, Martes, Miércoles, Jueves, Viernes) 


#Tiempo medio por grupos
t_medio <- c("Menosde 3 horas", "Entre 3 y 4 horas", "Entre 4 y 5 horas", "Entre 5 y 6 horas", "Entre 6 y 7 horas", "Entre 7 y 8 horas", "Entre 8 y 9 horas", "Entre 9 y 10 horas", "Entre 10 y 12 horas", "Más de 12 horas") 
Lunes <- t_medioEnEscuela(encuesta$Hora.llegada.Lunes[which(encuesta$Grupo=="PAS")], encuesta$Hora.llegada.Lunes[which(encuesta$Grupo=="PAS")], encuesta$Hora.salida.Lunes[which(encuesta$Grupo=="PAS")], encuesta$Hora.salida.Lunes[which(encuesta$Grupo=="PAS")])
Martes <- t_medioEnEscuela(encuesta$Hora.llegada.Martes[which(encuesta$Grupo=="PAS")] , encuesta$Hora.llegada.Lunes[which(encuesta$Grupo=="PAS")], encuesta$Hora.salida.Martes[which(encuesta$Grupo=="PAS")], encuesta$Hora.salida.Lunes[which(encuesta$Grupo=="PAS")])
Miércoles <- t_medioEnEscuela(encuesta$Hora.llegada.Miércoles[which(encuesta$Grupo=="PAS")] , encuesta$Hora.llegada.Lunes[which(encuesta$Grupo=="PAS")], encuesta$Hora.salida.Miércoles[which(encuesta$Grupo=="PAS")], encuesta$Hora.salida.Lunes[which(encuesta$Grupo=="PAS")])
Jueves <- t_medioEnEscuela(encuesta$Hora.llegada.Jueves[which(encuesta$Grupo=="PAS")] , encuesta$Hora.llegada.Lunes[which(encuesta$Grupo=="PAS")], encuesta$Hora.salida.Jueves[which(encuesta$Grupo=="PAS")], encuesta$Hora.salida.Lunes[which(encuesta$Grupo=="PAS")])
Viernes <- t_medioEnEscuela(encuesta$Hora.llegada.Viernes[which(encuesta$Grupo=="PAS")] , encuesta$Hora.llegada.Lunes[which(encuesta$Grupo=="PAS")], encuesta$Hora.salida.Viernes[which(encuesta$Grupo=="PAS")], encuesta$Hora.salida.Lunes[which(encuesta$Grupo=="PAS")])

df_tMedio_PAS <- data.frame(t_medio, Lunes, Martes, Miércoles, Jueves, Viernes) 


#Tiempo medio por grupos
t_medio <- c("Menosde 3 horas", "Entre 3 y 4 horas", "Entre 4 y 5 horas", "Entre 5 y 6 horas", "Entre 6 y 7 horas", "Entre 7 y 8 horas", "Entre 8 y 9 horas", "Entre 9 y 10 horas", "Entre 10 y 12 horas", "Más de 12 horas") 
Lunes <- t_medioEnEscuela(encuesta$Hora.llegada.Lunes[which(encuesta$Grupo=="Estudiante")], encuesta$Hora.llegada.Lunes[which(encuesta$Grupo=="Estudiante")], encuesta$Hora.salida.Lunes[which(encuesta$Grupo=="Estudiante")], encuesta$Hora.salida.Lunes[which(encuesta$Grupo=="Estudiante")])
Martes <- t_medioEnEscuela(encuesta$Hora.llegada.Martes[which(encuesta$Grupo=="Estudiante")] , encuesta$Hora.llegada.Lunes[which(encuesta$Grupo=="Estudiante")], encuesta$Hora.salida.Martes[which(encuesta$Grupo=="Estudiante")], encuesta$Hora.salida.Lunes[which(encuesta$Grupo=="Estudiante")])
Miércoles <- t_medioEnEscuela(encuesta$Hora.llegada.Miércoles[which(encuesta$Grupo=="Estudiante")] , encuesta$Hora.llegada.Lunes[which(encuesta$Grupo=="Estudiante")], encuesta$Hora.salida.Miércoles[which(encuesta$Grupo=="Estudiante")], encuesta$Hora.salida.Lunes[which(encuesta$Grupo=="Estudiante")])
Jueves <- t_medioEnEscuela(encuesta$Hora.llegada.Jueves[which(encuesta$Grupo=="Estudiante")] , encuesta$Hora.llegada.Lunes[which(encuesta$Grupo=="Estudiante")], encuesta$Hora.salida.Jueves[which(encuesta$Grupo=="Estudiante")], encuesta$Hora.salida.Lunes[which(encuesta$Grupo=="Estudiante")])
Viernes <- t_medioEnEscuela(encuesta$Hora.llegada.Viernes[which(encuesta$Grupo=="Estudiante")] , encuesta$Hora.llegada.Lunes[which(encuesta$Grupo=="Estudiante")], encuesta$Hora.salida.Viernes[which(encuesta$Grupo=="Estudiante")], encuesta$Hora.salida.Lunes[which(encuesta$Grupo=="Estudiante")])

df_tMedio_Estudiante <- data.frame(t_medio, Lunes, Martes, Miércoles, Jueves, Viernes) 


########
#Tiempo medio en la universidad por grupo
########
library(chron)

#h_in <- Vector con las horas de entrada
#h_in_aux <- Columna del las horas de llegada del lunes para los valores NA
#h_out <- Vector con las horas de salida
#h_out_aux <- Columna del las horas de salida del lunes para los valores NA
t_medio_grupo <- function(h_in, h_in_aux, h_out, h_out_aux) {
  PDI_tmedio <- 0
  PAS_tmedio <- 0
  Estudiante_tmedio <- 0
  PDI <- 0
  PAS <- 0
  Est <- 0
  for(i in 1:length(h_in)){
    if(nchar(toString(h_in[i])) != 0){
      h_entrada <- h_in[i]
    }else{
      h_entrada <- h_in_aux[i]
    }
    if(nchar(toString(h_out[i])) != 0){
      h_salida <- h_out[i]
    }else{
      h_salida <- h_out_aux[i]
    }
    
    h_ent <- sapply(strsplit(toString(h_entrada),":"),
                    function(x) {
                      x <- as.numeric(x)
                      x[1]+x[2]/60
                    })
    
    h_sal <- sapply(strsplit(toString(h_salida),":"),
                    function(x) {
                      x <- as.numeric(x)
                      x[1]+x[2]/60
                    })
    
    tiempo <- h_sal-h_ent
    if(encuesta$Grupo[i] == "PDI"){
      PDI_tmedio <- PDI_tmedio + tiempo
      PDI <- PDI + 1
    }else if(encuesta$Grupo[i] == "PAS"){
      PAS_tmedio <- PAS_tmedio + tiempo
      PAS <- PAS + 1
    }else{
      if(nchar(toString(h_in[i])) != 0){
        h_entrada <- h_in[i]
      }else if(nchar(toString(encuesta$Hora.llegada.Martes[i])) != 0){
        h_entrada <- encuesta$Hora.llegada.Martes[i]
      }else{
        h_entrada <- h_in_aux[i]
      }
      if(nchar(toString(h_out[i])) != 0){
        h_salida <- h_out[i]
      }else if(nchar(toString(encuesta$Hora.salida.Martes[i])) != 0){
        h_salida <- encuesta$Hora.salida.Martes[i]
      }else{
        h_salida <- h_out_aux[i]
      }
      
      h_ent <- sapply(strsplit(toString(h_entrada),":"),
                      function(x) {
                        x <- as.numeric(x)
                        x[1]+x[2]/60
                      })
      
      h_sal <- sapply(strsplit(toString(h_salida),":"),
                      function(x) {
                        x <- as.numeric(x)
                        x[1]+x[2]/60
                      })
      tiempo <- h_sal-h_ent
      Estudiante_tmedio <- Estudiante_tmedio + tiempo
      Est <- Est + 1
    }
  }
  return(c(PDI_tmedio/PDI,PAS_tmedio/PAS,Estudiante_tmedio/Est))
}

#Tiempo medio del total
t_medio <- c("PDI", "PAS", "Estudiante")
Lunes <- t_medio_grupo(encuesta$Hora.llegada.Lunes, encuesta$Hora.llegada.Lunes, encuesta$Hora.salida.Lunes, encuesta$Hora.salida.Lunes)
Martes <- t_medio_grupo(encuesta$Hora.llegada.Martes , encuesta$Hora.llegada.Lunes, encuesta$Hora.salida.Martes, encuesta$Hora.salida.Lunes)
Miércoles <- t_medio_grupo(encuesta$Hora.llegada.MiÃ.rcoles , encuesta$Hora.llegada.Lunes, encuesta$Hora.salida.MiÃ.rcoles, encuesta$Hora.salida.Lunes)
Jueves <- t_medio_grupo(encuesta$Hora.llegada.Jueves , encuesta$Hora.llegada.Lunes, encuesta$Hora.salida.Jueves, encuesta$Hora.salida.Lunes)
Viernes <- t_medio_grupo(encuesta$Hora.llegada.Viernes , encuesta$Hora.llegada.Lunes, encuesta$Hora.salida.Viernes, encuesta$Hora.salida.Lunes)

df_tMedio_Grupos <- data.frame(t_medio, Lunes, Martes, Miércoles, Jueves, Viernes) 


########
#Quiénes conocen V2B, o V2H, o V2G
########

PDI_conoce <- 0
PAS_conoce <- 0
Estudiante_conoce <- 0
for(i in 1:length(encuesta[,1])){
  if(encuesta$Â.Conoces.las.aplicaciones.Vehicle.To.Grid..V2G..[i]!= "No" || encuesta$Â.Conoces.las.aplicaciones.Vehicle.To.Building.o.Vehicle.to.Home..V2B.V2H..[i] != "No"){
    if(encuesta$Grupo[i] == "PDI"){
      PDI_conoce <- PDI_conoce +1
    }else if(encuesta$Grupo[i] == "PAS"){
      PAS_conoce <- PAS_conoce +1
    }else{
      Estudiante_conoce <- Estudiante_conoce + 1
    }
  }
}

########
#Experiencia
########

#18-31
length(which(encuesta$Â.QuÃ..experiencia.previa.tienes.conduciendo.vehÃ.culos.elÃ.ctricos.[which(encuesta$Rango.de.Edad == "18-31")]=="He conducido alguno ocasionalmente (car2go, por ejemplo)"))

#32-44
length(which(encuesta$Â.QuÃ..experiencia.previa.tienes.conduciendo.vehÃ.culos.elÃ.ctricos.[which(encuesta$Rango.de.Edad == "32-44")]=="He conducido alguno ocasionalmente (car2go, por ejemplo)"))

#44-57
length(which(encuesta$Â.QuÃ..experiencia.previa.tienes.conduciendo.vehÃ.culos.elÃ.ctricos.[which(encuesta$Rango.de.Edad == "44-57")]=="He conducido alguno ocasionalmente (car2go, por ejemplo)"))

#58-70
length(which(encuesta$Â.QuÃ..experiencia.previa.tienes.conduciendo.vehÃ.culos.elÃ.ctricos.[which(encuesta$Rango.de.Edad == "58-70")]=="He conducido alguno ocasionalmente (car2go, por ejemplo)"))


########
#Factores que influirían
########


importante_VE <- function(data) {
  a<-0
  b<-0
  c<-0
  d<-0
  e<-0
  f<-0
  for(i in 1:length(data)){
    auxiliar <- strsplit(toString(data[i]), split=";")
    for(x in 1:length(auxiliar[[1]])){
      if(nchar(auxiliar[[1]][x])==13){
        a <- a + 1
      }else if(auxiliar[[1]][x]=="Su bajo consumo"){
        b <- b + 1
      }else if(auxiliar[[1]][x]=="Su facilidad de conducciÃ³n"){
        c <- c + 1
      }else if(nchar(auxiliar[[1]][x])==114){
        d <- d + 1
      }else if(nchar(auxiliar[[1]][x])==49){
        e <- e + 1
      }else{
        f <- f + 1 
      }
      
    }
  }
  return(c(a,b,c,d,e,f))
}

#18-31
v1831 <- importante_VE(encuesta$Â.QuÃ..factores.te.influirÃ.an.en.la.posible.compra.de.un.vehÃ.culo.elÃ.ctrico.[which(encuesta$Rango.de.Edad == "18-31")])

#32-44
v3244 <- importante_VE(encuesta$Â.QuÃ..factores.te.influirÃ.an.en.la.posible.compra.de.un.vehÃ.culo.elÃ.ctrico.[which(encuesta$Rango.de.Edad == "32-44")])

#44-57
v4457 <- importante_VE(encuesta$Â.QuÃ..factores.te.influirÃ.an.en.la.posible.compra.de.un.vehÃ.culo.elÃ.ctrico.[which(encuesta$Rango.de.Edad == "44-57")])

#58-70
v5870 <- importante_VE(encuesta$Â.QuÃ..factores.te.influirÃ.an.en.la.posible.compra.de.un.vehÃ.culo.elÃ.ctrico.[which(encuesta$Rango.de.Edad == "58-70")])

respuestas <- c("Su autonomía","Su bajo consumo","Su facilidad de conducción","Sus ventajas fiscales y de circulación  (menores impuestos, exento del pago en zona SER, acceso al bus VAO, etc.)","Su reducción de emisiones de gases contaminantes", "Comprobación")

df_factoresInf <- data.frame(respuestas,v1831,v3244,v4457,v5870)


########
#Autonomía por edades
########

autonomia_VE <- function(data) {
  a<-0
  b<-0
  c<-0
  d<-0
  e<-0
  f<-0
  for(i in 1:length(data)){
      if(data[i] == "<100 km"){
        a <- a + 1
      }else if(data[i] == "100-200 km"){
        b <- b + 1
      }else if(data[i] == "200-300 km"){
        c <- c + 1
      }else if(data[i] == "300 - 400 km"){
        d <- d + 1
      }else if(data[i] == "MÃ¡s de 400 km"){
        e <- e + 1
      }else{
        f <- f + 1 
      }
  }
  return(c(a,b,c,d,e,f))
}

#18-31
v1831 <- autonomia_VE(encuesta$Â.QuÃ..autonomÃ.a.tendrÃ.a.que.tener.el.coche.elÃ.ctrico.para.poder.ser.tu.opciÃ³n.de.movilidad.diaria.[which(encuesta$Rango.de.Edad == "18-31")])

#32-44
v3244 <- autonomia_VE(encuesta$Â.QuÃ..autonomÃ.a.tendrÃ.a.que.tener.el.coche.elÃ.ctrico.para.poder.ser.tu.opciÃ³n.de.movilidad.diaria.[which(encuesta$Rango.de.Edad == "32-44")])

#44-57
v4457 <- autonomia_VE(encuesta$Â.QuÃ..autonomÃ.a.tendrÃ.a.que.tener.el.coche.elÃ.ctrico.para.poder.ser.tu.opciÃ³n.de.movilidad.diaria.[which(encuesta$Rango.de.Edad  == "44-57")])

#58-70
v5870 <- autonomia_VE(encuesta$Â.QuÃ..autonomÃ.a.tendrÃ.a.que.tener.el.coche.elÃ.ctrico.para.poder.ser.tu.opciÃ³n.de.movilidad.diaria.[which(encuesta$Rango.de.Edad  == "58-70")])

respuestas <- c("<100 km","100-200km","200-300km","300-400km","Más de 400 km", "Comprobación")

df_autonomia <- data.frame(respuestas,v1831,v3244,v4457,v5870)


########
#Velocidad carga
########

velocidad_VE <- function(data) {
  a<-0
  b<-0
  c<-0
  d<-0
  e<-0
  
  for(i in 1:length(data)){
    if(data[i] == "<15 minutos"){
      a <- a + 1
    }else if(data[i] == "15-30 minutos"){
      b <- b + 1
    }else if(data[i] == "30-45 minutos"){
      c <- c + 1
    }else if(data[i] == "MÃ¡s de 1 hora"){
      d <- d + 1
    }else{
      e <- e + 1
    }
  }
  return(c(a,b,c,d,e))
}

#18-31
v1831 <- velocidad_VE(encuesta$Â.En.cuÃ.nto.tiempo.deberÃ.a.poder.recargarse.el.vehÃ.culo.elÃ.ctrico.para.que.lo.considerases.una.opciÃ³n.[which(encuesta$Rango.de.Edad == "18-31")])

#32-44
v3244 <- velocidad_VE(encuesta$Â.En.cuÃ.nto.tiempo.deberÃ.a.poder.recargarse.el.vehÃ.culo.elÃ.ctrico.para.que.lo.considerases.una.opciÃ³n.[which(encuesta$Rango.de.Edad == "32-44")])

#44-57
v4457 <- velocidad_VE(encuesta$Â.En.cuÃ.nto.tiempo.deberÃ.a.poder.recargarse.el.vehÃ.culo.elÃ.ctrico.para.que.lo.considerases.una.opciÃ³n.[which(encuesta$Rango.de.Edad  == "44-57")])

#58-70
v5870 <- autonomia_VE(encuesta$Â.QuÃ..autonomÃ.a.tendrÃ.a.que.tener.el.coche.elÃ.ctrico.para.poder.ser.tu.opciÃ³n.de.movilidad.diaria.[which(encuesta$Rango.de.Edad  == "58-70")])

respuestas <- c("<15 minutos","15-30 minutos","30-45 minutos","Más de una hora", "Comprobación")

df_autonomia <- data.frame(respuestas,v1831,v3244,v4457,v5870)


########
#Permites que te hagan cosas en el VE (V2G)
########

permites_VE <- function(data) {
  a<-0
  b<-0
  c<-0
  d<-0
  e<-0
  f<-0
  g<-0
  for(i in 1:length(data)){
    if(nchar(toString(data[i])) == 28){
      a <- a + 1
    }else if(nchar(toString(data[i])) == 57){
      b <- b + 1
    }else if(nchar(toString(data[i])) == 97){
      c <- c + 1
    }else if(nchar(toString(data[i])) == 74){
      d <- d + 1
    }else if(nchar(toString(data[i])) == 75){
        e <- e + 1
    }else if(nchar(toString(data[i])) == 19){
      f <- f + 1
    }else{
      g <- g + 1 
    }
  }
  return(c(a,b,c,d,e,f,g))
}

#18-31
v1831 <- permites_VE(encuesta$Si.fueses.propietario.de.un.vehÃ.culo.elÃ.ctrico.y.vinieses.diariamente.a.la.Escuela..Â.Te.interesarÃ.a.utilizarlo.en.este.tipo.de.sistemas..garantizando.un.nivel.de.carga.mÃ.nimo.cuando.cojas.tu.vehÃ.culo.para.volver.a.casa.[which(encuesta$Rango.de.Edad == "18-31")])

#32-44
v3244 <- permites_VE(encuesta$Si.fueses.propietario.de.un.vehÃ.culo.elÃ.ctrico.y.vinieses.diariamente.a.la.Escuela..Â.Te.interesarÃ.a.utilizarlo.en.este.tipo.de.sistemas..garantizando.un.nivel.de.carga.mÃ.nimo.cuando.cojas.tu.vehÃ.culo.para.volver.a.casa.[which(encuesta$Rango.de.Edad == "32-44")])

#44-57
v4457 <- permites_VE(encuesta$Si.fueses.propietario.de.un.vehÃ.culo.elÃ.ctrico.y.vinieses.diariamente.a.la.Escuela..Â.Te.interesarÃ.a.utilizarlo.en.este.tipo.de.sistemas..garantizando.un.nivel.de.carga.mÃ.nimo.cuando.cojas.tu.vehÃ.culo.para.volver.a.casa.[which(encuesta$Rango.de.Edad  == "44-57")])

#58-70
v5870 <- permites_VE(encuesta$Si.fueses.propietario.de.un.vehÃ.culo.elÃ.ctrico.y.vinieses.diariamente.a.la.Escuela..Â.Te.interesarÃ.a.utilizarlo.en.este.tipo.de.sistemas..garantizando.un.nivel.de.carga.mÃ.nimo.cuando.cojas.tu.vehÃ.culo.para.volver.a.casa.[which(encuesta$Rango.de.Edad  == "58-70")])

respuestas <- c("Sí, en cualquier condición","Sí, pero dependiendo del beneficio económico que genere","Si, siempre que se asegure un mínimo de carga disponible en las baterías, en cualquier momento.","No, porque perdería flexibilidad para disponer del coche cuando yo quiera","No, porque me preocupa el sobreciclado de las baterías y su envejecimiento","No, en ningún caso", "Comprobación")
                

df_permiso <- data.frame(respuestas,v1831,v3244,v4457,v5870)

