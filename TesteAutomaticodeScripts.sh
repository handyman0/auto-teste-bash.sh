#!/bin/bash

# entrada das variaveis
#ultima_vpython=$(echo "Python" $(curl -s https://www.python.org/downloads/ | grep -o 'Python [0-9.]\+' | awk '{print $2}' | head -n 1))


# entrada - recebendo as entradas do usuario, qual menos interações melhor.

read -p "Qual o nome do arquivo?" ARQUIVO

# ------------- entrada das funções ------------

#criando função para verificar a ultima versão do python

ultima_vpython() {
	# URL do site
	url="https://www.python.org/downloads/"

	# Usando curl para obter o conteúdo da página
	conteudo=$(curl -s "$url")

	# Verifica se a requisição foi bem-sucedida (status HTTP 200)
	if [ $? -ne 0 ]; then
		echo "Erro ao obter conteúdo da página."
		exit 1
	fi

	# Extrai a versão mais recente do Python usando grep
	versao_python=$(echo "$conteudo" | grep -o 'Python [0-9.]\+' | awk '{print $2}' | head -n 1)

	# Verifica se a informação foi encontrada
	if [ -n "$versao_python" ]; then
		echo "Python $versao_python"
	else
		echo "Não obteve informações da ultima versão"
	fi
}

#fazer uma função de instalação da ultima versão do python
instalacao_python() {
	echo "Atualizando listas de pacotes..."
	sudo apt update
	sleep 1
	clear
	sudo apt install -y python3
	sleep 1
	echo "instalação Concluida!"
	sleep 1
	clear
}

# função que verifica a versão python que foi instalada

verifica_python () {
	# Tenta usar o comando 'python', se não estiver disponível, usa 'python3'
	if command -v python &> /dev/null; then
		versao_instalada=$(python -c "import sys; print(sys.version[:1])")
	else
		if command -v python3 &> /dev/null; then
			versao_instalada=$(python3 -c "import sys; print(sys.version[:1])")
		else
			echo "O python não esta instalado no seu sistema."
			echo "A ultima versão é a: $ultima_vpython"
			read -p "Deseja instalar a versão mais recente? (S/N)" resposta
			case resposta in
				y|Y|S|s)
					instalacao_python
					;;
				N|n)
					echo "saindo..."
					exit 0
					;;
				*)
					echo "opcao invalida!"
					exit 1
					;;
			esac
		fi
	fi
	versao_instalada="python$versao_instalada"
}

# A função teste é usada para fazer o loop do arquivo definido, o contador foi definido
# para testar a cada 1 segundo, caso queira trocar fique a vontade! deixe menos que 5 segundos.
teste () {
	contador=1

	while [ $contador -le 5 ]
	do
		clear
		echo "Realizando o teste do $ARQUIVO:"
		echo "-------------------------------"
		echo ""
		$ARQUIVO
		clear
		done
}

# identificando o tipo de arquivo

case $ARQUIVO in
	*.c)
		echo "Executando arquivo em C..."
		sleep 1
		clear
		gcc $ARQUIVO -o $ARQUIVO
		./$ARQUIVO
		;;
	*.sh)
		echo "Execuntando arquivo em Bash..."
                sleep 1
                clear
                source $ARQUIVO
                ;;
	*.py)
		echo "Executando arquivo em Python..."
		verifica_python
		$versao_instalada $ARQUIVO
		;;
	*)
		echo "linguagem do arquivo não encontrada!"
		echo ""
		echo "Qual linguagem a linguagem do arquivo?"
		echo ""
		echo "1 - Linguagem C"
		echo "2 - Bash Script"
		echo "3 - Python"
		read -p "Qual linguagem esta sendo usada?" opcao
		case $opcao in
			1)
				echo "Executando arquivo em C..."
				sleep 1
				clear
				gcc $ARQUIVO -o $ARQUIVO
				./$ARQUIVO
				;;
			2)
				echo "Executando arquivo em Bash..."
				sleep 1
				clear
				source $ARQUIVO
				;;
			3)
				echo "Executando arquivo em Python..."
		                verifica_python
                		$versao_instalada $ARQUIVO
                		;;

			*)
				echo "opção invalida, saindo..."
				sleep 1
				exit 2
				;;
		esac
		;;
esac
# exemplo do algoritmo de execução
$ARQUIVO teste
