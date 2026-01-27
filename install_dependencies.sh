
#!/bin/bash

set -e # exit the process if any command fails

# update system
sudo apt update

# install image libraries
echo "Installing image libraries"
sudo apt install -y \
    libpng-dev libjpeg-dev libtiff5-dev libwebp-dev libfreetype6-dev \
    libharfbuzz-dev libfribidi-dev

# install networking packages
echo "Install networking packages"
sudo apt install -y \
    libcurl4-openssl-dev libxml2-dev

# geospatial stack

# compression libraries

# math libraries

# install R packages
echo "Running R package installation"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
Rscript "$SCRIPT_DIR/install_packages.R"
