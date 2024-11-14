import os
import shutil 

diretorio = fr'C:\dados_TSE'

# Atividade 02 - Lista de UFs
list_uf = [
    'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA',
    'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN',
    'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO'
]


# Atividade 03 - Dicionário de diretórios
dict_diretorio = {
    'bem_candidato': 'bens',
    'consulta_cand': 'candidatos',
    'consulta_coligacao': 'coligacoes',
    'consulta_vagas': 'vagas',
    'motivo_cassacao': 'cassacoes'
}

# Atividade 04 - Movimentação de arquivos por tipo

# Monta lista de arquivos
lista = os.listdir(diretorio)

# Itera sobre lista de arquivos
for arquivo in lista:

   # Verifica o tipo de arquivo
    tipo_arquivo = next((key for key in dict_diretorio if key in arquivo), None)
    if tipo_arquivo:
        
        # Cria o diretório se não existir
        tipo_dir = os.path.join(diretorio, dict_diretorio[tipo_arquivo])
        os.makedirs(tipo_dir, exist_ok=True)
        
        # Move o arquivo para o diretório correspondente
        shutil.move(os.path.join(diretorio, arquivo), os.path.join(tipo_dir, arquivo))

        
# Atividade 05 - Movimentação de arquivos por UF

# Organizar arquivos por UF dentro de cada diretório de tipo
for tipo, subdir in dict_diretorio.items():
    tipo_dir = os.path.join(diretorio, subdir)
    
    if os.path.exists(tipo_dir):
        arquivos = os.listdir(tipo_dir)

        for arquivo in arquivos:
            # Identifica a UF no nome do arquivo
            uf = next((uf for uf in list_uf if f"_{uf}." in arquivo), None)
        
            if uf:
            
                # Cria o diretório da UF se não existir
                uf_dir = os.path.join(tipo_dir, uf)
                os.makedirs(uf_dir, exist_ok=True)
                
                # Move o arquivo para o diretório da UF
                shutil.move(os.path.join(tipo_dir, arquivo), os.path.join(uf_dir, arquivo))

                
# Atividade 6 - Movimentação dos arquivos restantes

# Lista de arquivos restantes no diretório raiz
arquivos_restantes = [f for f in os.listdir(diretorio) if os.path.isfile(os.path.join(diretorio, f))]

# Criar diretório "Outro" apenas se houver arquivos restantes
if arquivos_restantes:
    list_uf.append('Outro')
    dict_diretorio['Outro'] = 'Outro'
   
    outro_dir = os.path.join(diretorio, 'Outro')
    os.makedirs(outro_dir, exist_ok=True)

    for arquivo in arquivos_restantes:
        # Move o arquivo para o diretório "Outro"
        shutil.move(os.path.join(diretorio, arquivo), os.path.join(outro_dir, arquivo))
    print(f"Arquivos restantes movidos para {outro_dir}.")
else:
    print("Não há arquivos restantes no diretório raiz.")