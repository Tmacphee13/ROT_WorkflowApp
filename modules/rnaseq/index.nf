
process INDEX {
    container 'rnaseq-nf:latest'
    tag "$transcriptome.simpleName"

    input:
    path transcriptome 

    output:
    path 'index' 

    script:
    """
    salmon index --threads $task.cpus -t $transcriptome -i index
    """
}
