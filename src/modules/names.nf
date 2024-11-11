#!/usr/bin/env nextflow

process MAKETXT {
    input:
    val name

    output:
    tuple(val(name), file('*.txt'), emit: files_ch)

    script:
    """
    echo "${name} likes bioinformatics!" > ${name}.txt
    """
}

process CATTXT {
    input:
    tuple(val(name), file(name_file))

    output:
    stdout

    script:
    """
    cat "${name_file}"
    """
}

workflow {
    // We make a 'channel' that contains all of our initial input data
    // This is called a queue channel and its items are first in, first out (FIFO)
    name_ch = Channel.from("Olivia", "Roger", "Tanner")
    // We can view the contents of a channel using the view() method
    name_ch.view()
    // We will now execute the MAKETXT process for each item in the name_ch channel
    MAKETXT(name_ch)
    // Lets look at the structure of the output from the MAKETXT process. It is a tuple
    // containing the name of the person (which is a 'val') and a file object (which is a 'path')
    MAKETXT.out.files_ch.view()
    // We will now execute the CATTXT process for each item in the MAKETXT output channel
    // The cat command is used to concatenate the contents of the file, but by default, it
    // prints in the work directory, not our terminal. So we need to use the view{$it} method
    // to redirect the output to our terminal. This is a bit confusing and i needed to look it up to refresh. 
    CATTXT(MAKETXT.out.files_ch) | view { "$it" }

    /*
    Nextflow is used to chain processes together and its syntax is confusing at first, especially
    when trying to compare it to a traditional programming language like Python or Java or R. It is a
    tool that lots of bioinformaticians and computational biologists use to automate workflows rather than
    needing to execute a series of scripts manually which can be error prone. When we start to introduce
    sequencing data and the various steps to take it from raw to processed/qc'ed data, it will make more sense.
    */
}