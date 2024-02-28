mkdir -p /data/database/MetaPhlAn/vJun23
docker run -it --rm -v /data/database/MetaPhlAn/vJun23 sphong/metaphlan metaphlan --install --index mpa_vJun23_CHOCOPhlAnSGB_202307 --bowtie2db /database