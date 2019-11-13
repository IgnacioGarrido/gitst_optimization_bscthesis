library(readr)
library("ggplot2")

precio_energia <- read.csv("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/R-EstudioSeVaAntes/precioEnerg�a4d�as.csv", header = T, sep = "\t")


coche_inv <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/R-EstudioSeVaAntes/Escenario VI/coche_inv.txt", header = F, sep = "\t")   
coche_pri <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/R-EstudioSeVaAntes/Escenario VI/coche_pri.txt", header = F, sep = "\t")   
coche_ver <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/R-EstudioSeVaAntes/Escenario VI/coche_ver.txt", header = F, sep = "\t")   
coche_oto <- read.delim("~/Universidad/4/SegundoSemestre/TFG/___AuxiliarParaToquetearSinCagarla/R-EstudioSeVaAntes/Escenario VI/coche_oto.txt", header = F, sep = "\t")   


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


hora_entrada <- c(8,9,9,9,6,15)
hora_salida <- c(19,16,19,17,15,21)

#Vectores que almacenan el dinero ganado/perdido
seVa_1 <- rep(0,24)
seVa_2 <- rep(0,24)
seVa_3 <- rep(0,24)
seVa_4 <- rep(0,24)
seVa_5 <- rep(0,24)
seVa_6 <- rep(0,24)

#Bucle invierno
for(i in 1:24){
  if(i <= hora_entrada[1] || i > hora_salida[1]){
    seVa_1[i] <- NA
  }else{
    for(n in (hora_entrada[1]+1):i){
      seVa_1[i] <- seVa_1[i] + (df_coche_inv$coche1_vector[n]-df_coche_inv$coche1_vector[n-1])*precio_energia$p_invierno[n]
    }
  }
  if(i <= hora_entrada[2] || i > hora_salida[2]){
    seVa_2[i] <- NA
  }else{
    for(n in (hora_entrada[2]+1):i){
      seVa_2[i] <- seVa_2[i] + (df_coche_inv$coche2_vector[n]-df_coche_inv$coche2_vector[n-1])*precio_energia$p_invierno[n]
    }
  }
  if(i <= hora_entrada[3] || i > hora_salida[3]){
    seVa_3[i] <- NA
  }else{
    for(n in (hora_entrada[3]+1):i){
      seVa_3[i] <- seVa_3[i] + (df_coche_inv$coche3_vector[n]-df_coche_inv$coche3_vector[n-1])*precio_energia$p_invierno[n]
    }
  }
  if(i <= hora_entrada[4] || i > hora_salida[4]){
    seVa_4[i] <- NA
  }else{
    for(n in (hora_entrada[4]+1):i){
      seVa_4[i] <- seVa_4[i] + (df_coche_inv$coche4_vector[n]-df_coche_inv$coche4_vector[n-1])*precio_energia$p_invierno[n]
    }
  }
  if(i <= hora_entrada[5] || i > hora_salida[5]){
    seVa_5[i] <- NA
  }else{
    for(n in (hora_entrada[5]+1):i){
      seVa_5[i] <- seVa_5[i] + (df_coche_inv$coche5_vector[n]-df_coche_inv$coche5_vector[n-1])*precio_energia$p_invierno[n]
    }
  }
  if(i <= hora_entrada[6] || i > hora_salida[6]){
    seVa_6[i] <- NA
    
  }else{
    for(n in (hora_entrada[6]+1):i){
      seVa_6[i] <- seVa_6[i] + (df_coche_inv$coche6_vector[n]-df_coche_inv$coche6_vector[n-1])*precio_energia$p_invierno[n]
      }
  }
df_SeVaAntes_inv <- data.frame(seVa_1, seVa_2, seVa_3, seVa_4, seVa_5, seVa_6)

}

seVa_1 <- rep(0,24)
seVa_2 <- rep(0,24)
seVa_3 <- rep(0,24)
seVa_4 <- rep(0,24)
seVa_5 <- rep(0,24)
seVa_6 <- rep(0,24)



#Bucle primavera
for(i in 1:24){
  if(i <= hora_entrada[1] || i > hora_salida[1]){
    seVa_1[i] <- NA
  }else{
    for(n in (hora_entrada[1]+1):i){
      seVa_1[i] <- seVa_1[i] + (df_coche_pri$coche1_vector[n]-df_coche_pri$coche1_vector[n-1])*precio_energia$p_primavera[n]
    }
  }
  if(i <= hora_entrada[2] || i > hora_salida[2]){
    seVa_2[i] <- NA
  }else{
    for(n in (hora_entrada[2]+1):i){
      seVa_2[i] <- seVa_2[i] + (df_coche_pri$coche2_vector[n]-df_coche_pri$coche2_vector[n-1])*precio_energia$p_primavera[n]
    }
  }
  if(i <= hora_entrada[3] || i > hora_salida[3]){
    seVa_3[i] <- NA
  }else{
    for(n in (hora_entrada[3]+1):i){
      seVa_3[i] <- seVa_3[i] + (df_coche_pri$coche3_vector[n]-df_coche_pri$coche3_vector[n-1])*precio_energia$p_primavera[n]
    }
  }
  if(i <= hora_entrada[4] || i > hora_salida[4]){
    seVa_4[i] <- NA
  }else{
    for(n in (hora_entrada[4]+1):i){
      seVa_4[i] <- seVa_4[i] + (df_coche_pri$coche4_vector[n]-df_coche_pri$coche4_vector[n-1])*precio_energia$p_primavera[n]
    }
  }
  if(i <= hora_entrada[5] || i > hora_salida[5]){
    seVa_5[i] <- NA
  }else{
    for(n in (hora_entrada[5]+1):i){
      seVa_5[i] <- seVa_5[i] + (df_coche_pri$coche5_vector[n]-df_coche_pri$coche5_vector[n-1])*precio_energia$p_primavera[n]
    }
  }
  if(i <= hora_entrada[6] || i > hora_salida[6]){
    seVa_6[i] <- NA
    
  }else{
    for(n in (hora_entrada[6]+1):i){
      seVa_6[i] <- seVa_6[i] + (df_coche_pri$coche6_vector[n]-df_coche_pri$coche6_vector[n-1])*precio_energia$p_primavera[n]
    }
  }
  df_SeVaAntes_pri <- data.frame(seVa_1, seVa_2, seVa_3, seVa_4, seVa_5, seVa_6)
  
}


seVa_1 <- rep(0,24)
seVa_2 <- rep(0,24)
seVa_3 <- rep(0,24)
seVa_4 <- rep(0,24)
seVa_5 <- rep(0,24)
seVa_6 <- rep(0,24)



#Bucle verano
for(i in 1:24){
  if(i <= hora_entrada[1] || i > hora_salida[1]){
    seVa_1[i] <- NA
  }else{
    for(n in (hora_entrada[1]+1):i){
      seVa_1[i] <- seVa_1[i] + (df_coche_ver$coche1_vector[n]-df_coche_ver$coche1_vector[n-1])*precio_energia$p_verano[n]
    }
  }
  if(i <= hora_entrada[2] || i > hora_salida[2]){
    seVa_2[i] <- NA
  }else{
    for(n in (hora_entrada[2]+1):i){
      seVa_2[i] <- seVa_2[i] + (df_coche_ver$coche2_vector[n]-df_coche_ver$coche2_vector[n-1])*precio_energia$p_verano[n]
    }
  }
  if(i <= hora_entrada[3] || i > hora_salida[3]){
    seVa_3[i] <- NA
  }else{
    for(n in (hora_entrada[3]+1):i){
      seVa_3[i] <- seVa_3[i] + (df_coche_ver$coche3_vector[n]-df_coche_ver$coche3_vector[n-1])*precio_energia$p_verano[n]
    }
  }
  if(i <= hora_entrada[4] || i > hora_salida[4]){
    seVa_4[i] <- NA
  }else{
    for(n in (hora_entrada[4]+1):i){
      seVa_4[i] <- seVa_4[i] + (df_coche_ver$coche4_vector[n]-df_coche_ver$coche4_vector[n-1])*precio_energia$p_verano[n]
    }
  }
  if(i <= hora_entrada[5] || i > hora_salida[5]){
    seVa_5[i] <- NA
  }else{
    for(n in (hora_entrada[5]+1):i){
      seVa_5[i] <- seVa_5[i] + (df_coche_ver$coche5_vector[n]-df_coche_ver$coche5_vector[n-1])*precio_energia$p_verano[n]
    }
  }
  if(i <= hora_entrada[6] || i > hora_salida[6]){
    seVa_6[i] <- NA
    
  }else{
    for(n in (hora_entrada[6]+1):i){
      seVa_6[i] <- seVa_6[i] + (df_coche_ver$coche6_vector[n]-df_coche_ver$coche6_vector[n-1])*precio_energia$p_verano[n]
    }
  }
  df_SeVaAntes_ver <- data.frame(seVa_1, seVa_2, seVa_3, seVa_4, seVa_5, seVa_6)
  
}



seVa_1 <- rep(0,24)
seVa_2 <- rep(0,24)
seVa_3 <- rep(0,24)
seVa_4 <- rep(0,24)
seVa_5 <- rep(0,24)
seVa_6 <- rep(0,24)





#Bucle otoño
for(i in 1:24){
  if(i <= hora_entrada[1] || i > hora_salida[1]){
    seVa_1[i] <- NA
  }else{
    for(n in (hora_entrada[1]+1):i){
      seVa_1[i] <- seVa_1[i] + (df_coche_oto$coche1_vector[n]-df_coche_oto$coche1_vector[n-1])*precio_energia$p_otoño[n]
    }
  }
  if(i <= hora_entrada[2] || i > hora_salida[2]){
    seVa_2[i] <- NA
  }else{
    for(n in (hora_entrada[2]+1):i){
      seVa_2[i] <- seVa_2[i] + (df_coche_oto$coche2_vector[n]-df_coche_oto$coche2_vector[n-1])*precio_energia$p_otoño[n]
    }
  }
  if(i <= hora_entrada[3] || i > hora_salida[3]){
    seVa_3[i] <- NA
  }else{
    for(n in (hora_entrada[3]+1):i){
      seVa_3[i] <- seVa_3[i] + (df_coche_oto$coche3_vector[n]-df_coche_oto$coche3_vector[n-1])*precio_energia$p_otoño[n]
    }
  }
  if(i <= hora_entrada[4] || i > hora_salida[4]){
    seVa_4[i] <- NA
  }else{
    for(n in (hora_entrada[4]+1):i){
      seVa_4[i] <- seVa_4[i] + (df_coche_oto$coche4_vector[n]-df_coche_oto$coche4_vector[n-1])*precio_energia$p_otoño[n]
    }
  }
  if(i <= hora_entrada[5] || i > hora_salida[5]){
    seVa_5[i] <- NA
  }else{
    for(n in (hora_entrada[5]+1):i){
      seVa_5[i] <- seVa_5[i] + (df_coche_oto$coche5_vector[n]-df_coche_oto$coche5_vector[n-1])*precio_energia$p_otoño[n]
    }
  }
  if(i <= hora_entrada[6] || i > hora_salida[6]){
    seVa_6[i] <- NA
    
  }else{
    for(n in (hora_entrada[6]+1):i){
      seVa_6[i] <- seVa_6[i] + (df_coche_oto$coche6_vector[n]-df_coche_oto$coche6_vector[n-1])*precio_energia$p_otoño[n]
    }
  }
  df_SeVaAntes_oto <- data.frame(seVa_1, seVa_2, seVa_3, seVa_4, seVa_5, seVa_6)
  
}


#Se hacen los csv
write.csv(df_SeVaAntes_inv, "seVaAntes_inv.csv")
write.csv(df_SeVaAntes_pri, "seVaAntes_pri.csv")
write.csv(df_SeVaAntes_ver, "seVaAntes_ver.csv")
write.csv(df_SeVaAntes_oto, "seVaAntes_oto.csv")



#Gráficas

p1 <- ggplot()
p1 <- p1+geom_line(data=precio_energia, aes(x=1:24, y=(p_invierno*10)), colour="grey")
p1 <- p1+geom_line(data=df_SeVaAntes_inv, aes(x=1:24, y=seVa_1), colour="green")+geom_point(data=df_SeVaAntes_inv, aes(x=1:24, y=seVa_1), colour="green")
p1 <- p1+geom_line(data=df_SeVaAntes_inv, aes(x=1:24, y=seVa_2), colour="blue")+geom_point(data=df_SeVaAntes_inv, aes(x=1:24, y=seVa_2), colour="blue")
p1 <- p1+geom_line(data=df_SeVaAntes_inv, aes(x=1:24, y=seVa_3), colour="red")+geom_point(data=df_SeVaAntes_inv, aes(x=1:24, y=seVa_3), colour="red")
p1 <- p1+geom_line(data=df_SeVaAntes_inv, aes(x=1:24, y=seVa_4), colour="purple")+geom_point(data=df_SeVaAntes_inv, aes(x=1:24, y=seVa_4), colour="purple")
p1 <- p1+geom_line(data=df_SeVaAntes_inv, aes(x=1:24, y=seVa_5), colour="black")+geom_point(data=df_SeVaAntes_inv, aes(x=1:24, y=seVa_5), colour="black")
p1 <- p1+geom_line(data=df_SeVaAntes_inv, aes(x=1:24, y=seVa_6), colour="orange")+geom_point(data=df_SeVaAntes_inv, aes(x=1:24, y=seVa_6), colour="orange")
p1 <- p1+ylim(-2,2)+xlab("Hora")+ylab("€")+ggtitle("INVIERNO")+theme(plot.title = element_text(hjust = 0.5))
#p1 <- p1+scale_colour_manual(name="",values=c("VE 1" = "green","VE 2"="blue", "VE 3"="red", "VE 4"="purple", "VE 5"="black", "VE 6"="orange"))
p1


p2 <- ggplot()
p2 <- p2+geom_line(data=precio_energia, aes(x=1:24, y=(p_primavera*10)), colour="grey")
p2 <- p2+geom_line(data=df_SeVaAntes_pri, aes(x=1:24, y=seVa_1), colour="green")+geom_point(data=df_SeVaAntes_pri, aes(x=1:24, y=seVa_1), colour="green")
p2 <- p2+geom_line(data=df_SeVaAntes_pri, aes(x=1:24, y=seVa_2), colour="blue")+geom_point(data=df_SeVaAntes_pri, aes(x=1:24, y=seVa_2), colour="blue")
p2 <- p2+geom_line(data=df_SeVaAntes_pri, aes(x=1:24, y=seVa_3), colour="red")+geom_point(data=df_SeVaAntes_pri, aes(x=1:24, y=seVa_3), colour="red")
p2 <- p2+geom_line(data=df_SeVaAntes_pri, aes(x=1:24, y=seVa_4), colour="purple")+geom_point(data=df_SeVaAntes_pri, aes(x=1:24, y=seVa_4), colour="purple")
p2 <- p2+geom_line(data=df_SeVaAntes_pri, aes(x=1:24, y=seVa_5), colour="black")+geom_point(data=df_SeVaAntes_pri, aes(x=1:24, y=seVa_5), colour="black")
p2 <- p2+geom_line(data=df_SeVaAntes_pri, aes(x=1:24, y=seVa_6), colour="orange")+geom_point(data=df_SeVaAntes_pri, aes(x=1:24, y=seVa_6), colour="orange")
p2 <- p2+ylim(-2,2)+xlab("Hora")+ylab("€")+ggtitle("PRIMAVERA")+theme(plot.title = element_text(hjust = 0.5))
#p2 <- p2+scale_colour_manual(name="",values=c("VE 1" = "green","VE 2"="blue", "VE 3"="red", "VE 4"="purple", "VE 5"="black", "VE 6"="orange"))
p2

p3 <- ggplot()
p3 <- p3+geom_line(data=precio_energia, aes(x=1:24, y=(p_verano*10)), colour="grey")
p3 <- p3+geom_line(data=df_SeVaAntes_ver, aes(x=1:24, y=seVa_1), colour="green")+geom_point(data=df_SeVaAntes_ver, aes(x=1:24, y=seVa_1), colour="green")
p3 <- p3+geom_line(data=df_SeVaAntes_ver, aes(x=1:24, y=seVa_2), colour="blue")+geom_point(data=df_SeVaAntes_ver, aes(x=1:24, y=seVa_2), colour="blue")
p3 <- p3+geom_line(data=df_SeVaAntes_ver, aes(x=1:24, y=seVa_3), colour="red")+geom_point(data=df_SeVaAntes_ver, aes(x=1:24, y=seVa_3), colour="red")
p3 <- p3+geom_line(data=df_SeVaAntes_ver, aes(x=1:24, y=seVa_4), colour="purple")+geom_point(data=df_SeVaAntes_ver, aes(x=1:24, y=seVa_4), colour="purple")
p3 <- p3+geom_line(data=df_SeVaAntes_ver, aes(x=1:24, y=seVa_5), colour="black")+geom_point(data=df_SeVaAntes_ver, aes(x=1:24, y=seVa_5), colour="black")
p3 <- p3+geom_line(data=df_SeVaAntes_ver, aes(x=1:24, y=seVa_6), colour="orange")+geom_point(data=df_SeVaAntes_ver, aes(x=1:24, y=seVa_6), colour="orange")
p3 <- p3+ylim(-2,2)+xlab("Hora")+ylab("€")+ggtitle("VERANO")+theme(plot.title = element_text(hjust = 0.5))
#p3 <- p3+scale_colour_manual(name="",values=c("VE 1" = "green","VE 2"="blue", "VE 3"="red", "VE 4"="purple", "VE 5"="black", "VE 6"="orange"))
p3

p4 <- ggplot()
p4 <- p4+geom_line(data=precio_energia, aes(x=1:24, y=(p_otoño*10)), colour="grey")
p4 <- p4+geom_line(data=df_SeVaAntes_oto, aes(x=1:24, y=seVa_1), colour="green")+geom_point(data=df_SeVaAntes_oto, aes(x=1:24, y=seVa_1), colour="green")
p4 <- p4+geom_line(data=df_SeVaAntes_oto, aes(x=1:24, y=seVa_2), colour="blue")+geom_point(data=df_SeVaAntes_oto, aes(x=1:24, y=seVa_2), colour="blue")
p4 <- p4+geom_line(data=df_SeVaAntes_oto, aes(x=1:24, y=seVa_3), colour="red")+geom_point(data=df_SeVaAntes_oto, aes(x=1:24, y=seVa_3), colour="red")
p4 <- p4+geom_line(data=df_SeVaAntes_oto, aes(x=1:24, y=seVa_4), colour="purple")+geom_point(data=df_SeVaAntes_oto, aes(x=1:24, y=seVa_4), colour="purple")
p4 <- p4+geom_line(data=df_SeVaAntes_oto, aes(x=1:24, y=seVa_5), colour="black")+geom_point(data=df_SeVaAntes_oto, aes(x=1:24, y=seVa_5), colour="black")
p4 <- p4+geom_line(data=df_SeVaAntes_oto, aes(x=1:24, y=seVa_6), colour="orange")+geom_point(data=df_SeVaAntes_oto, aes(x=1:24, y=seVa_6), colour="orange")
p4 <- p4+ylim(-2,2)+xlab("Hora")+ylab("€")+ggtitle("OTOÑO")+theme(plot.title = element_text(hjust = 0.5))
#p4 <- p4+scale_colour_manual(name="",values=c("VE 1" = "green","VE 2"="blue", "VE 3"="red", "VE 4"="purple", "VE 5"="black", "VE 6"="orange"))
p4

win.metafile("grafcoche.wmf")
multiplot(p1, p3, p2, p4, cols=2)
dev.off()


