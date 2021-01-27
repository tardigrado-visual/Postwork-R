#Post-work Sesión 6 _ Daniel Ramos

library(dplyr)
library(ggplot2)
library(lubridate) #Paquete para manipular fechas

#Carpeta de trabajo
setwd("Documentos/BEDU_DataScience/")

#Suma de goles por partido
data <- read.csv("6_SeriesTiempo/match.data.csv")
data <- mutate(data,date=as.Date(date),sumagoles=data$home.score+data$away.score)

#Promedio mensual de suma de goles
  #floor_date() redondea las fechas hacia el primer dia del mes
  #También permite redondear usando otros periodos de tiempo 
goles_mes <- group_by(data,month=floor_date(data$date, "month"))
goles_mes <- summarise(goles_mes,sumagoles=round(mean(sumagoles),2))

#Creando serie de tiempo
goles.ts <- ts(goles_mes$sumagoles,start = c(2010,8),end= c(2019,12),freq = 12)

#Graficando serie de tiempo
plot(goles.ts, xlab = "Tiempo", ylab = "Goles promedio", 
     main = "Serie de Goles promedio", 
     sub = "Serie mensual: Agosto de 2010 a Diciembre de 2019")

