#!/bin/bash
#Um laço que conte de 0 a 10, a cada iteração, verifique se o número é divisível por 2, 
#se ele for divisível por 2, escreva uma mensagem na tela confirmando isso
#DICA: Se o resto da divisão por 2 for...

for (( i = 1; i <= 10; i++ )); do
    sobra=$(( $i%2 ))
    if [ "$sobra" = "0" ] 
    then
        echo NUMERO $i é dividido por 2 
    fi
done
