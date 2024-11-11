params.outdir = 'results'

process MULTIQC {
    publishDir params.outdir, mode:'copy'

    input:
    path('*') 

    output:
    path('multiqc_report.html')

    script:
    """
    multiqc .
    """
}