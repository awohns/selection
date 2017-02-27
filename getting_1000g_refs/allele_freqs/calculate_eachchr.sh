#!/bin/bash

cur_chr=$1

module load vcftools

vcftools --vcf ${cur_chr} --freq --out allelefreqs/$(basename $cur_chr)_withfreqs
