
#!/bin/bash

set -e # exit the process if any command fails

# update system and install necessary tools
sudo apt update
sudo apt install -y --no-install-recommends software-properties-common dirmngr apt-transport-https

# add CRAN GPG key
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc \
    | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc

# add CRAN repository for Ubuntu
sudo add-apt-repository \
    "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

# update package lists and install R
sudo apt update
sudo apt install -y r-base r-base-dev
