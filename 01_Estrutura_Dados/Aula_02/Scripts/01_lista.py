#########################################################################
# Aula 02 - Estrutura de Dados
# Autor: Gabriel Quintella
# Data: 10/09/2024
# Assunto: 1. LISTA (List)
# Uma lista é uma estrutura de dados mutável que permite adicionar, remover e modificar seus elementos. 
# Onde uma lista permite armazenar objetos seja de um mesmo tipo ou não.
#########################################################################



# %% 

# 01 - Criando listas vazias (Modo 01)

lista = []

type(lista)

# ou 

# %%

# 01 - Criando listas vazias (Modo 02)

lista_2 = list()

type(lista_2)

# %% 

# 01 - Criando uma lista com valores pré-definidos

lista_3 = [1,2,3,4,5]

len(lista_3)

# %%
 
# 02 - Inserindo registros em uma lista (Inserção no final da lista - append)

lista.append(60)

# %%

# 02 - Inserindo registros em uma lista (Inserção na posição informada - insert)

#lista.insert(posicao , valor)

lista.insert(1,55)

# %%

# 02 - Inserindo registros em uma lista (Inserção informando o indice, o valor daquela posição é sobrescrito)

lista[1] = 54

# %% 

# 03 - Removendo registros de uma lista (Remoção do último registro da lista - pop())

lista.pop()

# %% 

# 03 - Removendo registros de uma lista (Remoção do registro conforme o indice informado)

lista = [1,2,3,4,5]

lista.pop(2)

# %% 

# 03 - Removendo registros de uma lista (Remoção do registro informado - remove(4))

lista.remove(4)

# %%

# 03 - Removendo registros de uma lista (Remoção de apenas 1 ocorrência em caso de registros iguais)

lista = [1,2,3,4,5,5,41,6,2,4]

lista.remove(5)

# %%

# 03 - Removendo registros de uma lista (Limpar a lista por completa - clear())

lista.clear()

# %% 

# 04 - Realizando o fatiamento de uma lista (Slicing)

lista = [1,2,3,4,5,5,41,6,2,4]

lista_01 = lista[:-3]

print(lista_01)

# %% 

# 04 - Realizando o fatiamento de uma lista (Slicing)

lista = [1,2,3,4,5,5,41,6,2,4]

lista_01 = lista[3:]

print(lista_01)

# %% 

# 05 - Simulação de leitura de uma lista e separação de arquivos que contenham a palavra "aluno"

valor = 'aluno'
lista_arquivo = ['dados_aluno.csv', 'dados_professor.csv', 'notas_alunos.csv', 'disciplinas_professores.csv' ]

# Diretorio de Alunos e outro de Professores

for controlador in lista_arquivo:

    if valor in controlador:

        print(controlador)

# %%

# 06 - Leitura de um diterorio qualquer e separação dos arquivos em diretórios

import os
import shutil 

diretorio = fr'C:\Temp\Python_YT\Git\MBA\01_Estrutura_Dados\02_Aula\Dados'

lista = os.listdir(diretorio)

for controlador in lista:

    if controlador.endswith('pdf'):

        os.makedirs(fr'C:\Temp\Python_YT\Git\MBA\01_Estrutura_Dados\02_Aula\Dados\Outros', exist_ok=True)
        shutil.move( fr'C:\Temp\Python_YT\Git\MBA\01_Estrutura_Dados\02_Aula\Dados' + '\\' + controlador , fr'C:\Temp\Python_YT\Git\MBA\01_Estrutura_Dados\02_Aula\Dados\Outros')
        print(controlador)

    elif 'consulta_vagas_' in controlador:
        
        os.makedirs(fr'C:\Temp\Python_YT\Git\MBA\01_Estrutura_Dados\02_Aula\Dados\Consulta_Vagas', exist_ok=True)
        shutil.move( fr'C:\Temp\Python_YT\Git\MBA\01_Estrutura_Dados\02_Aula\Dados' + '\\' + controlador , fr'C:\Temp\Python_YT\Git\MBA\01_Estrutura_Dados\02_Aula\Dados\Consulta_Vagas')
        
    elif 'consulta_cand_' in controlador:
        
        os.makedirs(fr'C:\Temp\Python_YT\Git\MBA\01_Estrutura_Dados\02_Aula\Dados\Consulta_Candidato', exist_ok=True)
        shutil.move( fr'C:\Temp\Python_YT\Git\MBA\01_Estrutura_Dados\02_Aula\Dados' + '\\' + controlador , fr'C:\Temp\Python_YT\Git\MBA\01_Estrutura_Dados\02_Aula\Dados\Consulta_Candidato')

    elif 'consulta_coligacao_' in controlador:
        
        os.makedirs(fr'C:\Temp\Python_YT\Git\MBA\01_Estrutura_Dados\02_Aula\Dados\Consulta_Coligacao', exist_ok=True)
        shutil.move( fr'C:\Temp\Python_YT\Git\MBA\01_Estrutura_Dados\02_Aula\Dados' + '\\' + controlador , fr'C:\Temp\Python_YT\Git\MBA\01_Estrutura_Dados\02_Aula\Dados\Consulta_Coligacao')


    elif 'bem_candidato_' in controlador:
        
        os.makedirs(fr'C:\Temp\Python_YT\Git\MBA\01_Estrutura_Dados\02_Aula\Dados\Bem_Candidato', exist_ok=True)
        shutil.move( fr'C:\Temp\Python_YT\Git\MBA\01_Estrutura_Dados\02_Aula\Dados' + '\\' + controlador , fr'C:\Temp\Python_YT\Git\MBA\01_Estrutura_Dados\02_Aula\Dados\Bem_Candidato')


# %%

# 07 - Leitura de um Banco de Dados (SQL Server) e 
# extração de dados de suas tabelas 
# e salvar em um diretorio no formato "csv"

import pyodbc
import pandas as pd
import os

server = 'localhost\DBAASSISTS'
database = 'ERP_VENDAS'
user = 'python'
psw = 'python'
driver = 'SQL Server'

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


# %%
