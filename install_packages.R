
# NOTE cran packages
cran_packages <- c("tidyverse",
                   "tidytext",
                   "tidymodels",
                   "tidygraph",
                   "janitor",
                   "ggstats",
                   "ggforce",
                   "igraph",
                   "ggraph",
                   "tinytex",
                   "patchwork",
                   "gt",
                   "gtExtras",
                   "remotes",
                   "survey",
                   "srvyr",
                   "quarto",
                   "quanteda",
                   "quanteda.textstats",
                   "quanteda.textplots",
                   "bibliometrix",
                   "modelsummary")

# NOTE remote packages
remote_packages <- c(
    "quanteda.tidy"         = "quanteda/quanteda.tidy",
    "quanteda.sentiment"    = "quanteda/quanteda.sentiment",
    "quanteda.dictionaries" = "kbenoit/quanteda.dictionaries",
    "openalexR"             = "ropensci/openalexR",
    "vosonSML"              = "vosonlab/vosonSML",
    "VOSONDash"             = "vosonlab/VOSONDash")

# NOTE auto-detect environment paths
primary_library <- .libPaths()[1]
message(paste("Target library path resolved to:", primary_library))

# NOTE install only missing CRAN packages (avoid re-installing packages every time)
installed_packages <- rownames(installed.packages())
cran_install <- setdiff(cran_packages, installed_packages)

if (length(cran_install) > 0) {
    message(paste("Installing", length(cran_install), "missing CRAN packages..."))
    install.packages(cran_install, lib = primary_library)
} else {
    message("Requested packages are already installed.")
}

# NOTE ensure {remotes} is loaded before trying to use it
if (!requireNamespace("remotes", quietly = TRUE)) {
    stop("Critical Error: '{remotes}' package failed to install via CRAN.")
}

# NOTE install missing remote packages
remote_install <- setdiff(names(remote_packages), installed_packages)

if (length(remote_install) > 0) {
    message(paste("Installing", length(remote_install), "missing remote packages..."))

    remote_targets <- unname(remote_packages[remote_install])

    for (repo in remote_targets) {
        message(paste("Installing GitHub repository:", repo))
        remotes::install_github(
            repo,
            lib = primary_library,
            upgrade = "never", # NOTE stops dependencies from aggressively re-compiling
            dependencies = TRUE
        )
    }
} else {
    message("Requested remote packages are already installed.")
}

message("Environment configuration complete.")
