#!/usr/bin/env Rscript

# #####################
# ##### Load
# #####################

options(scipen=10000)

root_dir="~/"
project_dir="data/"
dir_data=paste0(root_dir,project_dir)

#####################
##### Install
#####################

##### Cran
pk <- c("devtools", "stringr", "dplyr",
        "rgdal", "car", "plotly",
        "plm", "MatrixModels", "leaflet",
        "plotly", "gpclib", "rgeos",
        "leaflet.extras","Hmisc",
        "parallel",  "qgraph", # "WGCNA",
        "energy", # "Pigengene"
        "tictoc", "velox", "RJSONIO", "kableExtra", "furrr") #
install <- pk[!(pk %in% installed.packages()[,'Package'])]
if(length(install)) install.packages(install)
res <- lapply(pk, require, character.only = TRUE)
if(Reduce(res, f = sum)/length(pk) < 1) stop('Some packages could not be loaded.')

library("Pigengene")



#####################
##### Source Install before loading
##### TODO(rsanchezavalos) install in dockerfile
#####################
# ##### Source & dev
# # GIT - devtools
# # --------
# #install.packages("de   vtools")
# install.packages("plm") # https://cran.r-project.org/web/packages/plm/vignettes/plmPackage.html

# # INLA
# # --------
# TODO(rsanchezavalos) # freeze INLA version
# install.packages("INLA", repos=c(getOption("repos"),
#                                   INLA="https://inla.r-inla-download.org/R/stable"),
#                   dep=TRUE)
# library("INLA")

# #INLA:::inla.dynload.workaround()
# This function is replaced by: inla.binary.install() in new R - use -> 
# * Install file [https://inla.r-inla-download.org/Linux-builds/./CentOS Linux-6 (Core)/Version_21.02.23/64bit.tgz]

# # inla.binary.install()
# # BiocManager
# # --------
# # R > 3.5.0
# if (!requireNamespace("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")
# # BiocManager::install(c("biocLite"))
# # R < 3.5.0
# #source("https://bioconductor.org/biocLite.R")
# biocLite("Pigengene")