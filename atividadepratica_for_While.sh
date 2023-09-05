#!/bin/bash 

#Exercícios com variáveis:
#1. Crie um script que defina uma variável chamada "nome" com o valor do seu nome e a imprima na tela.
nome="Samantha"
echo "Meu nome é $nome"

#2. Escreva um script que calcule a soma de dois números armazenados em variáveis e exiba o resultado.
x=5 
y=2 
soma=$((x + y)) 
echo "Soma de $x e $y: $soma"

#3. Crie um script que armazene o valor de um diretório em uma variável e, em seguida, liste o
#conteúdo do diretório
dir=$(pwd) #Armazena o endereço do diretório
ls $dir #Conteúdo do diretório"

#4. Escreva um script que peça ao usuário para digitar sua idade e armazene-a em uma variável.
#Em seguida, exiba a idade na tela.
read -p "Digite a sua idade: " idade #solicita a idade do usuário 
echo "A sua idade é $idade" #mostra a idade

#5. Crie um script que utilize a variável de ambiente "USER" para saudar o usuário com
#"Olá, [nome do usuário]!".
nome_usuario=$(whoami)
echo "Olá, $nome_usuario!"

#Exercícios com Condicionais (IF):
#1. Escreva um script que verifique se um número digitado pelo usuário é positivo, negativo ou zero.
echo "Digite um número: " 
read numero

if [ $numero -gt 0 ]; then #Entra se o número é maior que 0
    echo "O número é positivo."
elif [ $numero -lt 0 ]; then #Entra se o número for negativo
    echo "O número é negativo."
else
    echo "O número é zero." #Entra se o número for zero
fi

#2. Crie um script que peça ao usuário para digitar sua idade e,
#com base na idade, exiba se ele é maior ou menor de idade
echo "Digite sua idade: "
read idade

if [ $idade -ge 18 ]; then
    echo "Você é maior de idade."
else
    echo "Você é menor de idade."
fi

#3. Escreva um script que verifique se um arquivo existe no diretório atual. Se existir,
#exiba uma mensagem sobre sua existência.
read -p "Digite o nome do arquivo: " arquivo

if [ -e "$arquivo" ]; then
    echo "O arquivo '$arquivo' existe no diretório atual."
else
    echo "O arquivo '$arquivo' não foi encontrado no diretório atual."
fi

#4. Crie um script que peça ao usuário para digitar um número e, em seguida, determine se ele é par
# ou ímpar.
read -p "Digite um número: "  numero

if [ $((numero % 2)) -eq 0 ]; then
    echo "O número $numero é par."
else
    echo "O número $numero é ímpar."
fi

#5. Escreva um script que pergunte ao usuário o dia da semana e exiba se é um dia útil ou um dia de folga.
read -p "Digite o dia da semana (em minúsculas): " dia

# Converte o dia da semana para letras minúsculas para facilitar a comparação
dia=$(echo "$dia" | tr '[:upper:]' '[:lower:]')

# Verifica se o dia é um dia útil ou um dia de folga
if [ "$dia" = "segunda-feira" ] || [ "$dia" = "terça-feira" ] || [ "$dia" = "quarta-feira" ] || [ "$dia" = "quinta-feira" ] || [ "$dia" = "sexta-feira" ]; then
    echo "É um dia útil."
elif [ "$dia" = "sábado" ] || [ "$dia" = "domingo" ]; then
    echo "É um dia de folga."
else
    echo "Dia da semana não reconhecido."
fi

#Exercícios com Laços (For):
#1. Crie um script que use um loop for para imprimir os números de 1 a 10.
# Loop for para imprimir números de 1 a 10
for ((numero = 1; numero <= 10; numero++))
do
    echo $numero
done

#2. Escreva um script que calcule a soma dos números de 1 a 100 usando um loop for.
soma=0

# Loop para somar os números de 1 a 100
for ((numero = 1; numero <= 100; numero++))
do
    soma=$((soma + numero))
done
echo "A soma dos números de 1 a 100 é: $soma"


#3. Crie um script que liste todos os arquivos no diretório atual usando um loop for.
for arquivo in *
do
    if [ -f "$arquivo" ]; then
        echo $arquivo
    fi
done

#4. Escreva um script que exiba a tabuada de multiplicação de um número escolhido pelo usuário, de 1 a 10.
read -p "Digite um número de 1 a 10: " numero

for ((i=1; i<=10; i++))
do
    resultado=$((numero * i))
    echo "$numero x $i = $resultado"
done

#5. Crie um script que use um loop for para imprimir uma contagem regressiva de 5 a 0.
for ((i=5; i>=0; i--)) #Imprimindo contagem regressiva de 5 a 0
do
    echo $i
done

#Exercícios com Laços (While):
#1. Escreva um script que solicite ao usuário para adivinhar um número e continue
#pedindo até que o número correto seja adivinhado.
numero_correto=$((RANDOM % 10 + 1)) #Gera um número aleatório entre 1 e 10

palpite=0 #Inicializa a variável para armazenar o palpite do usuário

# Loop para continuar pedindo ao usuário para adivinhar
while [ $palpite -ne $numero_correto ]
do
    read -p "Adivinhe o número (1-10): " palpite

    if [ $palpite -lt $numero_correto ]; then
        echo "Tente um número maior."
    elif [ $palpite -gt $numero_correto ]; then
        echo "Tente um número menor."
    fi
done
echo "Parabéns! Você adivinhou o número correto: $numero_correto"

#2. Crie um script que calcule a média de uma série de números inseridos pelo usuário usando um loop while.
soma=0
quantidade=0

read -p "Insira uma série de números (insira '0' para calcular a média):" numero

# Loop while para ler os números e calcular a soma
while [ $numero -ne 0 ]
do
    soma=$((soma + numero))
    quantidade=$((quantidade + 1))
    read numero
done

#Calcula a média
if [ $quantidade -gt 0 ]; then
    media=$(($soma / $quantidade))
    echo "A média dos números inseridos é: $media"
else
    echo "Nenhum número foi inserido."
fi

#3. Escreva um script que copie arquivos de um diretório para outro enquanto o usuário desejar continuar.
read -p "Digite o caminho do diretório de origem: " diretorio_origem
read -p "Digite o caminho do diretório de destino: " diretorio_destino

# Loop while para continuar copiando arquivos
resp="s"
while [ "$resp" = "s" ]
do
    read -p "Digite o nome do arquivo que deseja copiar: " arquivo

    # Verifica se o arquivo existe no diretório de origem
    if [ -f "$diretorio_origem/$arquivo" ]; then
        cp "$diretorio_origem/$arquivo" "$diretorio_destino"
        echo "Arquivo copiado com sucesso para o diretório de destino."
    else
        echo "Arquivo não encontrado no diretório de origem."
    fi

    echo "Deseja continuar copiando arquivos? (s/n)"
    read resp
done
echo "Encerrando o programa."

#4 Crie um script que conte quantas vezes um determinado caractere aparece em uma string
#digitada pelo usuário, usando um loop while.
read -p "Digite uma frase ou palavra: " string
read -p "Digite um caractere para contar: " caractere

#Inicializa a variável de contagem
contagem=0

# Calcular a contagem usando um loop while
i=1
tamanho=${#string}
while [ $i -le $tamanho ]
do
    if [ "${string:i-1:1}" = "$caractere" ]; then
        contagem=$((contagem + 1))
    fi
    i=$((i + 1))
done

echo "O caractere '$caractere' aparece $contagem vez(es) na frase ou palavra."

#5. Escreva um script que simule um jogo de dados, lançando dois dados repetidamente
#com um loop while até que a soma dos valores seja 7.
echo "Bem-vindo ao jogo de dados!"

# Loop while para jogar os dados até que a soma deles seja 7
while true
do
    dado1=$((RANDOM % 6 + 1))
    dado2=$((RANDOM % 6 + 1))
    soma=$((dado1 + dado2))

    echo "Dado 1: $dado1"
    echo "Dado 2: $dado2"
    echo "Soma: $soma"

    if [ $soma -eq 7 ]; then
        echo "Parabéns, você ganhou! A soma é 7."
        break
    fi

    read -p "Pressione Enter para lançar os dados novamente..."
done

echo "Fim do jogo."
