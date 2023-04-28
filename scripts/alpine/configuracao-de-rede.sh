#!/bin/ash

RESPOSTA="n"

while [ "$RESPOSTA" = "n" ]; do

	echo "Digite o numero do seu grupo:"
	read GRUPO
	echo "O numero do seu grupo e $GRUPO [s/n]?"
	read RESPOSTA
done

cat << EOL > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
	address 10.$GRUPO.1.10/24
	gateway 10.$GRUPO.1.1

iface eth0 inet6 static
	address 4d0c:$GRUPO:0800::10/40
	gateway 4d0c:$GRUPO:0800::1
EOL

/etc/init.d/networking restart