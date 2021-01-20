#Post-work Sesión 1 _ Daniel Ramos
football <- read.csv("Documentos/BEDU_DataScience/1_Introduccion_R/SP1.csv")
goles <- football[,c("FTHG","FTAG")]

#Probabilidad marginal goles casa
x <- goles$FTHG
goles_casa <- as.data.frame(table(x),responseName = "Frec_absoluta")
goles_casa$Frec_relativa <- round(goles_casa$Frec_absoluta/dim(goles)[1],4) #Frec_relativa = Probabilidad
goles_casa

#Probabilidad marginal goles visitante
y <- goles$FTAG
goles_visitante <- as.data.frame(table(y),responseName = "Frec_absoluta")
goles_visitante$Frec_relativa <- round(goles_visitante$Frec_absoluta/dim(goles)[1],4) #Frec_relativa = Probabilidad
goles_visitante

#Probabilidad conjunta
goles_conjunta <- as.data.frame(table(x,y),responseName = "Frec_absoluta")
goles_conjunta$Frec_relativa <- round(goles_conjunta$Frec_absoluta/dim(goles)[1],4) #Frec_relativa = Probabilidad
goles_conjunta