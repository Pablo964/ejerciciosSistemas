#!/bin/bash
readonly prefijo=192.168.1.
linea="5p"
for((i = 1; $i <= 254;i++))
do
    ip="$prefijo$i"
    ping=$(ping -c 1 -W 1 $ip | cut -d "," -f 2 | sed -n $linea)
    
    if [[ $ping == *"1"* ]]
    then
        echo "$ip está activo"
    else
        echo "$ip no responde"
    fi
    echo "$ping"
    if [[ $i == 1 ]]
    then
        linea="4p"
    fi
done
