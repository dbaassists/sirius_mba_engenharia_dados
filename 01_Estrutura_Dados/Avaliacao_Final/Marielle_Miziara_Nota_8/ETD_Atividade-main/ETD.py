# Atividade 02: Lista de todas as UFs do Brasil
list_uf = ['AC', 'AL', 'AM', 'AP', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO']

# Atividade 03: Dicionário para identificar diretórios de movimentação
dict_diretorio = {
    'png': 'Print',
    'pdf': 'PDF/'
}
import os
import shutil 

diretorio_raiz = fr'C:\Users\marie\Downloads\ETD'

lista = os.listdir(diretorio_raiz)

# Atividade 04: Rotina para ler o diretório raiz e realizar a movimentação dos arquivos confome dicionario
for controlador in lista:
    if controlador.endswith('pdf'):

        os.makedirs(fr'C:\Users\marie\Downloads\ETD\PDF', exist_ok=True)
        shutil.move( fr'C:\Users\marie\Downloads\ETD' + '\\' + controlador , fr'C:\Users\marie\Downloads\ETD\PDF')
        print(controlador)

# Atividade 5 - Separando por UF
for arquivo in lista:  
    for uf in list_uf:
        if f'_{uf}' in arquivo:  
            destino_dir = os.path.join(diretorio_raiz, uf)
            os.makedirs(destino_dir, exist_ok=True)

            origem = os.path.join(diretorio_raiz, arquivo)
            destino = os.path.join(destino_dir, arquivo)

            shutil.move(origem, destino)

#Atividade 6 - Verificar se restou algum arquivo e inserir em Outro
resto = os.listdir(diretorio_raiz)
for arquivo_restante in resto:
    if not any(f'_{uf}' in arquivo_restante for uf in list_uf):
        outros_dir = os.path.join(diretorio_raiz, "Outros")
        os.makedirs(outros_dir, exist_ok=True)

        origem = os.path.join(diretorio_raiz, arquivo_restante)
        destino = os.path.join(outros_dir, arquivo_restante)

        shutil.move(origem,destino)