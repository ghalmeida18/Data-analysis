__author__ ='Gustavo Almeida'

import pandas as pd

dados = pd.read_csv('Salaries.csv',low_memory=False)
print("\n\n----Relatório dos Pagamentos----\n")
print(dados['TotalPay'].describe())
print("\n--------------------------------\n")

print("\n\n----Relatório dos Cargos----\n")
print(pd.value_counts(dados['JobTitle']))
print("\n--------------------------------\n")

print("\n\n----Cargo com Maior Valor de Pagamento----\n")
maximo = dados['TotalPay'].max()
print(dados.loc[dados['TotalPay'] == maximo]['JobTitle'])
print("\n--------------------------------\n")
