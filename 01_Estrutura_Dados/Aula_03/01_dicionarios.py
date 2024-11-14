#########################################################################
# Aula 03 - Estrutura de Dados
# Autor: Gabriel Quintella
# Data: 12/09/2024
# Assunto: 1. DICIONARIOS (Dict)
# Um dicionário é uma coleção de pares chave-valor, onde as chaves são únicas 
# e os valores podem ser de qualquer tipo. Ele é uma estrutura de dados mutável.
#########################################################################


# %%

# 01 - Composição de um dicionário "dicionario = {chave:valor}" 

dicionario = {"idade": 25}


# %%

# 02 - Criando um dicionario vazio

carro = {}

# %%

# 03 - Navegando em um diconario

carro = {"fabricante":"volks", "marca":"gol"}

print(carro)

carro["fabricante"]

# %%

carro = { "XPT-1A23" : ["Gol", 2024,"Gasolina"] }


# %% 

# 04 - Recuperando valores de um dicionário
# "dicionario = {chave:valor}" 

carro = { 
        "XPT-1A23" : ["Gol", 2024,"Gasolina"]
        ,"ABC-1489" : ["BMW", 2018,"Gasolina"]
        ,"DFR-9R12" : ["Fox", 2008,"Gasolina/Gás"]
        }

for placa in carro.keys():

    print(placa)

# %%

# 04 - Recuperando valores de um dicionário
# "dicionario = {chave:valor}" 

carro = { 
    "XPT-1A23" : ["Gol", 2024,"Gasolina"]
    ,"ABC-1489" : ["BMW", 2018,"Gasolina"]
    ,"DFR-9R12" : ["Fox", 2008,"Gasolina/Gás"]
    }

for placa, informacao in carro.items():

    print("---------------------------------")
    print("Placa: ",placa)
    print("Modelo Veículo: ",informacao[0])
    print("Ano Fabricação: ",informacao[1])
    print("Combustível: ",informacao[2]) 

# %% 

# 05 - Atualizando um registro do dicionario

carro['DFR-9R12'] = ["Fox", 2009,"Gasolina/Gás"]

print(carro)

# %%

# 06 - Adicionando um registro dentro de um dicionario

carro.update({"WST-1476" : ['Fusca', 1968, 'Alcool']})


# %%

carro.pop('WST-1476' , 'Não Encontrado')


# %%

del carro['DFR-9R12']

# %%

print(carro)

#  %% 

import pyodbc
import pandas as pd
import os
import json

caminho_arquivo_parametro = fr'C:\Temp\Python_YT\Git\sirius_mba_engenharia_dados\01_Estrutura_Dados\parametro.json'

parametro = pd.read_json(caminho_arquivo_parametro)

for item_parametro in parametro.keys():

    print(item_parametro)

    server = parametro[item_parametro][0]
    database = parametro[item_parametro][1]
    user = parametro[item_parametro][2]
    psw = parametro[item_parametro][3]

conn = pyodbc.connect(
    'DRIVER={ODBC Driver 17 for SQL Server};'
    fr'SERVER={server};'
    fr'DATABASE={database};'
    fr'UID={user};'
    fr'PWD={psw}'
)


dfNomeTabela = pd.read_sql("""
                SELECT s.name + '.' + t.name NomeTabela
                FROM sys.tables t
                INNER JOIN sys.schemas s
                ON t.schema_id = s.schema_id
                """, conn)

for tabela in dfNomeTabela['NomeTabela']:

    dfDadosTabela = pd.read_sql(fr"""
                SELECT *
                FROM {tabela}
                """, conn)

    os.makedirs(fr'C:\Temp\Python_YT\Git\MBA\01_Estrutura_Dados\02_Aula\Dados\Extracao_SQL_Server', exist_ok = True)
    diretorio_arquivo = fr'C:\Temp\Python_YT\Git\MBA\01_Estrutura_Dados\02_Aula\Dados\Extracao_SQL_Server'
    dfDadosTabela.to_csv(diretorio_arquivo + '\\' + tabela.replace('dbo.', '').lower() + '.csv'
                        , header= True
                        , index=False
                        , sep=';')

