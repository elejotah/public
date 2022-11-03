##########################################################################
# Script Name    :replicar-labs-eve.py                                   #
# Description    :Script para replicação dos arquivos de Labs. do EVE-NG #
# Author         :Lucas Jorge                                            #
# Email          :lucasjorge@nic.br                                      #
##########################################################################

# importa os módulos para manipulação de arquivos e pastas
import shutil
import os
import zipfile

# usuário digita o nome do arquivo original
original = input("Digite o nome do arquivo original (sem a extensão): ")

# usuário digita o nome das copias
copia = input("Digite o nome dos arquivos de cópia (sem a extensão): ")

# usuário digita o número inicial e final para numerar os arquivos, que será utilizado no nome dos arquivos de copia
inicial = int(input("Digite o número inicial: "))
final = int(input("Digite o número final: "))

# verifica se existe um diretório 'cache' e caso exista, apaga-se e cria-se um diretório novo
if os.path.isdir("./cache"):
    shutil.rmtree("./cache")
    os.makedirs("./cache")
else:
    os.makedirs("./cache")

# gera os arquivos a partir do arquivo original, devidamente numerados, utilizando os valores passados pelo usuário
for i in range(inicial, final+1):

    # armazena o caminho de origem
    origem = "./"+original+".unl"
    # armazena o caminho de destino com o nome novo, passado pelo usuário
    destino = "./cache/"+str(copia)+str(i)+".unl"

    # verifica se o arquivo de origem existe, caso não exista, finaliza o programa
    try:
        # realiza a copia do arquivo de origem para o destino
        shutil.copy(origem, destino)
    except:
        print("\nArquivo de origem não encontrado")
        input("\nAperte qualquer tecla para finalizar")
        exit()

# lista o conteúdo do diretório cache e armazena na variável diretorio
diretorio = os.listdir("./cache")

# compacta os arquivos contidos no diretório cache em um único arquivo ZIP chamado Labs-Prontos.zip
with zipfile.ZipFile("Labs-Prontos.zip", mode="w") as archive:
    for file_path in diretorio:
        arquivos = "./cache/"+file_path
        archive.write(arquivos, arcname=file_path)

# remove o diretório de cache
shutil.rmtree("./cache")

print("\nArquivos copiados com sucesso")

input("\nAperte qualquer tecla para finalizar")