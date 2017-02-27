#!/bin/bash
list=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 x)

echo ${list[@]}
for cur_chr in ${list[@]}; do
        echo ${cur_chr}
        sbatch -J ${cur_chr} --output ${cur_chr} --workdir=/ebc_data/awwohns/selection/getting_target_freqs --time=10:00:00 --ntasks=1 --mem=1g --nodes=1 --wrap "./each_targetfreq_chr.sh ${cur_chr}"

sleep 1
done


