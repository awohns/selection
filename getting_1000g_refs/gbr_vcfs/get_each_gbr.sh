#!/bin/bash

cur_chr=$1

module load vcftools


vcftools --vcf ${cur_chr} --keep gbr_indv_list.txt --recode --recode-INFO-all --out gbr_chrs/$(basename $cur_chr)_gbr

