process FASTQC {
    publishDir params.outdir
    tag "FASTQC on $sample_id"

    input:
    tuple val(sample_id), path(reads)

    output:
    path "fastqc_${sample_id}_logs" 

    script:
    """
    fastqc.sh "$sample_id" "$reads"
    """
}