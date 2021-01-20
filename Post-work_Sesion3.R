#Post-work Sesión 3 _ Daniel Ramos
 #FTHG: Full-time Home Goals  FTAG: Full-time Away Goals   FTR: Full-time Result
library(dplyr)
library(ggplot2)

#Carpeta de trabajo
setwd("Documentos/BEDU_DataScience/")

football <- read.csv("3_EDA/datos/football.csv")

#Probabilidad marginal goles casa
x <- football$FTHG
goles_casa <- as.data.frame(table(x),responseName = "Frec_abs")
goles_casa$Probabilidad <- round(goles_casa$Frec_abs/dim(football)[1],4) #Frec_relativa = Probabilidad

#Probabilidad marginal goles visitante
y <- football$FTAG
goles_visitante <- as.data.frame(table(y),responseName = "Frec_abs")
goles_visitante$Probabilidad <- round(goles_visitante$Frec_abs/dim(football)[1],4) #Frec_relativa = Probabilidad

#Probabilidad conjunta
goles_conjunta <- as.data.frame(table(x,y),responseName = "Frec_abs")
goles_conjunta$Probabilidad <- round(goles_conjunta$Frec_abs/dim(football)[1],4) #Frec_relativa = Probabilidad

#Gráficas
goles_casa %>%
  ggplot(aes(x,Probabilidad))+
  geom_col(col="black",fill="#e67e22")+
  ggtitle("Probabilidad estimada - Goles equipo de Casa")+
  xlab("No. de goles")+
  theme_minimal()

goles_visitante %>%
  ggplot(aes(y,Probabilidad))+
  geom_col(col="black",fill="#27ae60")+
  ggtitle("Probabilidad estimada - Goles equipo Visitante")+
  xlab("No. de goles")+
  theme_minimal()

goles_conjunta %>%
  ggplot(aes(x,y,fill=Probabilidad))+
  geom_tile()+
  ggtitle("Probabilidad conjunta estimada - No. de goles")+
  labs(x="Goles Casa",y="Goles Visitante",fill="Probabilidad\nConjunta")+
  scale_fill_gradient(low="#943126", high="#f9e79f")