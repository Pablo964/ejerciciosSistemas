#!/bin/bash
let "linea=$RANDOM % 10 + 1"
palabra=$(sed -n "${linea}p" palabras.txt)
numLetras=${#palabra}

for((i=0; $i < $numLetras;i++))
{
    letras[i]=${palabra:i:1}
}

echo "$palabra"

echo -n "Palabra: "
for((i=1; $i <= $numLetras;i++))
{
    palabraOculta[i]="*"
    echo -n "${palabraOculta[i]}"
}
echo -e "\n"
read -n 1 -p "Dime una letra: " letraUsu
echo -e "\n"

for((i=1; $i <= $numLetras;i++))
{
    if($letraUsu == "${letras[i]}")
    {
        palabraOculta[i]=$letraUsu
    }
}    
for((i=1; $i <= $numLetras;i++))
{
    echo -n "${palabraOculta[i]}"
}    
