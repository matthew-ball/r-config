#!/bin/bash

set -e # exit the process if any command fails

# update system
sudo apt update

# download latest rstudio
# rstudio_address="https://download1.rstudio.org/electron/jammy/amd64/rstudio-2025.09.2-418-amd64.deb"
rstudio_address="https://download1.rstudio.org/electron/jammy/amd64/rstudio-latest-amd64.deb"
rstudio_file="${rstudio_address##*/}"

wget "$rstudio_address" -O "$rstudio_file"

# install latest rstudio
sudo apt install "./$rstudio_file"
