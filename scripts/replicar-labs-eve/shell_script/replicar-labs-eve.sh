#!/bin/bash 

###################################################################
#Script Name    :replicar-labs-eve
#Description    :Script para replicação dos arquivos de Laboratório do EVE-NG
#Author         :Lucas Jorge
#Email          :lucasjorge@nic.br
#Dependencies   : zip
###################################################################


#Usuário digita o nome do arquivo original
echo "Digite o nome do arquivo original (sem a extensão):"
read ORIGINAL

#Usuário digita o nome dos arquivos de copia
echo "Digite o nome dos arquivos de cópia (sem a extensão):"
read COPIA

#Usuário digita o número inicial e final para numerar os arquivos, que será utilizado no nome dos arquivos de copia
echo "Digite o número inicial:"
read INICIAL
echo "Digite o número final:"
read FINAL

#Cria uma diretório, que será criado para armazenar os arquivos gerados
mkdir cache

#Gera os arquivos a partir do arquivo ORIGINAL, devidamente numerados, utilizando os valores passados pelo Usuário
while [ $INICIAL -le $FINAL ]
do
	#Efetua uma cópia do arquivo ORIGINAL para dentro da pasta de cache, utilizando o número contido na variável INICIAL
    cp $ORIGINAL.unl cache/$COPIA$INICIAL.unl
	
    #Incrementa mais 1 à variável INICIAL
    (( INICIAL++ ))
done

#Exibe a mensagem na tela caso os arquivos sejam gerados
echo "Arquivos criados"

#Compacta todos os arquivos dentro do arquivo Labs-Prontos.zip
zip -jq Labs-Prontos.zip cache/*

#Apaga todos os arquivos gerados
rm -r cache

#Exibe mensagem final
echo "Arquivos compactados e prontos =]"

#Mantém o terminal aberto, útil caso aconteça algum problema na geração do arquivo.
$SHELL