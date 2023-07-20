#!/bin/bash
FILENAME="./client.c"
DEST="/home/client/Downloads"

echo "                          --------------------------------------------------"
echo "                          --------------------------------------------------"
echo "                          ---------------COPIE DES FICHIERS-----------------"
echo "                          --------------------------------------------------"
echo "                          --------------------------------------------------"
for ip in 192.168.211.{133..135}; do
	if ping -c 1 -W 1 $ip > /dev/null 2>&1; then
		echo "copie des fichiers à ${ip} ..."
		scp ${FILENAME} client@${ip}:${DEST}
	else 
		echo "copie impossible hôte ${ip} indisponible"
	fi
done

echo "done."
