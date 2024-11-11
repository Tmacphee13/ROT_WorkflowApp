#!/usr/bin/env nextflow 
nextflow.enable.dsl = 2

/*
 * Default pipeline parameters. They can be overriden on the command line eg.
 * given `params.foo` specify on the run command line `--foo some_value`.
 */

params.reads = "$baseDir/data/ggal/*{1,2}.fq"
params.transcriptome = "$baseDir/data/ggal/transcriptome.fa"
params.outdir = "results"

log.info """\
 R N A S E Q - N F   P I P E L I N E
 ===================================
 transcriptome: ${params.transcriptome}
 reads        : ${params.reads}
 outdir       : ${params.outdir}
 """

// import modules
include { RNASEQ } from './modules/rnaseq/rnaseq'
include { MULTIQC } from './modules/rnaseq/multiqc'

/* 
 * main script flow
 */
workflow {
  read_pairs_ch = channel.fromFilePairs( params.reads, checkIfExists: true ) 
  RNASEQ( params.transcriptome, read_pairs_ch )
  MULTIQC( RNASEQ.out )
}

/* 
 * completion handler
 */
workflow.onComplete {
	log.info ( workflow.success ? """
  Done!
  Multiqc Report            --> $params.outdir/multiqc_report.html
  Expression Quantification --> $params.outdir/quant/
  """ : "Oops .. something went wrong" )
}
