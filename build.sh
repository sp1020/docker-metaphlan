docker build -f Dockerfile.4.1.0 -t sphong/metaphlan:4.1.0 .
docker build -f Dockerfile.4.1.0 -t sphong/metaphlan:latest .
docker push sphong/metaphlan:4.1.0
docker push sphong/metaphlan:latest