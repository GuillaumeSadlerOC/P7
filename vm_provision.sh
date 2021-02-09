#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade

# VIM INSTALL (TEXT EDITOR)
sudo apt-get -y install vim zip unzip wget

# TERRAFORM INSTALL
# Mise en place du binaire la ou linux récupère les binaires par défaut afin de pouvoir utiliser directement le mot-clé terraform
sudo unzip ./datas/terraform_0.14.4_linux_amd64.zip -d /usr/local/bin

# ANSIBLE INSTALL
sudo apt-get -y install ansible