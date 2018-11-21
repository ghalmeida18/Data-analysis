library(tcltk)

#Informações gerais:
data <- read.csv("Salaries.csv")

#Maior valor pago
pagMax <- max(data$TotalPay)
print (paste("Valor maximo pago: $",pagMax))

#Menor valor pago (negativo para devedor)
pagMin <- min(data$TotalPay)
print (paste("Valor minimo pago: $",pagMin))

#Média dos pagamentos (negativos e zero interferem na média)
pagMed <- mean(data$TotalPay)
print (paste("Media de Pagamentos: $",signif(pagMed)))

#Informações de cargo
print(paste("Cargo mais bem pago :",(subset(data, TotalPay == pagMax))$JobTitle))
print(paste("Cargo devedor :",(subset(data, TotalPay == pagMin))$JobTitle))

#Moda Salarios
CalcModa <- function(x) {
  z <- table(as.vector(x))
  names(z)[z == max(z)]
}

#Calculo da Moda
Moda <- CalcModa(data$TotalPay)

#quantidade de ocorrencias
qtdOcorr <- length(subset(data$TotalPay, data$TotalPay == Moda))
print(paste("Moda dos pagamentos: $",Moda,", ", "com ", qtdOcorr, "ocorrencias"))

#--plots--

#Salarios X nomes
pdf(file = "Salarios_maiores_350000.pdf")
par(mar=c(7, 10, 7, 7))
dataToPlot <- subset(data, data$TotalPay >= 350000 )
barplot(dataToPlot$TotalPay, main = "Salarios maiores que $350.000,00",names.arg=dataToPlot$EmployeeName,las=2,col="Blue")
dev.off()

#Salarios X cargos
png(file = "Salarios_maiores_350000_por_cargo.png")
dataToPlot <- subset(data, data$TotalPay >= 350000 )
par(mar=c(7, 10, 7, 7))
barplot(dataToPlot$TotalPay, main = "Salarios maiores que $350.000,00 por cargo",names.arg=dataToPlot$JobTitle, col="Blue", las=2)
dev.off()

