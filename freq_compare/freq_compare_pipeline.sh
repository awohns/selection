#!/bin/bash
#
#SBATCH --job-name=frequency_comparison
#SBATCH --output=freq_compare.txt
#
#SBATCH --ntasks=1
#SBATCH --time=10:00:00
#SBATCH --mem 50g

module load R

target=$1
ref=$2

srun Rscript compare_each_chr.R $target $ref



