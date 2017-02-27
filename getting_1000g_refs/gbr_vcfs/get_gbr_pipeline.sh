#!/bin/bash

for FILE in /ebc_data/awwohns/1000genomesrefpanel/chrs/*.vcf; do
	echo ${FILE}
	sbatch -J ${FILE} --workdir=/ebc_data/awwohns/selection/getting_1000g_refs/gbr_vcfs --time=1:00:00 --ntasks=1 --mem=1g --nodes=1 --output=${FILE}_GBRonly.vcf --wrap "./get_each_gbr.sh ${FILE}"
echo "bash get_each_gbr.sh ${FILE}"
sleep 1
done 



