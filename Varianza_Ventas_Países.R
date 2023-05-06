library(RSQLite)

con <- dbConnect(RSQLite::SQLite(), "chinook.db")

consulta <- "SELECT BillingCountry as País, (SUM(Total*Total)/COUNT(*) - (SUM(Total)/COUNT(*)) * (SUM(Total)/COUNT(*))) AS Varianza
             FROM Invoices
             GROUP BY País"

resultados <- dbGetQuery(con, consulta)

print(resultados)
dbDisconnect(con)
