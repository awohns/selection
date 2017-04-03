#!/bin/bash
#
#SBATCH --job-name=get_freq
#SBATCH --output=get_freq.txt
#
#SBATCH --ntasks=1
#SBATCH --time=10:00:00
#SBATCH --mem 50g



python ~/spindrift/Freq.py \
-d ~/data/v8/use/v8/1kg_europe2names \
-p ~/selection/code/files/v8/used_all.txt \
-n ~/selection/code/files/v8/used_ancient_pseudodiploid.txt \
-o ~/selection/counts/v8/all \
-s ~/data/v8/use/v81kg_europe2names
