#!/bin/bash

# Define la dirección IP base y la máscara de red
IP_BASE="192.168.1"
NETMASK="255.255.255.0"

# Itera sobre todas las direcciones IP posibles
for i in {1..254}
do
  # Crea una dirección IP para probar
  IP="$IP_BASE.$i"

  # Utiliza el comando ping para verificar si la dirección IP está en uso
  if ping -c 1 -w 1 $IP >/dev/null 2>&1; then
    # Obtiene el nombre de la máquina asociado a la dirección IP
    HOSTNAME=$(getent hosts $IP | awk '{print $2}')

    echo "Dirección IP en uso: $IP"
    echo "Nombre de la máquina: $HOSTNAME"
    echo "---------------------------"
  fi
done


