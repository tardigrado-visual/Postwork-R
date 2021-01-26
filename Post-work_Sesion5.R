#Post-work Sesión 5 _ Daniel Ramos
#FTHG: Full-time Home Goals  FTAG: Full-time Away Goals   FTR: Full-time Result
library(dplyr)
library(ggplot2)
library(fbRanks)

#Carpeta de trabajo
setwd("Documentos/BEDU_DataScience/")

#Renombrando columnas para crear soccer.csv
football <- read.csv("5_RegresionYClasificacion/football.csv")
football <- mutate(football,FTR=NULL)
football <- rename(football, date=Date,home.team=HomeTeam,away.team=AwayTeam,home.score=FTHG,away.score=FTAG)
write.csv(football,"5_RegresionYClasificacion/soccer.csv",row.names = F)

#Importando soccer.csv con fbRanks
listasoccer <- create.fbRanks.dataframes("5_RegresionYClasificacion/soccer.csv")
anotaciones <- listasoccer[["scores"]]
equipos <- listasoccer[["teams"]]

#Vector de fechas
fecha <- unique(anotaciones$date)
n <- length(fecha)

#Rankeando los equipos
ranking <- rank.teams(anotaciones,equipos,max.date = fecha[n-1],min.date = fecha[1])

#Predicción del último partido
prediccion <- predict.fbRanks(ranking,date=fecha[n])

