include { QUANT } from './modules/rnaseq_custom/quant'

workflow {
    in_ch = Channel
        .fromPath(params.samplesheet)
        .splitCsv(header: ['sample_id', 'read1', 'read2'], skip: 1)
        .map { row -> [row.sample_id, file(row.read1), file(row.read2)] }
    in_ch.view()
    QUANT( in_ch )
}


/*
workflow.onComplete {
	log.info ( workflow.success ? """
    Done!
    Multiqc Report            --> $params.outdir/multiqc_report.html
    Expression Quantification --> $params.outdir/quant/
    """ : "Oops .. something went wrong" )
}
*/