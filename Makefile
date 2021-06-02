
sudo docker run -d -p 8889:8787 -e ROOT=TRUE  -e PASSWORD=geotest --name geo_3_5_1  -v $(pwd):/home/rstudio rocker/geospatial:4.0.0
docker start geo_3_5_1

# sudo docker run -d -p 8889:8787 -e ROOT=TRUE  -e PASSWORD=geotest --name geo_inla_bio -v $(pwd):/home/rstudio bioconductor/bioconductor_docker:devel
# docker start geo_inla_bio
