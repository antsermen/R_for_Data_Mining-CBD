library(RSQLite)
con <- dbConnect(RSQLite::SQLite(), "chinook.db")

comprasPorCliente <- dbGetQuery(con, "SELECT c.FirstName as Nombre, c.LastName as Apellidos, COUNT(ii.InvoiceLineId) as Compras
                                    FROM Customers c LEFT JOIN Invoices i ON c.CustomerId = i.CustomerId
                                    LEFT JOIN Invoice_items ii ON i.InvoiceId = ii.InvoiceId GROUP BY Nombre
                                    ORDER BY Compras DESC")
topSieteClientesMasCompradores <- head(comprasPorCliente, 7)
topSieteClientesMenosCompradores <- tail(comprasPorCliente, 7)
print("Los 7 clientes con más compras junto al número total de compras son:"); print(topSieteClientesMasCompradores)
print("Los 7 clientes con menos compras junto al número total de compras son:"); print(topSieteClientesMenosCompradores)
dbDisconnect(con)