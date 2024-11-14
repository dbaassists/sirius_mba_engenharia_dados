# %%

# Importando as bibliotecas necessárias
import os
import shutil

# Diretório raiz onde os arquivos estão
diretorio = r'D:\pos_graduacao\Atividades\estrutura_dados\Dados'

# Lista de arquivos no diretório
arquivos = os.listdir(diretorio)

# Lista de UFs
list_uf = [
    'AC', 'AL', 'AM', 'AP', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 
    'MG', 'MS', 'MT', 'PA', 'PB', 'PE', 'PI', 'PR', 'RJ', 'RN', 
    'RO', 'RR', 'RS', 'SC', 'SE', 'SP', 'TO'
]

# Lista de arquivos

print(arquivos)

# Diretório de origem

print("Diretório de origem:" , diretorio)

# Dicionário de diretórios por tipo de arquivo
dict_diretorio = {
    '.pdf': r'D:\pos_graduacao\Atividades\estrutura_dados\Dados\pdf',
    '.csv': r'D:\pos_graduacao\Atividades\estrutura_dados\Dados\csv',
    'outro': r'D:\pos_graduacao\Atividades\estrutura_dados\Dados\csv\Outro'  
}

# Diretórios de destino
print("Diretórios de destino:", dict_diretorio.values())

def mover_arquivos():
    for arquivo in arquivos:

        # Obtém a extensão do arquivo atráves do indice 1. 
        # Afunção os.path.splitext() recebe um caminho ou nome de arquivo como argumento e retorna uma tupla contendo duas partes.
        extensao = os.path.splitext(arquivo)[1]

        # Verifica se a extensão está no dicionário
        if extensao in dict_diretorio:
            # Cria o diretório para a extensão, se não existir
            os.makedirs(dict_diretorio[extensao], exist_ok=True)
            

            # os.path.join(): Esta função é usada para combinar diferentes partes de um caminho de forma segura, dependendo do sistema operacional. 
            # Isso garante que o código funcione corretamente tanto em Windows (usando \) quanto em sistemas Unix (usando /).

            # Caminho de origem
            origem = os.path.join(diretorio, arquivo)

            # Caminho de destino
            destino = os.path.join(dict_diretorio[extensao], arquivo)
            
            # Move o arquivo
            # shutil.move(src, dst)
            shutil.move(origem, destino)
            print(f'Movido: {arquivo} para {destino}')

mover_arquivos()

# Função para organizar os arquivos por UF
def organizar_por_uf():
    # Percorre os diretórios no dicionário
    for extensao, destino in dict_diretorio.items():
        # Lista arquivos no diretório da extensão
        arquivos_extensao = os.listdir(destino)
        
        for arquivo in arquivos_extensao:
            # Verifica se o arquivo contém alguma UF
            for uf in list_uf:
                if uf in arquivo:
                    # Cria o diretório da UF, se não existir
                    diretorio_uf = os.path.join(destino, uf)
                    os.makedirs(diretorio_uf, exist_ok=True)
                    
                    # Caminho de origem e destino para a UF
                    origem = os.path.join(destino, arquivo)
                    destino_uf = os.path.join(diretorio_uf, arquivo)
                    
                    # Move o arquivo para o diretório da UF
                    shutil.move(origem, destino_uf)
                    print(f'Movido: {arquivo} para {destino_uf}')

organizar_por_uf()

# Quando eu rodo nessa mesma celula da erro e nao encontrei o porque

# FileNotFoundError: [WinError 3] O sistema não pode encontrar o caminho especificado: 
# 'D:\\pos_graduacao\\Atividades\\estrutura_dados\\Dados\\csv\\Outro'

# def mover_arquivos_restantes():
#     # Cria o diretório 'outros', se não existir
#     os.makedirs(dict_diretorio['outro'], exist_ok=True)

#     # Lista os arquivos na pasta csv
#     arquivos_csv = os.listdir(dict_diretorio['.csv'])
    
#     for arquivo in arquivos_csv:
#         # Verifica se é um arquivo CSV
#         if arquivo.endswith('.csv'):
#             # Caminho de origem e destino
#             origem = os.path.join(dict_diretorio['.csv'], arquivo)
#             destino = os.path.join(dict_diretorio['outro'], arquivo)

#             # Move o arquivo para a pasta 'outros'
#             shutil.move(origem, destino)
#             print(f'Movido: {arquivo} para {destino}')

# # Chame a nova função após organizar os arquivos por UF
# mover_arquivos_restantes()


# %%

# Nessa celula é realizado com sucesso

# Função para mover arquivos CSV restantes para a pasta 'outros'
def mover_arquivos_restantes():
    # Cria o diretório 'Outro', se não existir
    os.makedirs(dict_diretorio['outro'], exist_ok=True)

    # Lista os arquivos na pasta csv
    arquivos_csv = os.listdir(dict_diretorio['.csv'])
    
    for arquivo in arquivos_csv:
        # Verifica se é um arquivo CSV
        if arquivo.endswith('.csv'):

            # Caminho de origem e destino
            origem = os.path.join(dict_diretorio['.csv'], arquivo)
            destino = os.path.join(dict_diretorio['outro'], arquivo)

            # Move o arquivo para a pasta 'Outro'
            shutil.move(origem, destino)
            print(f'Movido: {arquivo} para {destino}')

mover_arquivos_restantes()

# %%
