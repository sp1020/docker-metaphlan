#!/bin/bash
### reference: https://github.com/biobakery/biobakery/wiki/metaphlan4#11-input-files
mkdir -p input

cd input

file_list="SRS014476-Supragingival_plaque.fasta.gz SRS014494-Posterior_fornix.fasta.gz SRS014459-Stool.fasta.gz SRS014464-Anterior_nares.fasta.gz SRS014470-Tongue_dorsum.fasta.gz SRS014472-Buccal_mucosa.fasta.gz"

for fn in $file_list; do
    if [ ! -f $fn ]; then
        wget "https://github.com/biobakery/MetaPhlAn/releases/download/4.0.2/$fn"
    else
        echo "File exist: $fn"
    fi
done

cd ..

docker run -it --rm \
    -v "/data/database/MetaPhlAn/vJun23:/database" \
    -v "$PWD:/data" \
    -e USER_ID=$(id -u)\
    -e GROUP_ID=$(id -g)\
    sphong/metaphlan /bin/bash -c "metaphlan input/SRS014476-Supragingival_plaque.fasta.gz --input_type fasta --bowtie2db /database > profile.txt"
