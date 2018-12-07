# run_all.sh
# Authors: Alden Chen, Birinder Singh
# Date: 2018/12/07
# 
# This Dockerfile builds a container from the rocker/tidyverse image
# for our Titanic analysis project.
#
# Usage: docker run -it -e PASSWORD=test -v <file-path-to-project-root>:/titanic titanic /bin/bash


# use rocker/tidyverse as the base image and
FROM rocker/tidyverse

# install R packages
RUN R -e "install.packages('png', repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages('gridExtra', repos = 'http://cran.us.r-project.org')"


# install python 3
RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

# get python package dependencies
RUN apt-get install -y python3-tk

# install python packages
RUN pip3 install numpy 
RUN pip3 install pandas
RUN pip3 install scikit-learn
RUN pip3 install argparse
RUN apt-get install -y graphviz && pip install graphviz
RUN pip3 install seaborn
RUN apt-get update && \
    pip3 install matplotlib && \
    rm -rf /var/lib/apt/lists/*
