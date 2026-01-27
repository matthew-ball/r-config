
# cran packages
cran_packages <- c("tidyverse",
                   "tidytext",
                   "tidymodels",
                   "tidygraph",
                   "ggstats",
                   "igraph", 
                   "ggraph", 
                   "tinytex",
                   "patchwork",
                   "gt",
                   "gtExtras",
                   "remotes", 
                   "survey", 
                   "srvyr",
                   "quanteda",
                   "quanteda.textstats",
                   "quanteda.textplots")

# install only missing packages (avoid re-installing packages everytime)
cran_install <- setdiff(packages, rownames(installed.packages()))

if (length(cran_install) > 0) {
    install.packages(cran_install)
} else {
    message("Requested packages are already installed.")
}

# remote packages
remote_packages <- c(
    "quanteda.tidy" = "quanteda/quanteda.tidy",
    "vosonSML"      = "vosonlab/vosonSML",
    "VOSONDash"     = "vosonlab/VOSONDash")

remote_install <- setdiff(names(remote_packages), rownames(installed.packages()))

if (length(remote_install) > 0) {
    remotes::install_github(remote_packages[remote_install])
} else {
    message("Requested remote packages are already installed.")
}

# remotes::install_github("quanteda/quanteda.tidy")
# remotes::install_github("vosonlab/vosonSML")
# remotes::install_github("vosonlab/VOSONDash")

