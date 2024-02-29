#!/bin/bash

# Set the local directory where the database will be downloaded.
db_dir="/data/database/MetaPhlAn/vJun23"

# Set the index (version) of the database
db_index="mpa_vJun23_CHOCOPhlAnSGB_202307" 

# Download the database
mkdir -p $db_dir
docker run -it --rm -v $db_dir:/database sphong/metaphlan metaphlan --install --index $db_index --bowtie2db /database
