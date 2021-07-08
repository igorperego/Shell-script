#!/bin/bash
#
# listaUsuarios.sh - Extrai usuários do /etc/passwd
#
# Site:       https://seusite.com.br
# Autor:      Seu site
# Manutenção: Igor Perego 
#
# ------------------------------------------------------------------------ #
#  Irá extrair usuários so /etc/passwd, havendo a possibilidade de colocar 
#  em maiusculo e em ordem alfbetica
#
#  Exemplos:
#      $ ./listaUsuario.sh -s -m
#      Neste exemplo ficara em maisucula e em ordem alfabetica
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 05/05/2020, Autor da mudança: Igor Perego
#       - Adicionando -h, -v & -s
#
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 4.4.19
# ------------------------------------------------------------------------ #
# ------------------------------- VARIÁVEIS ----------------------------------------- #

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

# ------------------------------- TESTES ----------------------------------------- #



# ------------------------------- EXECUÇÃO ----------------------------------------- #
#
# AULA 1
#
# if [ "$1" = "-h" ]; then 
#     echo "$MENSAGEM_USU" && exit 0
# fi 
# if [ "$1" = "-v" ]; then
#     echo "$VERSAO" && exit 0 
# fi
# if [ "$1" = "-s" ]; then
#     echo "$USUARIO" | sort && exit 0
# fi
# echo "$USUARIO"
#
# --------------------------------------------------------------------------------- #
#
# AULA 2
#
# case "$1" in
#     -h) echo "$MENSAGEM_USU" && exit 0   ;;
#     -v) echo "$VERSAO" && exit 0         ;;
#     -s) echo "$USUARIO" | sort && exit 0 ;;
#      *) echo "$USUARIO"                  ;;
# esac
#
# --------------------------------------------------------------------------------- #
#
# AULA 3
#
# case "$1" in
#     -h) echo "$MENSAGEM_USU" && exit 0 ;;
#     -v) echo "$VERSAO" && exit 0       ;;
#     -s) CHAVE_ORDENA=1                 ;;
#     -m) CHAVE_MAIUSCULO=1              ;;
#      *) echo "$USUARIO"                ;;
# esac
#
# [ $CHAVE_ORDENA -eq 1 ] && echo "$USUARIO" | sort
# [ $CHAVE_MAIUSCULO -eq 1 ] && echo "$USUARIO" | tr [a-z] [A-Z]
#
# -------------------------------------------------------------------------------- # 
#
# AULA 4
#
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