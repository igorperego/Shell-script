# Envie a saída do comando acima para o comando grep (use o PIPE "|") e faça as seguintes Expressões Regulares:
# Grupos que começam com a letra "r" no arquivo /etc/group
# Grupos que terminem com a letra "t"
# Grupos que comecem com a letra "r" e terminem com a letra "t"
# Grupos que terminam com a letra "e" ou "d"
# Grupos que não terminam com a letra "e" ou "d"
# Grupos que começam com qualquer dígito e a segunda letra seja um "u" ou "d"
# Grupos que tenha seu nome de 2 a 4 dígitos de tamanho
# Grupos que comecem com "r" ou "s" (use o operador OR)

#------------------ respostas -------------------- 

# $ cut -d : -f 1 /etc/group | grep "^r"
# $ cut -d : -f 1 /etc/group | grep "t$"
# $ cut -d : -f 1 /etc/group | grep "^r.*t$"
# $ cut -d : -f 1 /etc/group | grep "[ed]$"
# $ cut -d : -f 1 /etc/group | grep "[^ed]$"
# $ cut -d : -f 1 /etc/group | grep "^.[ud]"
# $ cut -d : -f 1 /etc/group | egrep "^.{2,4}$"
# $ cut -d : -f 1 /etc/group | egrep "^r|^s"

#------------------ respostas -------------------- 
lynx -source https://www.alura.com.br/ 
lynx -source https://www.alura.com.br/ | grep categories 
lynx -source https://www.alura.com.br/ | grep categories > titulos.txt
tail -n 33 titulos.txt
tail -n 33 titulos.txt | sed 's/class.*href="/0000//'
tail -n 33 titulos.txt | sed 's/class.*href="/0000//' | sed 's/><div.*/1111//'
tail -n 33 titulos.txt | sed 's/class.*href="/0000//;s/><div.*/1111//'
cat titulos.txt | sed 's/class.*href="/0000/;s/><div.*/aaa/'