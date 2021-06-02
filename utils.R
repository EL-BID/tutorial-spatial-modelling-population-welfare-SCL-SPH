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
        "car", "plotly", "leaflet", "plotly", 
        "RJSONIO", "kableExtra", "furrr", "leaflet.extras",
        "qgraph", "tictoc",  "energy",
        "parallel", "WGCNA",
        # "Pigengene",
        "plm", "MatrixModels", 
        "Hmisc","gpclib", "rgeos","rgdal", "velox"
        ) #,
install <- pk[!(pk %in% installed.packages()[,'Package'])]
if(length(install)) install.packages(install)
res <- lapply(pk, require, character.only = TRUE)
if(Reduce(res, f = sum)/length(pk) < 1) stop('Some packages could not be loaded.')


install_github("hunzikp/velox")

#####################
##### Source Install before loading
##### TODO(rsanchezavalos) install in dockerfile
####################
##### Source & dev
# GIT - devtools
# --------
#install.packages("de   vtools")
#install.packages("plm") # https://cran.r-project.org/web/packages/plm/vignettes/plmPackage.html


#####################################################
# INLA
# --------
#TODO(rsanchezavalos) # freeze INLA version
# install.packages("INLA", repos=c(getOption("repos"),
#                                   INLA="https://inla.r-inla-download.org/R/stable"),
#                   dep=TRUE)

# R > 3.5.0
#INLA:::inla.dynload.workaround()
#This function is replaced by: inla.binary.install() in new R - use ->
#* Install file [https://inla.r-inla-download.org/Linux-builds/./CentOS Linux-6 (Core)/Version_21.02.23/64bit.tgz]

# inla.binary.install()
#library("INLA")

#####################################################
# Install BiocManager - biocLite
# --------
# R < 3.5.0
#source("https://bioconductor.org/biocLite.R")

# R > 3.5.0
# if (!requireNamespace("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")

# update.packages()
# source("https://bioconductor.org/biocLite.R")
# biocLite()


# Bioconductor version 3.8 (BiocManager 1.30.4), R 3.5.1 (2018-07-02)
# BiocManager::install(c("biocLite"))

#####################################################

# R > 4.0.0
# install.packages("INLA",repos=c(getOption("repos"),INLA="https://inla.r-inla-download.org/R/stable"), dep=TRUE)
# 
# if (!requireNamespace("BiocManager", quietly = TRUE))
#         install.packages("BiocManager")
# BiocManager::install(c("graph", "Rgraphviz"), dep=TRUE)
# BiocManager::install(c("Pigengene"))


library("graph")
library("Rgraphviz")
library("Pigengene")

