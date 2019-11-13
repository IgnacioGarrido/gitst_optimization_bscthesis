library("readr")
library("ggplot2")

E4_invierno <- read.csv("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Prog_Matlab/E4_invierno.csv", header = F, sep = ",")
E4_primavera <- read.csv("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Prog_Matlab/E4_primavera.csv", header = F, sep = ",")
E4_verano <- read.csv("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Prog_Matlab/E4_verano.csv", header = F, sep = ",")
E4_otoño <- read.csv("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Prog_Matlab/E4_otoño.csv", header = F, sep = ",")

E5_invierno <- read.csv("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Prog_Matlab/E5_invierno.csv", header = F, sep = ",")
E5_primavera <- read.csv("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Prog_Matlab/E5_primavera.csv", header = F, sep = ",")
E5_verano <- read.csv("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Prog_Matlab/E5_verano.csv", header = F, sep = ",")
E5_otoño <- read.csv("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/Resultados simulaciones/Prog_Matlab/E5_otoño.csv", header = F, sep = ",")


#Se cambian los valores 0 por 18 (Son no optimizables)
for(n in 1:4){
 for(i in 1:24){
 if(E4_invierno[n,i]=="17.998"){ 
   E4_invierno[n,i] <-"18"
  }
  if(E4_primavera[n,i]=="17.998"){ 
    E4_primavera[n,i] <-"18"
  } 
  if(E4_verano[n,i]=="17.998"){ 
    E4_verano[n,i] <-"18"
  }
  if(E4_otoño[n,i]=="17.998"){ 
    E4_otoño[n,i]<-"18"
  }
 }
}

#Se cambian los valores 17.998 por 18 (Son no optimizables)
for(n in 1:4){
    for(i in 1:24){
      if(E5_invierno[n,i]=="17.998"){ 
        E5_invierno[n,i] <-"18"
      }
      if(E5_primavera[n,i]=="17.998"){ 
        E5_primavera[n,i] <-"18"
      } 
      if(E5_verano[n,i]=="17.998"){ 
        E5_verano[n,i] <-"18"
      }
      if(E5_otoño[n,i]=="17.998"){ 
        E5_otoño[n,i]<-"18"
      }
    }
  
}

#Se guardan en un dataframe único (de 11:00 a 22:00)####

df_E4 <- data.frame(E4_invierno[,11:22])
df_E4 <- rbind(df_E4, E4_primavera[,11:22], E4_verano[,11:22], E4_otoño[,11:22])
df_E4 <- cbind(c(rep("invierno",4),rep("primavera",4),rep("verano",4),rep("otoño",4)),rep(c("8:00", "9:00", "11:00", "15:00"),4) ,df_E4)
df_E4 <- rbind( c(NA, NA, 11:22),df_E4)
write.csv(df_E4, file = "E4.csv",row.names=FALSE, col.names = FALSE, sep = ";", na="")

df_E5 <- data.frame(E5_invierno[,11:22])
df_E5 <- rbind(df_E5, E5_primavera[,11:22], E5_verano[,11:22], E5_otoño[,11:22])
df_E5 <- cbind(c(rep("invierno",4),rep("primavera",4),rep("verano",4),rep("otoño",4)),rep(c("8:00", "9:00", "11:00", "15:00"),4) ,df_E5)
df_E5 <- rbind( c(NA, NA, 11:22),df_E5)
write.csv(df_E5, file = "E5.csv",row.names=FALSE, col.names = FALSE, sep = ";", na="")


#Gráficas####

#Se cambian los valores 0 por NA (Son no optimizables)
for(n in 1:4){
  for(i in 1:24){
    if(E4_invierno[n,i]=="0"){ 
      E4_invierno[n,i] <-"NA"
    }
    if(E4_primavera[n,i]=="0"){ 
      E4_primavera[n,i] <-"NA"
    } 
    if(E4_verano[n,i]=="0"){ 
      E4_verano[n,i] <-"NA"
    }
    if(E4_otoño[n,i]=="0"){ 
      E4_otoño[n,i]<-"NA"
    }
  }
}

#Se cambian los valores 0 por NA (Son no optimizables)
for(n in 1:4){
  for(i in 1:24){
    if(E5_invierno[n,i]=="0"){ 
      E5_invierno[n,i] <-"NA"
    }
    if(E5_primavera[n,i]=="0"){ 
      E5_primavera[n,i] <-"NA"
    } 
    if(E5_verano[n,i]=="0"){ 
      E5_verano[n,i] <-"NA"
    }
    if(E5_otoño[n,i]=="0"){ 
      E5_otoño[n,i]<-"NA"
    }
  }
  
}

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

#E4

p1 <- ggplot()
p1 <- p1+geom_line(aes(x=10:23,y=rep(18,14)), colour="grey")
p1 <- p1+geom_line(aes(x=10:23, y=as.double(E4_invierno[1,10:23])), colour="blue")+geom_point(aes(x=10:23, y=as.double(E4_invierno[1,10:23])),colour="blue")
p1 <- p1+geom_line(aes(x=10:23, y=as.double(E4_invierno[2,10:23])),colour="green")+geom_point(aes(x=10:23, y=as.double(E4_invierno[2,10:23])),colour="green")
p1 <- p1+geom_line(aes(x=10:23, y=as.double(E4_invierno[3,10:23])), colour="red")+geom_point(aes(x=10:23, y=as.double(E4_invierno[3,10:23])),colour="red")
p1 <- p1+geom_line(aes(x=10:23, y=as.double(E4_invierno[4,10:23])), colour="brown")+geom_point(aes(x=10:23, y=as.double(E4_invierno[4,10:23])),colour="brown")
p1 <- p1+ylim(16,18.5)+xlab("Hora de salida")+ylab("kWh")+ggtitle("INVIERNO")+theme(plot.title = element_text(hjust = 0.5))
#p1 <- p1+scale_colour_manual(name="Hora de entrada",values=c("8:00" = "blue","9:00"="green", "11:00"="red", "15:00"="brown"))
p1

p2 <- ggplot()
p2 <- p2+geom_line(aes(x=10:23,y=rep(18,14)), colour="grey")
p2 <- p2+geom_line(aes(x=10:23, y=as.double(E4_primavera[1,10:23])), colour="blue")+geom_point(aes(x=10:23, y=as.double(E4_primavera[1,10:23])),colour="blue")
p2 <- p2+geom_line(aes(x=10:23, y=as.double(E4_primavera[2,10:23])),colour="green")+geom_point(aes(x=10:23, y=as.double(E4_primavera[2,10:23])),colour="green")
p2 <- p2+geom_line(aes(x=10:23, y=as.double(E4_primavera[3,10:23])), colour="red")+geom_point(aes(x=10:23, y=as.double(E4_primavera[3,10:23])),colour="red")
p2 <- p2+geom_line(aes(x=10:23, y=as.double(E4_primavera[4,10:23])), colour="brown")+geom_point(aes(x=10:23, y=as.double(E4_primavera[4,10:23])),colour="brown")
p2 <- p2+ylim(16,18.5)+xlab("Hora de salida")+ylab("kWh")+ggtitle("PRIMAVERA")+theme(plot.title = element_text(hjust = 0.5))
#p2 <- p2+scale_colour_manual(name="Hora de entrada",values=c("8:00" = "blue","9:00"="green", "11:00"="red", "15:00"="brown"))
p2

p3 <- ggplot()
p3 <- p3+geom_line(aes(x=10:23,y=rep(18,14)), colour="grey")
p3 <- p3+geom_line(aes(x=10:23, y=as.double(E4_verano[1,10:23])), colour="blue")+geom_point(aes(x=10:23, y=as.double(E4_verano[1,10:23])),colour="blue")
p3 <- p3+geom_line(aes(x=10:23, y=as.double(E4_verano[2,10:23])),colour="green")+geom_point(aes(x=10:23, y=as.double(E4_verano[2,10:23])),colour="green")
p3 <- p3+geom_line(aes(x=10:23, y=as.double(E4_verano[3,10:23])), colour="red")+geom_point(aes(x=10:23, y=as.double(E4_verano[3,10:23])),colour="red")
p3 <- p3+geom_line(aes(x=10:23, y=as.double(E4_verano[4,10:23])), colour="brown")+geom_point(aes(x=10:23, y=as.double(E4_verano[4,10:23])),colour="brown")
p3 <- p3+ylim(16,18.5)+xlab("Hora de salida")+ylab("kWh")+ggtitle("VERANO")+theme(plot.title = element_text(hjust = 0.5))
#p3 <- p3+scale_colour_manual(name="Hora de entrada",values=c("8:00" = "blue","9:00"="green", "11:00"="red", "15:00"="brown"))
p3


p4 <- ggplot()
p4 <- p4+geom_line(aes(x=10:23,y=rep(18,14)), colour="grey")
p4 <- p4+geom_line(aes(x=10:23, y=as.double(E4_otoño[1,10:23])), colour="blue")+geom_point(aes(x=10:23, y=as.double(E4_otoño[1,10:23])),colour="blue")
p4 <- p4+geom_line(aes(x=10:23, y=as.double(E4_otoño[2,10:23])),colour="green")+geom_point(aes(x=10:23, y=as.double(E4_otoño[2,10:23])),colour="green")
p4 <- p4+geom_line(aes(x=10:23, y=as.double(E4_otoño[3,10:23])), colour="red")+geom_point(aes(x=10:23, y=as.double(E4_otoño[3,10:23])),colour="red")
p4 <- p4+geom_line(aes(x=10:23, y=as.double(E4_otoño[4,10:23])), colour="brown")+geom_point(aes(x=10:23, y=as.double(E4_otoño[4,10:23])),colour="brown")
p4 <- p4+ylim(16,18.5)+xlab("Hora de salida")+ylab("kWh")+ggtitle("OTOÑO")+theme(plot.title = element_text(hjust = 0.5))
#p4 <- p4+scale_colour_manual(name="Hora de entrada",values=c("8:00" = "blue","9:00"="green", "11:00"="red", "15:00"="brown"))
p4


win.metafile("SoCEntrada_E4.wmf")
multiplot(p1, p3, p2, p4, cols=2)
dev.off()

#E5


p1 <- ggplot()
p1 <- p1+geom_line(aes(x=10:23,y=rep(18,14)), colour="grey")
p1 <- p1+geom_line(aes(x=10:23, y=as.double(E5_invierno[1,10:23])), colour="blue")+geom_point(aes(x=10:23, y=as.double(E5_invierno[1,10:23])),colour="blue")
p1 <- p1+geom_line(aes(x=10:23, y=as.double(E5_invierno[2,10:23])),colour="green")+geom_point(aes(x=10:23, y=as.double(E5_invierno[2,10:23])),colour="green")
p1 <- p1+geom_line(aes(x=10:23, y=as.double(E5_invierno[3,10:23])), colour="red")+geom_point(aes(x=10:23, y=as.double(E5_invierno[3,10:23])),colour="red")
p1 <- p1+geom_line(aes(x=10:23, y=as.double(E5_invierno[4,10:23])), colour="brown")+geom_point(aes(x=10:23, y=as.double(E5_invierno[4,10:23])),colour="brown")
p1 <- p1+ylim(16,18.5)+xlab("Hora de salida")+ylab("kWh")+ggtitle("INVIERNO")+theme(plot.title = element_text(hjust = 0.5))
#p1 <- p1+scale_colour_manual(name="Hora de entrada",values=c("8:00" = "blue","9:00"="green", "11:00"="red", "15:00"="brown"))
p1

p2 <- ggplot()
p2 <- p2+geom_line(aes(x=10:23,y=rep(18,14)), colour="grey")
p2 <- p2+geom_line(aes(x=10:23, y=as.double(E5_primavera[1,10:23])), colour="blue")+geom_point(aes(x=10:23, y=as.double(E5_primavera[1,10:23])),colour="blue")
p2 <- p2+geom_line(aes(x=10:23, y=as.double(E5_primavera[2,10:23])),colour="green")+geom_point(aes(x=10:23, y=as.double(E5_primavera[2,10:23])),colour="green")
p2 <- p2+geom_line(aes(x=10:23, y=as.double(E5_primavera[3,10:23])), colour="red")+geom_point(aes(x=10:23, y=as.double(E5_primavera[3,10:23])),colour="red")
p2 <- p2+geom_line(aes(x=10:23, y=as.double(E5_primavera[4,10:23])), colour="brown")+geom_point(aes(x=10:23, y=as.double(E5_primavera[4,10:23])),colour="brown")
p2 <- p2+ylim(16,18.5)+xlab("Hora de salida")+ylab("kWh")+ggtitle("PRIMAVERA")+theme(plot.title = element_text(hjust = 0.5))
#p2 <- p2+scale_colour_manual(name="Hora de entrada",values=c("8:00" = "blue","9:00"="green", "11:00"="red", "15:00"="brown"))
p2

p3 <- ggplot()
p3 <- p3+geom_line(aes(x=10:23,y=rep(18,14)), colour="grey")
p3 <- p3+geom_line(aes(x=10:23, y=as.double(E5_verano[1,10:23])), colour="blue")+geom_point(aes(x=10:23, y=as.double(E5_verano[1,10:23])),colour="blue")
p3 <- p3+geom_line(aes(x=10:23, y=as.double(E5_verano[2,10:23])),colour="green")+geom_point(aes(x=10:23, y=as.double(E5_verano[2,10:23])),colour="green")
p3 <- p3+geom_line(aes(x=10:23, y=as.double(E5_verano[3,10:23])), colour="red")+geom_point(aes(x=10:23, y=as.double(E5_verano[3,10:23])),colour="red")
p3 <- p3+geom_line(aes(x=10:23, y=as.double(E5_verano[4,10:23])), colour="brown")+geom_point(aes(x=10:23, y=as.double(E5_verano[4,10:23])),colour="brown")
p3 <- p3+ylim(16,18.5)+xlab("Hora de salida")+ylab("kWh")+ggtitle("VERANO")+theme(plot.title = element_text(hjust = 0.5))
#p3 <- p3+scale_colour_manual(name="Hora de entrada",values=c("8:00" = "blue","9:00"="green", "11:00"="red", "15:00"="brown"))
p3


p4 <- ggplot()
p4 <- p4+geom_line(aes(x=10:23,y=rep(18,14)), colour="grey")
p4 <- p4+geom_line(aes(x=10:23, y=as.double(E5_otoño[1,10:23])), colour="blue")+geom_point(aes(x=10:23, y=as.double(E5_otoño[1,10:23])),colour="blue")
p4 <- p4+geom_line(aes(x=10:23, y=as.double(E5_otoño[2,10:23])),colour="green")+geom_point(aes(x=10:23, y=as.double(E5_otoño[2,10:23])),colour="green")
p4 <- p4+geom_line(aes(x=10:23, y=as.double(E5_otoño[3,10:23])), colour="red")+geom_point(aes(x=10:23, y=as.double(E5_otoño[3,10:23])),colour="red")
p4 <- p4+geom_line(aes(x=10:23, y=as.double(E5_otoño[4,10:23])), colour="brown")+geom_point(aes(x=10:23, y=as.double(E5_otoño[4,10:23])),colour="brown")
p4 <- p4+ylim(16,18.5)+xlab("Hora de salida")+ylab("kWh")+ggtitle("OTOÑO")+theme(plot.title = element_text(hjust = 0.5))
#p4 <- p4+scale_colour_manual(name="Hora de entrada",values=c("8:00" = "blue","9:00"="green", "11:00"="red", "15:00"="brown"))
p4


win.metafile("SoCEntrada_E5.wmf")
multiplot(p1, p3, p2, p4, cols=2)
dev.off()









