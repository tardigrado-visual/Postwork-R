#Post-work _ Sesión 7 _ Daniel Ramos
library(mongolite)

#Conectandose al cluster personal de MongoDB Atlas
match <- mongo(collection = "match",
           db="match_games",
           url = "mongodb+srv://daniel_ramos:<password>@cluster0.seel2.mongodb.net/test")

#Contando numero de documentos en la colección
match$count('{}')

#Realizando la consulta solicitada
real_madrid1 <- match$find('{"HomeTeam":"Real Madrid","Date":"2015-12-20"}')
  #No hay ninguna consulta que corresponda con los datos solicitados, los
  #partidos inician en 2017

#Realizando otra consulta
real_madrid2 <- match$find('{"HomeTeam":"Real Madrid","Date":"2018-04-08"}')

#Desconectandose de la base
match$disconnect()