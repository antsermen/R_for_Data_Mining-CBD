library(RSQLite)
#library(rpart.plot) Sirve para visualizar el árbol si se desea
library(rpart)

con <- dbConnect(RSQLite::SQLite(), "chinook.db")

generoComprasClientes <- dbGetQuery(con, "SELECT c.FirstName AS Nombre, c.LastName AS Apellidos, c.Country AS País, g.Name AS Género
                                    FROM Customers c
                                    LEFT JOIN Invoices i ON c.CustomerId = i.CustomerId
                                    LEFT JOIN Invoice_items ii ON i.InvoiceId = ii.InvoiceId
                                    LEFT JOIN Tracks t ON ii.TrackId = t.TrackId
                                    LEFT JOIN Genres g ON t.GenreId = g.GenreId AND g.Name != 'Rock'")
generoComprasClientes <- na.omit(generoComprasClientes) #Eliminar las entradas asociadas a Rock que aparecen como NA

arbolGeneros <- rpart(Género ~ País, data = generoComprasClientes)

#Ejemplo de cómo se visualizaría dicho árbol:
#rpart.plot(arbolGeneros, box.palette="Blues")

generoPredecido <- predict(arbolGeneros, newdata = generoComprasClientes, type = "class")
generoComprasClientes$generoPredecido <- generoPredecido

#Para visualizar los datos mejor descomentar la línea 25 o seleccionar la variable de la línea 24 en el panel "Environment"
mejorVisualizacionPrediccion <- unique(generoComprasClientes[c("País", "generoPredecido")])
#print(mejorVisualizacionPrediccion)

dbDisconnect(con)
