process QUANT {
    publishDir params.outdir

    input:
    tuple ( val(id), path(read1), path(read2) )

    output:
    val(id)
    path('*_counts.txt')

    script:
    """
    quant.sh ${id} ${read1} ${read2}
    """
}