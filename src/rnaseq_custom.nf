#!/usr/bin/env nextflow 
nextflow.enable.dsl = 2

/*
 * Default pipeline parameters. They can be overriden on the command line eg.
 * given `params.foo` specify on the run command line `--foo some_value`.
 */

params.samplesheet = "$baseDir/input/rnaseq_custom/samplesheet.csv"
params.outdir = "$baseDir/results"

log.info """\
 R N A S E Q - C U S T O M  P I P E L I N E
 ===================================
 samplesheet    : ${params.samplesheet}
 outdir         : ${params.outdir}
 """

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
    Expression Quantification --> $params.outdir/<sample_id>_counts.txt
    """ : "Oops .. something went wrong" )
}
*/