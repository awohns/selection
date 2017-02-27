#!/bin/bash

cur_chr=$1

module load angsd

angsd -out targetfreqs_chrs/${cur_chr}_target_freqs -doMajorMinor 5 -anc /ebc_data/awwohns/reference/hs.build37.1.fa -doMaf 3 -bam /ebc_data/awwohns/selection/bams.txt -GL 1 -r ${cur_chr}
