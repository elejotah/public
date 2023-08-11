#!/bin/ash

####################################################################################
# Script Name    :pc-cliente2-configuracao-de-rede.sh                              #
# Description    :Script para configuração de rede do pc-cliente2 do Laboratório 1 #
#				  do Curso de Roteamento do Projeto Acelera ISP		               #
# Author         :Lucas Jorge                                                      #
# Email          :lucasjorge@nic.br                                                #
####################################################################################

#declara a variável RESPOSTA
RESPOSTA="n"

#cria um laço de repetição enquanto a resposta do aluno não for 's'
while [ "$RESPOSTA" = "n" ]; do

	#solicita o grupo do aluno
	echo "Digite o numero do seu grupo:"
	read GRUPO

	#confirma o grupo digitado
	echo "O numero do seu grupo e $GRUPO [s/n]?"
	read RESPOSTA

done

#insere as configurações de rede no arquivo '/etc/network/interfaces', utilizando o grupo fornecido pelo aluno
cat << EOL > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
	address 10.$GRUPO.2.10/24
	gateway 10.$GRUPO.2.1

iface eth0 inet6 static
	address 4d0c:$GRUPO:0400::10/40
	gateway 4d0c:$GRUPO:0400::1
EOL

#reiniciar as configurações de rede para aplicar as mudanças
/etc/init.d/networking restart