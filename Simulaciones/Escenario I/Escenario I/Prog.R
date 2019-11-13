library(readr)
library(ggplot2)

precio_energia <- read.csv("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/_R-GráficasConjuntas/precioEnergía4días.csv", header = T, sep = "\t")

invierno <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario I/invierno.txt", header = F, sep = "\t")
primavera <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario I/primavera.txt", header = F, sep = "\t")
verano <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario I/verano.txt", header = F, sep = "\t")
otoño <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario I/otoño.txt", header = F, sep = "\t")   
  
coche <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario I/coche.txt", header = F, sep = "\t")   


#############
#Estaciones:#
#############


invierno_vector = 1:24
primavera_vector = 1:24
verano_vector = 1:24
otoño_vector = 1:24

for (i in 1:24){
  invierno_vector[i] = as.double(strsplit(toString(invierno[i,1]), split ="     ")[[1]][3])
  primavera_vector[i] = as.double(strsplit(toString(primavera[i,1]), split ="     ")[[1]][3])
  verano_vector[i] = as.double(strsplit(toString(verano[i,1]), split ="     ")[[1]][3])
  otoño_vector[i] = as.double(strsplit(toString(otoño[i,1]), split ="     ")[[1]][3])
}

df_estaciones = data.frame(invierno_vector, primavera_vector, verano_vector,otoño_vector)

###########################################################################################################################
write.csv(df_estaciones,"df_estaciones.csv")
###########################################################################################################################

#Gráficos
win.metafile("graf4estaciones.wmf")
p <- ggplot()
p <- p+geom_line(data=df_estaciones, aes(x=1:24, y=invierno_vector, colour="Invierno"))+geom_point(data=df_estaciones, aes(x=1:24, y=invierno_vector),colour="blue")
p <- p+geom_line(data=df_estaciones, aes(x=1:24, y=primavera_vector, colour="Primavera"))+geom_point(data=df_estaciones, aes(x=1:24, y=primavera_vector),colour="green")
p <- p+geom_line(data=df_estaciones, aes(x=1:24, y=verano_vector, colour="Verano"))+geom_point(data=df_estaciones, aes(x=1:24, y=verano_vector),colour="red")
p <- p+geom_line(data=df_estaciones, aes(x=1:24, y=otoño_vector, colour="Otoño"))+geom_point(data=df_estaciones, aes(x=1:24, y=otoño_vector),colour="brown")
p <- p+xlab("Hora")+ylab("€")+ggtitle("Gasto/hora de ESCENARIO I")+theme(plot.title = element_text(hjust = 0.5))
p <- p+scale_colour_manual(name="",values=c("Invierno" = "blue","Primavera"="green", "Verano"="red", "Otoño"="brown"))
p
dev.off()


#########
#Coches:#
#########

horacoche <- 1:24
coche1_vector <- 1:24
coche2_vector <- 1:24
coche3_vector <- 1:24
coche4_vector <- 1:24
coche5_vector <- 1:24
coche6_vector <- 1:24

for(i in 1:24){
  coche1_vector[i] <- NA
  coche2_vector[i] <- NA
  coche3_vector[i] <- NA
  coche4_vector[i] <- NA
  coche5_vector[i] <- NA
  coche6_vector[i] <- NA
}


for(i in 1:length(coche[,1])){

  if(strsplit(strsplit(toString(coche[i,1]), split ="     ")[[1]][1], split=" ")[[1]][1] == 1){
    coche1_vector[as.integer(sub(".","", strsplit(strsplit(toString(coche[i,1]), split ="     ")[[1]][1], split=" ")[[1]][3]))] = as.double(strsplit(toString(coche[i,1]), split ="   ")[[1]][3])
  } else if(strsplit(strsplit(toString(coche[i,1]), split ="     ")[[1]][1], split=" ")[[1]][1] == 2){
    coche2_vector[as.integer(sub(".","", strsplit(strsplit(toString(coche[i,1]), split ="     ")[[1]][1], split=" ")[[1]][3]))] = as.double(strsplit(toString(coche[i,1]), split ="   ")[[1]][3])
  } else if(strsplit(strsplit(toString(coche[i,1]), split ="     ")[[1]][1], split=" ")[[1]][1] == 3){
    coche3_vector[as.integer(sub(".","", strsplit(strsplit(toString(coche[i,1]), split ="     ")[[1]][1], split=" ")[[1]][3]))] = as.double(strsplit(toString(coche[i,1]), split ="   ")[[1]][3])
  } else if(strsplit(strsplit(toString(coche[i,1]), split ="     ")[[1]][1], split=" ")[[1]][1] == 4){
    coche4_vector[as.integer(sub(".","", strsplit(strsplit(toString(coche[i,1]), split ="     ")[[1]][1], split=" ")[[1]][3]))] = as.double(strsplit(toString(coche[i,1]), split ="   ")[[1]][3])
  } else if(strsplit(strsplit(toString(coche[i,1]), split ="     ")[[1]][1], split=" ")[[1]][1] == 5){
    coche5_vector[as.integer(sub(".","", strsplit(strsplit(toString(coche[i,1]), split ="     ")[[1]][1], split=" ")[[1]][3]))] = as.double(strsplit(toString(coche[i,1]), split ="   ")[[1]][3])
  } else if(strsplit(strsplit(toString(coche[i,1]), split ="     ")[[1]][1], split=" ")[[1]][1] == 6){
    coche6_vector[as.integer(sub(".","", strsplit(strsplit(toString(coche[i,1]), split ="     ")[[1]][1], split=" ")[[1]][3]))] = as.double(strsplit(toString(coche[i,1]), split ="   ")[[1]][3])
  }
}

df_coche = data.frame(horacoche, coche1_vector, coche2_vector, coche3_vector, coche4_vector, coche5_vector, coche6_vector)

###########################################################################################################################
write.csv(df_coche,"df_coche.csv", na="")
###########################################################################################################################


#Gráficos
win.metafile("grafcoche.wmf")
p <- ggplot()
p <- p+geom_line(data=df_coche, aes(x=horacoche, y=coche1_vector, colour="VE 1"))+geom_point(data=df_coche, aes(x=horacoche, y=coche1_vector),colour="green")
p <- p+geom_line(data=df_coche, aes(x=horacoche, y=coche2_vector, colour="VE 2"))+geom_point(data=df_coche, aes(x=horacoche, y=coche2_vector),colour="blue")
p <- p+geom_line(data=df_coche, aes(x=horacoche, y=coche3_vector, colour="VE 3"))+geom_point(data=df_coche, aes(x=horacoche, y=coche3_vector),colour="red")
p <- p+geom_line(data=df_coche, aes(x=horacoche, y=coche4_vector, colour="VE 4"))+geom_point(data=df_coche, aes(x=horacoche, y=coche4_vector),colour="purple")
p <- p+geom_line(data=df_coche, aes(x=horacoche, y=coche5_vector, colour="VE 5"))+geom_point(data=df_coche, aes(x=horacoche, y=coche5_vector),colour="black")
p <- p+geom_line(data=df_coche, aes(x=horacoche, y=coche6_vector, colour="VE 6"))+geom_point(data=df_coche, aes(x=horacoche, y=coche6_vector),colour="orange")
p <- p+xlab("Hora")+ylab("kWh")+ggtitle("SoC en ESCENARIO I")+theme(plot.title = element_text(hjust = 0.5))
p <- p+scale_colour_manual(name="",values=c("VE 1" = "green","VE 2"="blue", "VE 3"="red", "VE 4"="purple", "VE 5"="black", "VE 6"="orange"))
p
dev.off()


