#!/bin/bash
# Developer: Derxs
# Version: 1.0
if [[ $UID == "0" ]]
then
sleep 0.5
echo -e "\033[01;32m
╦╔═╗╔╦╗
║╚═╗ ║
╩╚═╝ ╩ (Install Sublime Text)\033[00;00m
"
	sleep 0.5
	echo -e -n "\033[01;34m[+]\033[00;00m Instalando chave GPG... \033[01;32m"
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
	echo -e -n "\033[01;34m[+]\033[00;00m Adicionando repositório... ";echo "deb https://download.sublimetext.com/ apt/stable/" >> /etc/apt/sources.list
	if [[ $? == "0" ]]
	then
		sleep 0.5
		echo -e "\033[01;32mOK\033[00;00m"
		echo -e -n "\033[01;34m[+]\033[00;00m Aguarde a instalação..."
		apt-get update >> /dev/null
		apt-get install sublime-text -y >> /dev/null
		if [[ $? == "0" ]]
		then
			echo -e "\033[01;32mOK\033[00;00m"
			echo -e -n "\033[01;34m[+]\033[00;00m Baixando licenças... "
			apt-get install curl -y >> /dev/null
			curl -s https://gist.githubusercontent.com/RoseySoft/b751e8d8d7227d0c937da3363188b6de/raw/90992d7e53b1a3e74d3fb0d446b8438ddaf7fa13/LICENCE%2520SUBLIME%2520TEXT > licencas.txt
			if [[ $? == "0" ]]
			then
				echo -e "\033[01;32mOK\033[00;00m"
				echo -e "\033[01;34m[+]\033[00;00m Instalação concluída!"
			else
				echo -e "\033[01;32mERRO\033[00;00m"
			fi
		else
			echo;echo -e "\033[01;31m[!]\033[00;00m Erro!"
		fi
	else
		echo -e "\033[01;31mERRO\033[00;00m"
	fi
else
	echo -e "\033[01;31m[!]\033[00;00m Execute com usuário root!"
fi
