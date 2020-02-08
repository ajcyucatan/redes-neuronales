#!/bin/bash

function program_is_installed {
	local return_=1
	type $1 >/dev/null 2>&1 || { local return_=0; }
	echo "$return_"
}

function echo_pass {
	printf "\e[32m✔ ${1}"
	printf "\033\e[0m"
}

function echo_fail {
	printf "\e[31m✘ ${1}"
	printf "\033\e[0m"
}

function echo_if {
	if [ $1 == 1 ]; then
		echo_pass $2
	else
		echo_fail $2
	fi
}

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	if [ "`lsb_release -i | cut -f 2-`" == "Debian" -o "Ubuntu" -o "MX" -o "LinuxMint" -o "Raspbian" -o "Deepin" -o "antiX" -o "Tails" ]; then
		pwd
		which python
		echo "python version: `python -V`"
		echo "pip $(echo_if $(program_is_installed pip))"
		echo "conda $(echo_if $(program_is_installed conda))"
		if [ $(program_is_installed conda) == 1 ]; then
			conda -V
			conda activate
			conda info --envs
			while true
			do
				read -r -p "Create a new Python-Env? [y/n]: " input
				case $input in
					[yY][eE][sS]|[yY])
						echo "yes"
						pip install shyaml
						echo "`find / -name env.yml`"
						conda env create -f `find / -name env.yml` python=3.7
						conda info --envs
						conda activate `cat $(find / -name env.yml) | shyaml get-value name`
						break
						;;
					[nN][oO]|[nN])
						echo "no"
						cat `find / -name requirements.txt` | xargs -n 1 conda install
						break
						;;
					*)
						echo "Invalid input, try again..."
				esac
			done
		else
			while true
			do
				read -r -p "Install Conda? [y/n]: " input
				case $input in
					[yY][eE][sS]|[yY])
						echo "yes"
						cd ~; ls
						echo "Installing system dependencies for Conda..."
						sudo apt-get update -y
						sudo apt-get install build-essential libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 -y
						sudo apt-get install wget -y
						echo "Now we are going to install Conda..."
						MACHINE_TYPE=`uname -m`
						if [ ${MACHINE_TYPE} == 'x86_64' ]; then
							FILE=`mktemp`; sudo wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
						else
							FILE=`mktemp`; sudo wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86.sh -O ~/miniconda.sh
						fi
						bash ~/miniconda.sh -b -p ~/miniconda
						export PATH=~/miniconda/bin:$PATH
						while true
						do
							read -r -p "Create a new Python-Env? [y/n]: " input
							case $input in
								[yY][eE][sS]|[yY])
									echo "yes"
									pip install shyaml
									echo "`find / -name env.yml`"
									conda env create -f `find / -name env.yml` python=3.7
									conda info --envs
									conda activate `cat $(find / -name env.yml) | shyaml get-value name`
									break 2
									;;
								[nN][oO]|[nN])
									echo "no"
									find / -name requirements.txt -exec cat '{}' ';'
									cat `find / -name requirements.txt` | xargs -n 1 conda install
									break 2
									;;
								*)
									echo "Invalid input, try again..."
							esac
						done
						;;
					[nN][oO]|[nN])
						echo "no"
						if [ $(program_is_installed pip) == 1 ]; then
							which pip
							pip -V
							while true
							do
								read -r -p "Create a new Python-Env? [y/n]: " input
								case $input in
									[yY][eE][sS]|[yY])
										echo "yes"
										sudo pip install --upgrade virtualenv
										virtualenv --version
										pip install shyaml
										pwd; ls
										venv `cat $(find / -name env.yml) | shyaml get-value name`
										lsvirtualenv
										source `cat $(find / -name env.yml) | shyaml get-value name`/bin/activate
										break 2;
										;;
									[nN][oO]|[nN])
										echo "no"
										find / -name requirements.txt -exec cat '{}' ';'
										cat `find / -name requirements.txt` | xargs -n 1 pip install
										break 2;
										;;
									*)
										echo "Invalid input, try again..."
								esac
							done
						else
							sudo apt-get python-dev build-essential -y
							sudo apt-get update && sudo apt-get install python-pip -y
							sudo pip install --upgrade pip
							sudo pip install --upgrade virtualenv
							printf "Pip installed!"
							which pip
							pip -V
							while true
							do
								read -r -p "Create a new Python-Env? [y/n]: " input
								case $input in
									[yY][eE][sS]|[yY])
										echo "yes"
										virtualenv --version
										pip install shyaml
										pwd; ls
										echo "`find / -name env.yml`"
										venv `cat $(find / -name env.yml) | shyaml get-value name`
										lsvirtualenv
										source `cat $(find / -name env.yml) | shyaml get-value name`/bin/activate
										break 2
										;;
									[nN][oO]|[nN])
										echo "no"
										find / -name requirements.txt -exec cat '{}' ';'
										cat `find / -name requirements.txt` | xargs -n 1 pip install
										break 2
										;;
									*)
										echo "Invalid input, try again..."
								esac
							done
						fi
						;;
					*)
						echo "Invalid input, try again..."
				esac
			done
		fi
		printf "\033[0;32mDone!\033[0m\n"
		printf "You are ready to go!\n"
	else
		pwd
		which python
		echo "python version: `python -V`"
		echo "pip $(echo_if $(program_is_installed pip))"
		echo "conda $(echo_if $(program_is_installed conda))"
		if [ $(program_is_installed conda) == 1 ]; then
			conda -V
			conda activate
			conda info --envs
			while true
			do
				read -r -p "Create a new Python-Env? [y/n]: " input
				case $input in
					[yY][eE][sS]|[yY])
						echo "yes"
						pip install shyaml
						echo "`find / -name env.yml`"
						conda env create -f `find / -name env.yml` python=3.7
						conda info --envs
						conda activate `cat $(find / -name env.yml) | shyaml get-value name`
						break
						;;
					[nN][oO]|[nN])
						echo "no"
						cat `find / -name requirements.txt` | xargs -n 1 conda install
						break
						;;
					*)
						echo "Invalid input, try again..."
				esac
			done
		else
			while true
			do
				read -r -p "Install Conda? [y/n]: " input
				case $input in
					[yY][eE][sS]|[yY])
						echo "yes"
						cd ~; ls
						printf "\e[33mIf something went wrong, make sure your system satisfies the following dependencies for Conda:"
						printf "wget build-essential libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6\e[0m"
						echo "Now we are going to install Conda..."
						MACHINE_TYPE=`uname -m`
						if [ ${MACHINE_TYPE} == 'x86_64' ]; then
							FILE=`mktemp`; sudo wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
						else
							FILE=`mktemp`; sudo wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86.sh -O ~/miniconda.sh
						fi
						bash ~/miniconda.sh -b -p ~/miniconda
						export PATH=~/miniconda/bin:$PATH
						while true
						do
							read -r -p "Create a new Python-Env? [y/n]: " input
							case $input in
								[yY][eE][sS]|[yY])
									echo "yes"
									pip install shyaml
									echo "`find / -name env.yml`"
									conda env create -f `find / -name env.yml` python=3.7
									conda info --envs
									conda activate `cat $(find / -name env.yml) | shyaml get-value name`
									break 2
									;;
								[nN][oO]|[nN])
									echo "no"
									find / -name requirements.txt -exec cat '{}' ';'
									cat `find / -name requirements.txt` | xargs -n 1 conda install
									break 2
									;;
								*)
									echo "Invalid input, try again..."
							esac
						done
						;;
					[nN][oO]|[nN])
						echo "no"
						if [ $(program_is_installed pip) == 1 ]; then
							which pip
							pip -V
							while true
							do
								read -r -p "Create a new Python-Env? [y/n]: " input
								case $input in
									[yY][eE][sS]|[yY])
										echo "yes"
										sudo pip install --upgrade virtualenv
										virtualenv --version
										pip install shyaml
										pwd; ls
										venv `cat $(find / -name env.yml) | shyaml get-value name`
										lsvirtualenv
										source `cat $(find / -name env.yml) | shyaml get-value name`/bin/activate
										break 2;
										;;
									[nN][oO]|[nN])
										echo "no"
										find / -name requirements.txt -exec cat '{}' ';'
										cat `find / -name requirements.txt` | xargs -n 1 pip install
										break 2;
										;;
									*)
										echo "Invalid input, try again..."
								esac
							done
						else
							printf "\e[33mIf something went wrong, make sure to install:"
							printf "build-essential python-dev python-pip\e[0m"
							sudo pip install --upgrade pip
							sudo pip install --upgrade virtualenv
							printf "Pip installed!"
							which pip
							pip -V
							while true
							do
								read -r -p "Create a new Python-Env? [y/n]: " input
								case $input in
									[yY][eE][sS]|[yY])
										echo "yes"
										virtualenv --version
										pip install shyaml
										pwd; ls
										echo "`find / -name env.yml`"
										venv `cat $(find / -name env.yml) | shyaml get-value name`
										lsvirtualenv
										source `cat $(find / -name env.yml) | shyaml get-value name`/bin/activate
										break 2
										;;
									[nN][oO]|[nN])
										echo "no"
										find / -name requirements.txt -exec cat '{}' ';'
										cat `find / -name requirements.txt` | xargs -n 1 pip install
										break 2
										;;
									*)
										echo "Invalid input, try again..."
								esac
							done
						fi
						;;
					*)
						echo "Invalid input, try again..."
				esac
			done
		fi
		printf "\033[0;32mDone!\033[0m\n"
		printf "You are ready to go!\n"
	fi
else
	echo -e "\e[31mSystem not yet supported by this script...\033\e[0m"
fi
