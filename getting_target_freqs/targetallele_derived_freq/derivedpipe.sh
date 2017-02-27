#!/bin/bash
#
#SBATCH --job-name=imputingchr15
#SBATCH --output=res.txt
#
#SBATCH --ntasks=1
#SBATCH --time=5:00:00
#SBATCH --mem 20g


module load angsd

pwd; hostname; date

echo "here"
srun angsd -out chr15_target_frequencies_small -doMajorMinor 5 -anc ../../reference/hs.build37.1.fa -doMaf 3 -bam /ebc_data/cls83/Johns/angsd/bams.txt -GL 1 -r 15:20104250-22000000
