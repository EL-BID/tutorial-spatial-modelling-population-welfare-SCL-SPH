FROM rocker/geospatial:3.5.1

RUN apt-get update \
	&& apt-get install -y libudunits2-dev
RUN apt-get update && apt-get install -y --no-install-recommends \
	build-essential python3 python3-dev python3-wheel \
	libpython3-dev python3-virtualenv \
    python3-pip libssl-dev libffi-dev apt-utils
