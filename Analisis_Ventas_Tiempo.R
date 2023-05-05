library(RSQLite)

con <- dbConnect(RSQLite::SQLite(), "chinook.db")

data <- dbGetQuery(con, "SELECT Total, InvoiceDate FROM Invoices")

ts_data <- ts(data$Total, frequency = 12, start = c(2010, 1), end = c(2020, 12))

plot(ts_data, main = "Ventas en Chinook", xlab = "Año", ylab = "Ventas")