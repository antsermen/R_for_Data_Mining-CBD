library(RSQLite)
con <- dbConnect(RSQLite::SQLite(), "chinook.db")

ventasPorGenero <- dbGetQuery(con, "SELECT g.Name as Género, COUNT(ii.InvoiceLineId) as Ventas
                              FROM Genres g LEFT JOIN Tracks t ON t.GenreId = g.GenreId
                              LEFT JOIN Invoice_items ii ON ii.TrackId = t.TrackId GROUP BY g.Name
                              ORDER BY Ventas DESC")
print("Los 5 géneros más vendidos son:"); print(head(ventasPorGenero,5))
print("Los 5 géneros menos vendidos son:"); print(tail(ventasPorGenero,5))