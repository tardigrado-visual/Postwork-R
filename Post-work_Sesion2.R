#Post-work Sesión 2 _ Daniel Ramos
library(dplyr)
library(stringr)

#Carpeta de trabajo
setwd("Documentos/BEDU_DataScience/2_Manipulacion_Datos/")

#Lectura y exploración de archivos
df_1718 <- read.csv("datos_football/SP1_17-18.csv")
df_1819 <- read.csv("datos_football/SP1_18-19.csv")
df_1920 <- read.csv("datos_football/SP1_19-20.csv")

head(df_1718);head(df_1819);head(df_1920)
str(df_1718);str(df_1819);str(df_1920)

#Seleccionando columnas relevantes
lista <- list(df_1718,df_1819,df_1920)
lista <- lapply(lista,select,Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR)

#Modificando cadena de fecha de df_1718 y tipo de dato de todos los df
lista[[1]]$Date <- str_replace(lista[[1]]$Date,"/17$","/2017")
lista[[1]]$Date <- str_replace(lista[[1]]$Date,"/18$","/2018")
lista <- lapply(lista,mutate,Date = as.Date(Date,"%d/%m/%Y"))
head(lista[[1]]); head(lista[[2]]); head(lista[[3]])

#Uniendo dfs en un mismo dataframe
football <- rbind(lista[[1]],lista[[2]],lista[[3]])
head(football);tail(football);str(football)
write.csv(football,"football.csv",row.names = F)
