#!/bin/bash
#
#reads_to_totals.sbatch
#
#SBATCH -p serial_requeue # Partition
#SBATCH -n 1              # one CPU
#SBATCH -N 1              # on one node
#SBATCH -t 0-2:00         # Running time of 2 hours
#SBATCH --mem 4000        # Memory request
 
module load R

R --vanilla --args $chr $V \< ~/selection/code/analysis/reads_to_totals.R
