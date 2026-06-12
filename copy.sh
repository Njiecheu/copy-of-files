#!/bin/bash
FILENAME=${1:-"./client.c"}
DEST=${2:-"/home/client/Downloads"}
RANGE=${3:-"133..135"}

echo "                          --------------------------------------------------"
echo "                          --------------------------------------------------"
echo "                          ---------------COPIE DES FICHIERS-----------------"
echo "                          --------------------------------------------------"
echo "                          --------------------------------------------------"
for i in $(eval echo {$RANGE}); do
	ip="192.168.211.$i"
	if ping -c 1 -W 1 $ip > /dev/null 2>&1; then
		echo "copie des fichiers à ${ip} ..."
		scp ${FILENAME} client@${ip}:${DEST}
	else 
		echo "copie impossible hôte ${ip} indisponible"
	fi
done

echo "done."
