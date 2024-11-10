/*
This nextflow workflow will take in random text files. It will have a process that
replaces all occurrences of words starting with 'b' with 'banana'
*/ 

process BANANA {
    publishDir 'results'

    input:
    path(infile)

    output:
    path "*outfile.txt"

    script:
    // Learned something new today. Some sed commands are interpreted differently on mac and linux
    // This command will work on linux, but not mac:
    // sed 's/\bb\w*/banana/g'
    """
    sed 's/\\bb\\w*/banana/g' ${infile} > banana_outfile.txt
    """
}

workflow {
    in_ch = channel.fromPath(params.infile)
    BANANA(in_ch)
}