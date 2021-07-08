#!/bin/bash
#
# debug.sh - Extrai usuários do /etc/passwd
#
# Site:       https://seusite.com.br
# Autor:      Seu site
# Manutenção: Igor Perego 
#
# ------------------------------------------------------------------------ #
# 1- Aula
#  No terminal bash -x ./debug.sh -s -m : descreve o percurso 
#  No terminal bash -xv ./debug.sh -s -m : descreve o percurso mis detalhado
#


USUARIO="$(cat /etc/passwd | cut -d : -f 1)"
MENSAGEM_USU="
    $(basename $0) - [OPCOES]
        -h - Menu ajuda
        -v - Versao
        -s - Ordem de saida
        -m - Coloca em Maiusculo
"
VERSAO="v1.0"
CHAVE_ORDENA=0
CHAVE_MAIUSCULO=0


while test -n "$1"
do
case "$1" in
    -h) echo "$MENSAGEM_USU" && exit 0                ;;
    -v) echo "$VERSAO" && exit 0                      ;;
    -s) CHAVE_ORDENA=1                                ;;
    -m) CHAVE_MAIUSCULO=1                             ;;
     *) echo "Opcao invalida, valide o -h." && exit 1 ;;
esac
    shift
done

[ $CHAVE_ORDENA -eq 1 ]    && USUARIO=$( echo "$USUARIO" | sort )
[ $CHAVE_MAIUSCULO -eq 1 ] && USUARIO=$( echo "$USUARIO" | tr [a-z] [A-Z] )

echo "$USUARIO"


# -------------------------------------------------------------------------------- # 
# 2- Aula
#  Colocando o debug dentro do nosso codigo, podendo selecionar algumas partes.
#  Apresentando apenas a parte que voce quer ver, com o objtivo de achar o erro.
#
USUARIO="$(cat /etc/passwd | cut -d : -f 1)"
MENSAGEM_USU="
    $(basename $0) - [OPCOES]
        -h - Menu ajuda
        -v - Versao
        -s - Ordem de saida
        -m - Coloca em Maiusculo
"
VERSAO="v1.0"
CHAVE_ORDENA=0
CHAVE_MAIUSCULO=0


while test -n "$1"
do
case "$1" in
    -h) echo "$MENSAGEM_USU" && exit 0                ;;
    -v) echo "$VERSAO" && exit 0                      ;;
    -s) CHAVE_ORDENA=1                                ;;
    -m) CHAVE_MAIUSCULO=1                             ;;
     *) echo "Opcao invalida, valide o -h." && exit 1 ;;
esac
    shift
done
set -x
[ $CHAVE_ORDENA -eq 1 ]    && USUARIO=$( echo "$USUARIO" | sort )
[ $CHAVE_MAIUSCULO -eq 1 ] && USUARIO=$( echo "$USUARIO" | tr [a-z] [A-Z] )
set +x
echo "$USUARIO"
