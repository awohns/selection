#!/bin/bash

for FILE in /ebc_data/awwohns/selection/getting_1000g_refs/gbr_vcfs/gbr_chrs/*.vcf; do
        echo ${FILE}
        sbatch -J ${FILE} --workdir=/ebc_data/awwohns/selection/getting_1000g_refs/allele_freqs --time=1:00:00 --ntasks=1 --mem=1g --nodes=1 --output=${FILE}_freq.txt --wrap "./calculate_eachchr.sh ${FILE}"

sleep 1
done


