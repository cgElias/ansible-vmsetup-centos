#!/bin/bash
# Entrypoint VM Setup routine
usage()
{
  # Install git
  echo "Usage: sudo ./setup.sh [option]"
  echo "Available Options:"
  echo " --help                Print this message."
  echo " --skip-ansible        Skip Ansible installation."
  echo " --skip-requirements   Skip Requirements installation."
  echo " --skip-git            Skip git installation."
  exit 0
}

while [ "$1" != "" ]; do
    echo "Using Option: $1"
    # echo "You now have $# positional parameters"

    case $1 in
      --skip-git )             skip_git=1
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
sudo yum install epel-release
fi

if [ "$skip_git" != "1" ]; then
# Install git
echo "Setting up git.."
sudo yum install git
fi

if [ "$skip_ansible" != "1" ]; then
# Download and Install Ansible
echo "Setting up Ansible.."
sudo yum install ansible
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
