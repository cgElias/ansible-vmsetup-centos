#!/bin/bash
# Entrypoint VM Setup routine

# Make sure we are root
if [[ $EUID -ne 0 ]]; then
  echo "Setup can only be run as root user! Exiting."
  exit 1
fi

# Update cache and essentials
echo "Updating cache and preparing.."
apt-get update
apt-get install build-essential checkinstall
apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev

# Download and Install Python 2.7.14
echo "Setting up Python.."
cd /usr/src
wget https://www.python.org/ftp/python/2.7.14/Python-2.7.14.tgz
tar xzf Python-2.7.14.tgz
cd Python-2.7.14
./configure
make altinstall

# Download and Install Ansible
echo "Setting up Ansible.."
apt-get install software-properties-common
apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install ansible

# Show distribution and release
echo "Distribution: "
cat /etc/*-release
# Show Kernel Version
echo "Kernel Version: "
uname -a
# Show GCC Version
echo "GCC/Kernel:"
cat /proc/version
