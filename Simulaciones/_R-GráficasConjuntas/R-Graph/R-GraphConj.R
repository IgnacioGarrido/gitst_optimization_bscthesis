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

precio_energia <- read.csv("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/_R-GráficasConjuntas/precioEnergía4días.csv", header = T, sep = "\t")

precio_energia$p_invierno = precio_energia$p_invierno*450
precio_energia$p_primavera = precio_energia$p_primavera*450
precio_energia$p_verano = precio_energia$p_verano*450
precio_energia$p_otoño = precio_energia$p_otoño*450


###############################
##########E_SinCoches
###############################

invierno <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/ProgSinCoches/invierno.txt", header = F, sep = "\t")
primavera <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/ProgSinCoches/primavera.txt", header = F, sep = "\t")
verano <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/ProgSinCoches/verano.txt", header = F, sep = "\t")
otoño <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/ProgSinCoches/otoño.txt", header = F, sep = "\t")   



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

df_estaciones_sinCoches <- data.frame(invierno_vector, primavera_vector, verano_vector,otoño_vector)

###############################
##########E_1
###############################

invierno <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario I/invierno.txt", header = F, sep = "\t")
primavera <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario I/primavera.txt", header = F, sep = "\t")
verano <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario I/verano.txt", header = F, sep = "\t")
otoño <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario I/otoño.txt", header = F, sep = "\t")   

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

df_estaciones_E1 = data.frame(invierno_vector, primavera_vector, verano_vector,otoño_vector)

###############################
##########E_2
###############################

invierno <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario II/invierno.txt", header = F, sep = "\t")
primavera <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario II/primavera.txt", header = F, sep = "\t")
verano <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario II/verano.txt", header = F, sep = "\t")
otoño <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario II/otoño.txt", header = F, sep = "\t")   

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

df_estaciones_E2 = data.frame(invierno_vector, primavera_vector, verano_vector,otoño_vector)

###############################
##########E_3
###############################


invierno <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario III/invierno.txt", header = F, sep = "\t")
primavera <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario III/primavera.txt", header = F, sep = "\t")
verano <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario III/verano.txt", header = F, sep = "\t")
otoño <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario III/otoño.txt", header = F, sep = "\t")   

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

df_estaciones_E3 = data.frame(invierno_vector, primavera_vector, verano_vector,otoño_vector)



###############################
##########E_4
###############################

invierno <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario IV/invierno.txt", header = F, sep = "\t")
primavera <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario IV/primavera.txt", header = F, sep = "\t")
verano <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario IV/verano.txt", header = F, sep = "\t")
otoño <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario IV/otoño.txt", header = F, sep = "\t")   

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

df_estaciones_E4 = data.frame(invierno_vector, primavera_vector, verano_vector,otoño_vector)


###############################
##########E_5
###############################


invierno <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario V/invierno.txt", header = F, sep = "\t")
primavera <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario V/primavera.txt", header = F, sep = "\t")
verano <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario V/verano.txt", header = F, sep = "\t")
otoño <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario V/otoño.txt", header = F, sep = "\t")   

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

df_estaciones_E5 = data.frame(invierno_vector, primavera_vector, verano_vector,otoño_vector)



###############################
##########E_6
###############################

invierno <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario VI/invierno.txt", header = F, sep = "\t")
primavera <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario VI/primavera.txt", header = F, sep = "\t")
verano <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario VI/verano.txt", header = F, sep = "\t")
otoño <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Escenario VI/otoño.txt", header = F, sep = "\t")   


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

df_estaciones_E6 = data.frame(invierno_vector, primavera_vector, verano_vector,otoño_vector)


###############################
##########PLOT
###############################

#Gráficos
p1 <- ggplot()
p1 <- p1+geom_line(data=precio_energia, aes(x=1:24, y=p_invierno), colour="grey")
p1 <- p1+geom_line(data=df_estaciones_sinCoches, aes(x=1:24, y=invierno_vector), colour="blue")#+geom_point(data=df_estaciones_sinCoches, aes(x=1:24, y=invierno_vector),colour="blue")
p1 <- p1+geom_line(data=df_estaciones_E1, aes(x=1:24, y=invierno_vector), colour="green")#+geom_point(data=df_estaciones_E1, aes(x=1:24, y=invierno_vector),colour="green")
p1 <- p1+geom_line(data=df_estaciones_E2, aes(x=1:24, y=invierno_vector), colour="red")#+geom_point(data=df_estaciones_E2, aes(x=1:24, y=invierno_vector),colour="red")
p1 <- p1+geom_line(data=df_estaciones_E3, aes(x=1:24, y=invierno_vector), colour="brown")#+geom_point(data=df_estaciones_E3, aes(x=1:24, y=invierno_vector),colour="brown")
p1 <- p1+geom_line(data=df_estaciones_E4, aes(x=1:24, y=invierno_vector), colour="yellow")#+geom_point(data=df_estaciones_E4, aes(x=1:24, y=invierno_vector),colour="yellow")
p1 <- p1+geom_line(data=df_estaciones_E5, aes(x=1:24, y=invierno_vector), colour="black")#+geom_point(data=df_estaciones_E5, aes(x=1:24, y=invierno_vector),colour="black")
p1 <- p1+geom_line(data=df_estaciones_E6, aes(x=1:24, y=invierno_vector), colour="orange")#+geom_point(data=df_estaciones_E6, aes(x=1:24, y=invierno_vector),colour="orange")
p1 <- p1+ylim(0,80)+xlab("Hora")+ylab("€")+ggtitle("Gasto/hora INVIERNO")+theme(plot.title = element_text(hjust = 0.5))
#p1 <- p1+scale_colour_manual(name="",values=c("E. sin VE" = "blue","E. I"="green", "E. II"="red", "E. III"="brown","E. IV"="yellow", "E. V"="black", "E. VI"="orange"))
p1

p2 <- ggplot()
p2 <- p2+geom_line(data=precio_energia, aes(x=1:24, y=p_primavera), colour="grey")
p2 <- p2+geom_line(data=df_estaciones_sinCoches, aes(x=1:24, y=primavera_vector), colour="blue")#+geom_point(data=df_estaciones_sinCoches, aes(x=1:24, y=primavera_vector),colour="blue")
p2 <- p2+geom_line(data=df_estaciones_E1, aes(x=1:24, y=primavera_vector), colour="green")#+geom_point(data=df_estaciones_E1, aes(x=1:24, y=primavera_vector),colour="green")
p2 <- p2+geom_line(data=df_estaciones_E2, aes(x=1:24, y=primavera_vector), colour="red")#+geom_point(data=df_estaciones_E2, aes(x=1:24, y=primavera_vector),colour="red")
p2 <- p2+geom_line(data=df_estaciones_E3, aes(x=1:24, y=primavera_vector), colour="brown")#+geom_point(data=df_estaciones_E3, aes(x=1:24, y=primavera_vector),colour="brown")
p2 <- p2+geom_line(data=df_estaciones_E4, aes(x=1:24, y=primavera_vector), colour="yellow")#+geom_point(data=df_estaciones_E4, aes(x=1:24, y=primavera_vector),colour="yellow")
p2 <- p2+geom_line(data=df_estaciones_E5, aes(x=1:24, y=primavera_vector), colour="black")#+geom_point(data=df_estaciones_E5, aes(x=1:24, y=primavera_vector),colour="black")
p2 <- p2+geom_line(data=df_estaciones_E6, aes(x=1:24, y=primavera_vector), colour="orange")#+geom_point(data=df_estaciones_E6, aes(x=1:24, y=primavera_vector),colour="orange")
p2 <- p2+ylim(0,80)+xlab("Hora")+ylab("€")+ggtitle("Gasto/hora PRIMAVERA")+theme(plot.title = element_text(hjust = 0.5))
#p2 <- p2+scale_colour_manual(name="",values=c("E. sin VE" = "blue","E. 1"="green", "E. 2"="red", "E. 3"="brown","E. 4"="yellow", "E. 5"="black", "E. 6"="orange"))
p2


p3 <- ggplot()
p3 <- p3+geom_line(data=precio_energia, aes(x=1:24, y=p_verano), colour="grey")
p3 <- p3+geom_line(data=df_estaciones_sinCoches, aes(x=1:24, y=verano_vector), colour="blue")#+geom_point(data=df_estaciones_sinCoches, aes(x=1:24, y=verano_vector),colour="blue")
p3 <- p3+geom_line(data=df_estaciones_E1, aes(x=1:24, y=verano_vector), colour="green")#+geom_point(data=df_estaciones_E1, aes(x=1:24, y=verano_vector),colour="green")
p3 <- p3+geom_line(data=df_estaciones_E2, aes(x=1:24, y=verano_vector), colour="red")#+geom_point(data=df_estaciones_E2, aes(x=1:24, y=verano_vector),colour="red")
p3 <- p3+geom_line(data=df_estaciones_E3, aes(x=1:24, y=verano_vector), colour="brown")#+geom_point(data=df_estaciones_E3, aes(x=1:24, y=verano_vector),colour="brown")
p3 <- p3+geom_line(data=df_estaciones_E4, aes(x=1:24, y=verano_vector), colour="yellow")#+geom_point(data=df_estaciones_E4, aes(x=1:24, y=verano_vector),colour="yellow")
p3 <- p3+geom_line(data=df_estaciones_E5, aes(x=1:24, y=verano_vector), colour="black")#+geom_point(data=df_estaciones_E5, aes(x=1:24, y=verano_vector),colour="black")
p3 <- p3+geom_line(data=df_estaciones_E6, aes(x=1:24, y=verano_vector), colour="orange")#+geom_point(data=df_estaciones_E6, aes(x=1:24, y=verano_vector),colour="orange")
p3 <- p3+ylim(0,80)+xlab("Hora")+ylab("€")+ggtitle("Gasto/hora VERANO")+theme(plot.title = element_text(hjust = 0.5))
#p3 <- p3+scale_colour_manual(name="",values=c("E. sin VE" = "blue","E. 1"="green", "E. 2"="red", "E. 3"="brown","E. 4"="yellow", "E. 5"="black", "E. 6"="orange"))
p3


p4 <- ggplot()
p4 <- p4+geom_line(data=precio_energia, aes(x=1:24, y=p_otoño), colour="grey")
p4 <- p4+geom_line(data=df_estaciones_sinCoches, aes(x=1:24, y=otoño_vector), colour="blue")#+geom_point(data=df_estaciones_sinCoches, aes(x=1:24, y=otoño_vector),colour="blue")
p4 <- p4+geom_line(data=df_estaciones_E1, aes(x=1:24, y=otoño_vector), colour="green")#+geom_point(data=df_estaciones_E1, aes(x=1:24, y=otoño_vector),colour="green")
p4 <- p4+geom_line(data=df_estaciones_E2, aes(x=1:24, y=otoño_vector), colour="red")#+geom_point(data=df_estaciones_E2, aes(x=1:24, y=otoño_vector),colour="red")
p4 <- p4+geom_line(data=df_estaciones_E3, aes(x=1:24, y=otoño_vector), colour="brown")#+geom_point(data=df_estaciones_E3, aes(x=1:24, y=otoño_vector),colour="brown")
p4 <- p4+geom_line(data=df_estaciones_E4, aes(x=1:24, y=otoño_vector), colour="yellow")#+geom_point(data=df_estaciones_E4, aes(x=1:24, y=otoño_vector),colour="yellow")
p4 <- p4+geom_line(data=df_estaciones_E5, aes(x=1:24, y=otoño_vector), colour="black")#+geom_point(data=df_estaciones_E5, aes(x=1:24, y=otoño_vector),colour="black")
p4 <- p4+geom_line(data=df_estaciones_E6, aes(x=1:24, y=otoño_vector), colour="orange")#+geom_point(data=df_estaciones_E6, aes(x=1:24, y=otoño_vector),colour="orange")
p4 <- p4+ylim(0,80)+xlab("Hora")+ylab("€")+ggtitle("Gasto/hora OTOÑO")+theme(plot.title = element_text(hjust = 0.5))
#p4 <- p4+scale_colour_manual(name="",values=c("E. sin VE" = "blue","E. 1"="green", "E. 2"="red", "E. 3"="brown","E. 4"="yellow", "E. 5"="black", "E. 6"="orange"))
p4




win.metafile("grafEstaciones7Escenarios.wmf")
multiplot(p1, p3, p2, p4, cols=2)
dev.off()




