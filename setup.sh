#!/bin/bash

set -e # exit the process if any command fails

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# install r
echo "Installing R"
bash "$SCRIPT_DIR/install_r.sh"

# install rstudio
echo "Installing RStudio"
bash "$SCRIPT_DIR/install_rstudio.sh"

# install r package dependencies
echo "Installing R package dependencies"
bash "$SCRIPT_DIR/install_dependencies.sh"

# install R packages
echo "Installing R packages"
Rscript "$SCRIPT_DIR/install_packages.R"
