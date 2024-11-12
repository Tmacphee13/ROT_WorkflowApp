#------- Docker images for nextflow workflows -------#
# rnaseq-nf
docker pull quay.io/nextflow/rnaseq-nf:latest


#------- Docker image for flask app --------#
docker build . -t rot_flask