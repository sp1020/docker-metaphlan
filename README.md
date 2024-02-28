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

### Download the MetaPhlAn library 

The database required to execute MetaPhlAn is not included in the image. You need to download the database before using MetaPhlAn analysis commands. You can download the database onto your local storage and mount it with `-v` option. 

You need to download the database only once. 

Step 1. Pull the image 

```
docker pull sphong/metaphlan
```

Step 2. Download the database

```
docker run -it --rm -v <your_local_directory>:/database sphong/metaphlan metaphlan --install --bowtie2db /database
```
(*) Replace <your_local_directory> with the absolute path of the directory to download the MetaPhlAn database.


### Execute analysis 

```
$ docker run -it --rm -v <your_local_directory>:/database -v <your_analysis_directory>:/analysis sphong/metaphlan /bin/bash
```
⚠ Replace `<your_local_directory>` with the absolute path of the database directoy on your local machine.

⚠ `--bowtie2db /database` argument should be used for command using the MetaPhlAn database.

⚠ Place the input file on the local machine (`<your_analysis_directory>`). (In the above script it will be loaded into `/analysis` directory)

## Prerequisite 

- docker 
- Over 15Gb memory 
- Over 5Gb of space (size of the image)

## License 

- MIT License 

## Maintainers 

- Seungpyo Hong at Jeonbuk National University 

## Acknowledgements 

- MetaPhlAn  

