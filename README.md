# ROT_WorkflowApp
This application will be used to run and manage bioinformatics workflows and downstream analysis

### Project Plan Overview
![](images/ROT_ProjectPlan.drawio.png)


### Preprocessing
This application will process biological data using the Nextflow engine. We will start with basic RNASeq using fastq files as input and generating count data.  

The steps for going from raw fastq to processed counts and qc include:  
1. indexing of reference genome
2. qc of input fastq files
3. count generation using STAR/Kallisto


#### Bulk RNASEQ 

For this use case, we are going to use Paolo DiTomasso's slimmed down version of the RNAseq workflow. This workflow contains index, quant, and qc steps using salmon and fastqc (with multiqc for collection and reporting of qc output). To do some more custom count generation, we may also include a quant workflow step with bash processing of the raw fastq files.  

To run the rnaseq workflow, follow these steps:  
1. Pull the rnaseq-nf image using `./docker/rnaseq/pull.sh`  
2. Update params file to point to appropriate transcriptome files and fastq files  
3. Run the workflow with `./src/run_rnaseq.sh`  

Output will be sent to `src/results` with multiqc results contained in the html file and count results in the `src/results/quant` folder




