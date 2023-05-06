library(RSQLite)
con <- dbConnect(RSQLite::SQLite(), "chinook.db")
lineasFacturas <- dbGetQuery(con, "SELECT * FROM Invoice_items")
canciones <- dbGetQuery(con, "SELECT * FROM Tracks")
generos <- dbGetQuery(con, "SELECT * FROM Genres")
clientes <- dbGetQuery(con, "SELECT * FROM Customers")
facturas <- dbGetQuery(con, "SELECT * FROM Invoices")


#Tabla Géneros

sum(duplicated(generos)) #Hay 0 registros repetidos
sum(is.na(generos)) #Hay 0 valores faltantes

#Tabla Factura_objetos

sum(duplicated(lineasFacturas)) #Hay 0 registros repetidos
sum(is.na(lineasFacturas)) #Hay 0 valores faltantes

#Tabla Canciones

sum(duplicated(canciones)) #Hay 0 registros repetidos
sum(is.na(canciones)) #Hay 978 valores faltantes
#Se puede ver de qué columa son los valores faltantes con la función:
#colSums(is.na(canciones))

#Tabla Clientes
sum(duplicated(clientes)) #Hay 0 registros repetidos
sum(is.na(clientes)) #Hay 130 valores faltantes

#Tabla Facturas
sum(duplicated(facturas)) #Hay 0 registros repetidos
sum(is.na(facturas)) #Hay 230 valores faltantes
dbDisconnect(con)
