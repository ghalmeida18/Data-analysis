
data <- read.csv("Salaries.csv")
pagMax <- max(data$TotalPay)
print (paste("Valor maximo pago: $",pagMax))
pagMin <- min(data$TotalPay)
print (paste("Valor minimo pago: $",pagMin))
pagMed <- mean(data$TotalPay)
print (paste("Media de Pagamentos: $",pagMed))
print(paste("Cargo mais bem pago :",(subset(data, TotalPay == pagMax))$JobTitle))