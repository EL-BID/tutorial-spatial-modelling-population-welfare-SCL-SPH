# Tutorial Spatial Modelling Population Welfare (El Salvador)

## Overview

The aim of the analysis is to create a high resolution map of poverty, income and literacy for El Salvador. The data on these three development indicators come from the 2017 household survey *Encuesta de Hogares de Propositos Multiples* (EHPM). While the survey data are only available for 1,664 *segmentos*, the lowest administrative units, the goal is to provide a map of the three development indicators for all the 12,435 *segmentos* of the country.

This is made possible by building a statistical model exploiting the relationship between remote sensed (RS) data (e.g. lights a night measured from satellite, precipitation), the EHPM survey data and the spatial correlation between SDGs outcomes across space. Once the relationship between the EHPM survey data and the RS data is modeled in locations where EHPM survey data are available, RS data, which are available for the entire country, are used to predict SDG outcomes across the entire country. Furthermore, as SDG outcomes of two *segmentos* are more likely to be similar if both *segmentos* are neighbours than if they are far away from each other, the accuracy of the spatial prediction can be enhanced by taking explicitly into account the spatial distances and spatial relationships between *segmentos*.

## Methodology
The interpolation technique we use in this report is based on Bayesian geospatial methods implemented in the open source statistical computing environment R [@R2018]. The core of the modelling method is implemented in the R package `INLA` [@INLA_theory_1;@INLA_theory_2;@INLA_R_1;@INLA_R_2].

## Requirements
Several other R packages are used in this tutorial. The main ones are `dplyr` [@dplyr] for data handling, `plotly` [@plotly] for interactive plots, `leaflet` [@leaflet] for interactive maps,  `raster` [@raster] for handling raster data, `rgdal`  [@rgdal] for loading vector files, `sp` [@sp] for adjusting coordinates systems, `energy` [@energy] to compute distance correlation and `parallel` [@parallel] to parallise the covariates selection process.

## Steps
These are the five main steps of the analysis:

1.  Data pre-processing
2.  Covariate pre-selection
3.  Model fitting
4.  Diagnostic checks
5.  Out of sample spatial interpolation to create high resolution maps.

A brief introduction to the INLA method is provided in Section \@ref(theory). Three books are recommended for those willing to get more information on the INLA approach:

*   for readers with only a minimal quantitative background: *Beginner's Guide to Spatial, Temporal, and Spatial-Temporal Ecological Data Analysis with R-Inla* [@zuur2017beginner],
*   for those willing to delve deeper in the methodology behind INLA: *Spatial and Spatio-Temporal Bayesian Models with R-Inla* [@blangiardo2015spatial].
*   for those interested by an application to public health: *Geospatial Health Data: Modeling and Visualization with R-INLA and Shiny*[@moraga2019geospatial]

Bakka et al. [@Bakka] provide a good overview of spatial modelling with `INLA` and  Steele et al. [@steele2017mapping] provide a great example of the use of `INLA` for poverty mapping.

For information about the R-INLA package, please refer to the [R-INLA project website](http://www.r-inla.org/).


### Installation Guide
---
Using the rocker/rstudio container

#### Using the rocker/geospatial image

##### Quickstart

Build image (aprox 5 GB)

```
    docker build --tag rocker_geospatial  . 
```

Run container

```
    sudo docker run -d -p 8787:8787 -e ROOT=TRUE  -e PASSWORD=geotest -v $(pwd):/home/rstudio rocker_geospatial
```

Visit `localhost:8787` in your browser and log in with username `rstudio` and the password you set. **NB: Setting a password is now REQUIRED.**  Container will error otherwise.


### Limitation of responsibilities
---
The IDB is not responsible, under any circumstance, for damage or compensation, moral or patrimonial; direct or indirect; accessory or special; or by way of consequence, foreseen or unforeseen, that could arise:

I. Under any concept of intellectual property, negligence or detriment of another part theory; I
ii. Following the use of the Digital Tool, including, but not limited to defects in the Digital Tool, or the loss or inaccuracy of data of any kind. The foregoing includes expenses or damages associated with communication failures and / or malfunctions of computers, linked to the use of the Digital Tool.

