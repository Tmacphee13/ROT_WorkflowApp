nextflow run rnaseq_main.nf -c ../nextflow.config -profile docker 

# use this command to run the pipeline with a params file
# nextflow run rnaseq_main.nf -c ../nextflow.config -profile docker -params-file input/rnaseq/params.json