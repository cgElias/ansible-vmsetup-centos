#!/bin/bash
# Entrypoint VM Setup routine
usage()
{
  # Install git
  echo "Usage: sudo ./setup.sh [option]"
  echo "Available Options:"
  echo " --help                Print this message."
  echo " --skip-ansible        Skip Ansible installation."
  echo " --skip-go             Skip go installation."
  echo " --skip-python         Skip python installation."
  echo " --skip-git            Skip git installation."
  exit 0
}

while [ "$1" != "" ]; do
    echo "Using Option: $1"
    # echo "You now have $# positional parameters"

    case $1 in
      --skip-git )             skip_git=1
                            ;;
      --skip-python )          skip_python=1
                            ;;
      --skip-go )              skip_go=1
                            ;;
      --skip-ansible )         skip_ansible=1
                            ;;
      --skip-requirements )    skip_requirements=1
                            ;;
      --help )                 usage
    esac

    # Shift all the parameters down by one
    shift
done

# Make sure we are root
if [[ $EUID -ne 0 ]]; then
  echo "Setup can only be run as root user! Exiting."
  exit 1
fi

if [ "$skip_requirements" != "1" ]; then
# Update cache and essentials
echo "Updating cache and preparing.."
sudo apt-get update
sudo apt-get install build-essential checkinstall -y
sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev -y
fi

if [ "$skip_git" != "1" ]; then
# Install git
echo "Setting up git.."
sudo apt-get install git -y
fi

if [ "$skip_go" != "1" ]; then
# Install go
echo "Setting up go.."
mkdir -p $HOME/elias-test/go
sudo apt-get update
sudo apt-get -y upgrade
wget https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz
sudo tar -xvf go1.9.2.linux-amd64.tar.gz
sudo mv go /usr/local
export GOROOT=/usr/local/go
export GOPATH=$HOME/elias-test/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
fi

if [ "$skip_python" != "1" ]; then
# Download and Install Python 2.7.14
echo "Setting up Python.."
cd /usr/src
wget https://www.python.org/ftp/python/2.7.14/Python-2.7.14.tgz
tar xzf Python-2.7.14.tgz
cd Python-2.7.14
sudo ./configure
sudo make altinstall
fi

if [ "$skip_ansible" != "1" ]; then
# Download and Install Ansible
echo "Setting up Ansible.."
sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update 
sudo apt-get install ansible -y
fi

# Show distribution and release
echo "Distribution: "
cat /etc/*-release
# Show Kernel Version
echo "Kernel Version: "
uname -a
# Show GCC Version
echo "GCC/Kernel:"
cat /proc/version
