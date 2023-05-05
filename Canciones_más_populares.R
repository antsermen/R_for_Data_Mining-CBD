library(RSQLite)
con <- dbConnect(RSQLite::SQLite(), "chinook.db")

ventasPorCancion <- dbGetQuery(con, "SELECT t.Name as Canción, COUNT(ii.InvoiceLineId) as Ventas
                              FROM Tracks t LEFT JOIN Invoice_items ii ON ii.TrackId = t.TrackId GROUP BY Canción
                              ORDER BY Ventas DESC")
topDiezCancionesMasVendidas <- head(ventasPorCancion, 10)
topDiezCancionesMenosVendidas <- tail(ventasPorCancion, 10)
print("Las 10 canciones más vendidas junto al número total de ventas son:"); print(topDiezCancionesMasVendidas)
print("Las 10 canciones menos vendidas junto al número total de ventas son:"); print(topDiezCancionesMenosVendidas)
dbDisconnect(con)