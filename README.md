# docker-metaphlan

Docker image for MetaPhlAn 

## Introduction 

- MetaPhlAn is a powerful and widely used phylogeny annotation tool for whole metagenome shotgun sequencing. 
- This docker image may facilitate the usage of the software.
- Visit the following link for information on the program.
  - http://segatalab.cibio.unitn.it/tools/metaphlan/index.html
  - https://github.com/biobakery/MetaPhlAn/wiki/MetaPhlAn-4
- MetaPhlAn version: 4.1.0 (latest)

## Links

* GitHub Link: https://github.com/sp1020/docker-metaphlan
* DockerHub Link: https://hub.docker.com/repository/docker/sphong/metaphlan

## Quick Start 

### Download the MetaPhlAn database 

The database required to execute MetaPhlAn is not included in the image. You need to download the database before using MetaPhlAn analysis commands. You can download the database onto your local storage and mount it with `-v` option. 

You need to download the database only once. 

Step 1. Pull the image 

```bash
docker pull sphong/metaphlan
```

Step 2. Download the database

- Edit `download_databash.sh` file. 
  - Specify the local directory (`db_dir`) where the database will be downloaded
  - Specify the index of the database 
    - Example: `mpa_vJun23_CHOCOPhlAnSGB_202307`
    - Search for the latest database in the following URL.
      - http://cmprod1.cibio.unitn.it/biobakery4/metaphlan_databases/
- Download the database by executing the script.

```bash
./download_database.sh
```
- For reference, consult the document below.
  - https://github.com/biobakery/MetaPhlAn/wiki/MetaPhlAn-4

### Execute analysis 

#### Interactive analysis 

Step 1. Run a Docker container

* Mount directories 
  * MetaPhlAn database (<your_local_directory>)
  * Working directory with input files (`<your_local_directory>`)
```bash
$ docker run -it --rm -v <your_local_directory>:/database -v <your_analysis_directory>:/data sphong/metaphlan /bin/bash
```

Step 2. Execute `metaphlan` commands 

* ⚠ Use `--bowtie2db /database` argument to set up the MetaPhlAn database.
* ⚠ The working directory will be mounted to `/data`, designated as the Docker container's working directory. 

#### Script based analysis 

`MetaPhaAn` can be executed as a command line script. Refer to the following example.  

```bash
docker run -it --rm \
    -v "/data/database/MetaPhlAn/vJun23:/database" \
    -v "$PWD:/data" \
    -e USER_ID=$(id -u)\
    -e GROUP_ID=$(id -g)\
    sphong/metaphlan /bin/bash -c "metaphlan input/SRS014476-Supragingival_plaque.fasta.gz --input_type fasta --bowtie2db /database > profile.txt"
```

* In the above example the script was written as a string as the special character for redirection `>` cannot be sent as an input argument, and `/bin/bash -c` command was used to execute the script in the container. 
* Further, the example shows how to specify a user, ensuring the generated files are owned by the user instead of `root`, which facilitate easier file processing.
* `USER_ID` and `GROUP_ID` were delivered as environmental argument. (cf. Do not attempt to use `--user`)

## Prerequisite 

- docker 
- Over 15Gb memory 
- Over 7Gb of space (size of the image)

## License 

- MIT License 

## Maintainers 

- Seungpyo Hong at Jeonbuk National University 

## Acknowledgements 

- MetaPhlAn  

