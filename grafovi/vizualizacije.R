library(esmpack) 
library(ggplot2)
library(plotly)


# read in the data
data <- read.csv2("graf.csv")  

#create time variables
data$tjedan <- as.factor(data$tjedan) 
data$dan <- as.factor(data$dan) 
data$smjena <- as.factor(data$smjena) 


levels(data$tjedan) <- c("1","2")
levels(data$dan) <- c("ponedjeljak","utorak","srijeda", "četvrtak", "petak")
levels(data$smjena) <- c("jutarnja","poslijepodnevna")
levels(data$redni_broj_uzorkovanja) <- c("1","2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", 
                                         "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", 
                                         "28", "29", "30")


# center each variable around the person means
data$EKST_cent<- calc.mcent(data$EKST_S, ID, data)
data$UGOD_cent<- calc.mcent(data$A2, ID, data)
data$OTV_cent <- calc.mcent(data$OTV_S, ID, data) 
data$SAV_cent <- calc.mcent(data$SAV_S, ID, data)
data$NEU_cent <- calc.mcent(data$N2, ID, data)
data$SEU_cent <- calc.mcent(data$SEU, ID, data) 
data$HUM_cent <- calc.mcent(data$HUM_S, ID, data) 
data$IMP_cent <- calc.mcent(data$IMP_S, ID, data)
data$POS_VAL_cent <- calc.mcent(data$POS_VAL_S, ID, data) 
data$NEG_VAL_cent <- calc.mcent(data$NEG_VAL_S, ID, data)  
data$COMPLEX_cent <- calc.mcent(data$COMPLEX_S, ID, data) 
data$ADVERS_cent <- calc.mcent(data$ADVER_S, ID, data) 
data$TIP_S_cent <- calc.mcent(data$TIP_S, ID, data)


#plot time variable effect 

gplot <- ggplot(data, aes(x = "time variable", y = "centered variable")) + geom_boxplot() + 
  scale_x_discrete()

plot <- ggplotly(gplot)

plot




