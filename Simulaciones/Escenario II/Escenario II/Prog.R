library(readr)
library(ggplot2)


# Multiple plot function
#
# ggplot objects can be passed in ..., or to plotlist (as a list of ggplot objects)
# - cols:   Number of columns in layout
# - layout: A matrix specifying the layout. If present, 'cols' is ignored.
#
# If the layout is something like matrix(c(1,2,3,3), nrow=2, byrow=TRUE),
# then plot 1 will go in the upper left, 2 will go in the upper right, and
# 3 will go all the way across the bottom.
#
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}

invierno <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario II/invierno.txt", header = F, sep = "\t")
primavera <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario II/primavera.txt", header = F, sep = "\t")
verano <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario II/verano.txt", header = F, sep = "\t")
otoño <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario II/otoño.txt", header = F, sep = "\t")   
  
coche_inv <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario II/coche_inv.txt", header = F, sep = "\t")   
coche_pri <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario II/coche_pri.txt", header = F, sep = "\t")   
coche_ver <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario II/coche_ver.txt", header = F, sep = "\t")   
coche_oto <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario II/coche_oto.txt", header = F, sep = "\t")   


#############
#Estaciones:#
#############


invierno_vector = 1:24
primavera_vector = 1:24
verano_vector = 1:24
otoño_vector = 1:24

for (i in 1:24){
  invierno_vector[i] = as.double(strsplit(strsplit(toString(invierno[i,1]), split ="INF")[[1]][1], split="   ")[[1]][length(strsplit(strsplit(toString(invierno[i,1]), split ="INF")[[1]][1], split="   ")[[1]])-1])
  primavera_vector[i] = as.double(strsplit(strsplit(toString(primavera[i,1]), split ="INF")[[1]][1], split="   ")[[1]][length(strsplit(strsplit(toString(primavera[i,1]), split ="INF")[[1]][1], split="   ")[[1]])-1])
  verano_vector[i] = as.double(strsplit(strsplit(toString(verano[i,1]), split ="INF")[[1]][1], split="   ")[[1]][length(strsplit(strsplit(toString(verano[i,1]), split ="INF")[[1]][1], split="   ")[[1]])-1])
  otoño_vector[i] = as.double(strsplit(strsplit(toString(otoño[i,1]), split ="INF")[[1]][1], split="   ")[[1]][length(strsplit(strsplit(toString(otoño[i,1]), split ="INF")[[1]][1], split="   ")[[1]])-1])
}

df_estaciones = data.frame(invierno_vector, primavera_vector, verano_vector,otoño_vector)



#Gráficos
win.metafile("graf4estaciones.wmf")
p <- ggplot()
p <- p+geom_line(data=df_estaciones, aes(x=1:24, y=invierno_vector, colour="Invierno"))+geom_point(data=df_estaciones, aes(x=1:24, y=invierno_vector),colour="blue")
p <- p+geom_line(data=df_estaciones, aes(x=1:24, y=primavera_vector, colour="Primavera"))+geom_point(data=df_estaciones, aes(x=1:24, y=primavera_vector),colour="green")
p <- p+geom_line(data=df_estaciones, aes(x=1:24, y=verano_vector, colour="Verano"))+geom_point(data=df_estaciones, aes(x=1:24, y=verano_vector),colour="red")
p <- p+geom_line(data=df_estaciones, aes(x=1:24, y=otoño_vector, colour="Otoño"))+geom_point(data=df_estaciones, aes(x=1:24, y=otoño_vector),colour="brown")
p <- p+xlab("Hora")+ylab("€")+ggtitle("Gasto/hora de ESCENARIO II")+theme(plot.title = element_text(hjust = 0.5))
p <- p+scale_colour_manual(name="",values=c("Invierno" = "blue","Primavera"="green", "Verano"="red", "Otoño"="brown"))
p
dev.off()


#########
#Coches:#
#########

df_coche = data.frame(coche_inv,coche_pri, coche_ver, coche_oto)

for(t in 1:4){

 coche <- df_coche[,t]

 horacoche <- 1:24
 coche1_vector <- 1:24
 coche2_vector <- 1:24
 coche3_vector <- 1:24
 coche4_vector <- 1:24
 coche5_vector <- 1:24
 coche6_vector <- 1:24

 
 for(i in 1:length(coche)){

  if(strsplit(strsplit(toString(coche[i]), split ="     ")[[1]][1], split=" ")[[1]][1] == 1){
    coche1_vector[as.integer(sub(".","", strsplit(strsplit(toString(coche[i]), split ="     ")[[1]][1], split=" ")[[1]][3]))] = as.double(strsplit(strsplit(toString(coche[i]), split ="INF")[[1]][1], split="   ")[[1]][length(strsplit(strsplit(toString(coche[i]), split ="INF")[[1]][1], split="   ")[[1]])-1])
  } else if(strsplit(strsplit(toString(coche[i]), split ="     ")[[1]][1], split=" ")[[1]][1] == 2){
    coche2_vector[as.integer(sub(".","", strsplit(strsplit(toString(coche[i]), split ="     ")[[1]][1], split=" ")[[1]][3]))] = as.double(strsplit(strsplit(toString(coche[i]), split ="INF")[[1]][1], split="   ")[[1]][length(strsplit(strsplit(toString(coche[i]), split ="INF")[[1]][1], split="   ")[[1]])-1])
  } else if(strsplit(strsplit(toString(coche[i]), split ="     ")[[1]][1], split=" ")[[1]][1] == 3){
    coche3_vector[as.integer(sub(".","", strsplit(strsplit(toString(coche[i]), split ="     ")[[1]][1], split=" ")[[1]][3]))] = as.double(strsplit(strsplit(toString(coche[i]), split ="INF")[[1]][1], split="   ")[[1]][length(strsplit(strsplit(toString(coche[i]), split ="INF")[[1]][1], split="   ")[[1]])-1])
  } else if(strsplit(strsplit(toString(coche[i]), split ="     ")[[1]][1], split=" ")[[1]][1] == 4){
    coche4_vector[as.integer(sub(".","", strsplit(strsplit(toString(coche[i]), split ="     ")[[1]][1], split=" ")[[1]][3]))] = as.double(strsplit(strsplit(toString(coche[i]), split ="INF")[[1]][1], split="   ")[[1]][length(strsplit(strsplit(toString(coche[i]), split ="INF")[[1]][1], split="   ")[[1]])-1])
  } else if(strsplit(strsplit(toString(coche[i]), split ="     ")[[1]][1], split=" ")[[1]][1] == 5){
    coche5_vector[as.integer(sub(".","", strsplit(strsplit(toString(coche[i]), split ="     ")[[1]][1], split=" ")[[1]][3]))] = as.double(strsplit(strsplit(toString(coche[i]), split ="INF")[[1]][1], split="   ")[[1]][length(strsplit(strsplit(toString(coche[i]), split ="INF")[[1]][1], split="   ")[[1]])-1])
  } else if(strsplit(strsplit(toString(coche[i]), split ="     ")[[1]][1], split=" ")[[1]][1] == 6){
    coche6_vector[as.integer(sub(".","", strsplit(strsplit(toString(coche[i]), split ="     ")[[1]][1], split=" ")[[1]][3]))] = as.double(strsplit(strsplit(toString(coche[i]), split ="INF")[[1]][1], split="   ")[[1]][length(strsplit(strsplit(toString(coche[i]), split ="INF")[[1]][1], split="   ")[[1]])-1])
  }
 }

 coche1_vector[8] = strsplit(toString(coche[8]), split ="   ")[[1]][3]
 coche2_vector[9] = strsplit(toString(coche[33]), split ="   ")[[1]][3]
 coche3_vector[9] = strsplit(toString(coche[57]), split ="   ")[[1]][3]
 coche4_vector[9] = strsplit(toString(coche[81]), split ="   ")[[1]][3]
 coche5_vector[6] = strsplit(toString(coche[102]), split ="   ")[[1]][3]
 coche6_vector[15] = strsplit(toString(coche[135]), split ="   ")[[1]][3]
 
 for(i in 1:24){
   if(i < 8 || i > 19){
   coche1_vector[i] <- NA
   }
   if(i < 9 || i > 16){
   coche2_vector[i] <- NA
   }
   if(i < 9 || i > 19){
   coche3_vector[i] <- NA
   }
   if(i < 9 || i > 17){
   coche4_vector[i] <- NA
   }
   if(i < 6 || i > 15){
   coche5_vector[i] <- NA
   }
   if(i < 15 || i > 21){
   coche6_vector[i] <- NA
   }
 }
 
 
 if(t == 1){
  df_coche_inv = data.frame(horacoche, coche1_vector, coche2_vector, coche3_vector, coche4_vector, coche5_vector, coche6_vector)
  indx <- sapply(df_coche_inv, is.factor)
  df_coche_inv[indx] <- lapply(df_coche_inv[indx], function(x) as.numeric(as.character(x)))
 }else if(t==2){
  df_coche_pri = data.frame(horacoche, coche1_vector, coche2_vector, coche3_vector, coche4_vector, coche5_vector, coche6_vector)
  indx <- sapply(df_coche_pri, is.factor)
  df_coche_pri[indx] <- lapply(df_coche_pri[indx], function(x) as.numeric(as.character(x)))
 }else if(t==3){
  df_coche_ver = data.frame(horacoche, coche1_vector, coche2_vector, coche3_vector, coche4_vector, coche5_vector, coche6_vector)
  indx <- sapply(df_coche_ver, is.factor)
  df_coche_ver[indx] <- lapply(df_coche_ver[indx], function(x) as.numeric(as.character(x)))
  }else if(t==4){
  df_coche_oto = data.frame(horacoche, coche1_vector, coche2_vector, coche3_vector, coche4_vector, coche5_vector, coche6_vector)
  indx <- sapply(df_coche_oto, is.factor)
  df_coche_oto[indx] <- lapply(df_coche_oto[indx], function(x) as.numeric(as.character(x)))
 }

}

#Gráficos

precio_energia <- read.csv("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/_R-GráficasConjuntas/precioEnergía4días.csv", header = T, sep = "\t")
precio_energia$p_invierno = precio_energia$p_invierno*100
precio_energia$p_primavera = precio_energia$p_primavera*100
precio_energia$p_verano = precio_energia$p_verano*100
precio_energia$p_otoño = precio_energia$p_otoño*100
SoC_max <- rep(24,24)
SoC_min <- rep(4.8,24)

p1 <- ggplot()
p1 <- p1+geom_line(data=precio_energia, aes(x=1:24, y=p_invierno), colour="grey")
p1 <- p1+geom_line(aes(x=1:24,y=SoC_max), colour="orchid")
p1 <- p1+geom_line(aes(x=1:24,y=SoC_min), colour="orchid")
p1 <- p1+geom_line(data=df_coche_inv, aes(x=horacoche, y=coche1_vector), colour="green")+geom_point(data=df_coche_inv, aes(x=horacoche, y=coche1_vector),colour="green")
p1 <- p1+geom_line(data=df_coche_inv, aes(x=horacoche, y=coche2_vector), colour="blue")+geom_point(data=df_coche_inv, aes(x=horacoche, y=coche2_vector),colour="blue")
p1 <- p1+geom_line(data=df_coche_inv, aes(x=horacoche, y=coche3_vector), colour="red")+geom_point(data=df_coche_inv, aes(x=horacoche, y=coche3_vector),colour="red")
p1 <- p1+geom_line(data=df_coche_inv, aes(x=horacoche, y=coche4_vector), colour="purple")+geom_point(data=df_coche_inv, aes(x=horacoche, y=coche4_vector),colour="purple")
p1 <- p1+geom_line(data=df_coche_inv, aes(x=horacoche, y=coche5_vector), colour="black")+geom_point(data=df_coche_inv, aes(x=horacoche, y=coche5_vector),colour="black")
p1 <- p1+geom_line(data=df_coche_inv, aes(x=horacoche, y=coche6_vector), colour="orange")+geom_point(data=df_coche_inv, aes(x=horacoche, y=coche6_vector),colour="orange")
p1 <- p1+ylim(0,24)+xlab("Hora")+ylab("kWh | cént./kWh")+ggtitle("SoC en INVIERNO")+theme(plot.title = element_text(hjust = 0.5))
#p1 <- p1+scale_colour_manual(name="",values=c("VE 1" = "green","VE 2"="blue", "VE 3"="red", "VE 4"="purple", "VE 5"="black", "VE 6"="orange"))
p1





p2 <- ggplot()
p2 <- p2+geom_line(data=precio_energia, aes(x=1:24, y=p_primavera), colour="grey")
p2 <- p2+geom_line(aes(x=1:24,y=SoC_max), colour="orchid")
p2 <- p2+geom_line(aes(x=1:24,y=SoC_min), colour="orchid")
p2 <- p2+geom_line(data=df_coche_pri, aes(x=horacoche, y=coche1_vector), colour="green")+geom_point(data=df_coche_pri, aes(x=horacoche, y=coche1_vector),colour="green")
p2 <- p2+geom_line(data=df_coche_pri, aes(x=horacoche, y=coche2_vector), colour="blue")+geom_point(data=df_coche_pri, aes(x=horacoche, y=coche2_vector),colour="blue")
p2 <- p2+geom_line(data=df_coche_pri, aes(x=horacoche, y=coche3_vector), colour="red")+geom_point(data=df_coche_pri, aes(x=horacoche, y=coche3_vector),colour="red")
p2 <- p2+geom_line(data=df_coche_pri, aes(x=horacoche, y=coche4_vector), colour="purple")+geom_point(data=df_coche_pri, aes(x=horacoche, y=coche4_vector),colour="purple")
p2 <- p2+geom_line(data=df_coche_pri, aes(x=horacoche, y=coche5_vector), colour="black")+geom_point(data=df_coche_pri, aes(x=horacoche, y=coche5_vector),colour="black")
p2 <- p2+geom_line(data=df_coche_pri, aes(x=horacoche, y=coche6_vector), colour="orange")+geom_point(data=df_coche_pri, aes(x=horacoche, y=coche6_vector),colour="orange")
p2 <- p2+ylim(0,24)+xlab("Hora")+ylab("kWh | cént./kWh")+ggtitle("SoC en PRIMAVERA")+theme(plot.title = element_text(hjust = 0.5))
#p2 <- p2+scale_colour_manual(name="",values=c("VE 1" = "green","VE 2"="blue", "VE 3"="red", "VE 4"="purple", "VE 5"="black", "VE 6"="orange"))
p2



p3 <- ggplot()
p3 <- p3+geom_line(data=precio_energia, aes(x=1:24, y=p_verano), colour="grey")
p3 <- p3+geom_line(aes(x=1:24,y=SoC_max), colour="orchid")
p3 <- p3+geom_line(aes(x=1:24,y=SoC_min), colour="orchid")
p3 <- p3+geom_line(data=df_coche_ver, aes(x=horacoche, y=coche1_vector), colour="green")+geom_point(data=df_coche_ver, aes(x=horacoche, y=coche1_vector),colour="green")
p3 <- p3+geom_line(data=df_coche_ver, aes(x=horacoche, y=coche2_vector), colour="blue")+geom_point(data=df_coche_ver, aes(x=horacoche, y=coche2_vector),colour="blue")
p3 <- p3+geom_line(data=df_coche_ver, aes(x=horacoche, y=coche3_vector), colour="red")+geom_point(data=df_coche_ver, aes(x=horacoche, y=coche3_vector),colour="red")
p3 <- p3+geom_line(data=df_coche_ver, aes(x=horacoche, y=coche4_vector), colour="purple")+geom_point(data=df_coche_ver, aes(x=horacoche, y=coche4_vector),colour="purple")
p3 <- p3+geom_line(data=df_coche_ver, aes(x=horacoche, y=coche5_vector), colour="black")+geom_point(data=df_coche_ver, aes(x=horacoche, y=coche5_vector),colour="black")
p3 <- p3+geom_line(data=df_coche_ver, aes(x=horacoche, y=coche6_vector), colour="orange")+geom_point(data=df_coche_ver, aes(x=horacoche, y=coche6_vector),colour="orange")
p3 <- p3+ylim(0,24)+xlab("Hora")+ylab("kWh | cént./kWh")+ggtitle("SoC en VERANO")+theme(plot.title = element_text(hjust = 0.5))
#p3 <- p3+scale_colour_manual(name="",values=c("VE 1" = "green","VE 2"="blue", "VE 3"="red", "VE 4"="purple", "VE 5"="black", "VE 6"="orange"))
p3



p4 <- ggplot()
p4 <- p4+geom_line(data=precio_energia, aes(x=1:24, y=p_otoño), colour="grey")
p4 <- p4+geom_line(aes(x=1:24,y=SoC_max), colour="orchid")
p4 <- p4+geom_line(aes(x=1:24,y=SoC_min), colour="orchid")
p4 <- p4+geom_line(data=df_coche_oto, aes(x=horacoche, y=coche1_vector), colour="green")+geom_point(data=df_coche_oto, aes(x=horacoche, y=coche1_vector),colour="green")
p4 <- p4+geom_line(data=df_coche_oto, aes(x=horacoche, y=coche2_vector), colour="blue")+geom_point(data=df_coche_oto, aes(x=horacoche, y=coche2_vector),colour="blue")
p4 <- p4+geom_line(data=df_coche_oto, aes(x=horacoche, y=coche3_vector), colour="red")+geom_point(data=df_coche_oto, aes(x=horacoche, y=coche3_vector),colour="red")
p4 <- p4+geom_line(data=df_coche_oto, aes(x=horacoche, y=coche4_vector), colour="purple")+geom_point(data=df_coche_oto, aes(x=horacoche, y=coche4_vector),colour="purple")
p4 <- p4+geom_line(data=df_coche_oto, aes(x=horacoche, y=coche5_vector), colour="black")+geom_point(data=df_coche_oto, aes(x=horacoche, y=coche5_vector),colour="black")
p4 <- p4+geom_line(data=df_coche_oto, aes(x=horacoche, y=coche6_vector), colour="orange")+geom_point(data=df_coche_oto, aes(x=horacoche, y=coche6_vector),colour="orange")
p4 <- p4+ylim(0,24)+xlab("Hora")+ylab("kWh | cént./kWh")+ggtitle("SoC en OTOÑO")+theme(plot.title = element_text(hjust = 0.5))
#p4 <- p4+scale_colour_manual(name="",values=c("VE 1" = "green","VE 2"="blue", "VE 3"="red", "VE 4"="purple", "VE 5"="black", "VE 6"="orange"))
p4


win.metafile("grafcoche.wmf")
multiplot(p1, p3, p2, p4, cols=2)
dev.off()




###########################################################################################################################
write.csv(df_estaciones,"df_estaciones.csv")
write.csv(df_coche_pri,"df_coche.csv", na="")




