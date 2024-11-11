process MULTIQC {
    publishDir params.outdir

    input:
    path('*') 

    output:
    path('multiqc_report.html')

    script:
    """
    multiqc .
    """
}