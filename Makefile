sudo docker run -d -p 8889:8787 -e ROOT=TRUE  -e PASSWORD=geotest --name geo_3_5_1  -v $(pwd):/home/rstudio rocker/geospatial:3.5.1
# 4.0.0,3.6.0 3.5.0 3.4.0 3.6.2
docker start geo_3_5_1
