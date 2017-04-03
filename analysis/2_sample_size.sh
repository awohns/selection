module load R


#2. Compute sample size
for chr in {1..22};  do sbatch -o ${chr}. -e ${FILE}.stderr.txt tophat_manyfiles.sbatch ${FILE}
 sleep 1; done
R --vanilla --args All $V \< ~/selection/code/analysis/reads_to_totals_by_individual.R
ED=~/selection/analysis/${V}/effsize
head -n1 ${ED}/effsize_reads.chr3.txt > ${ED}/effsize_reads.txt
tail -qn+2 ${ED}/effsize_reads.chr*.txt >> ${ED}/effsize_reads.txt
gzip -f ${ED}/effsize_reads.txt
#rm ${ED}/effsize_reads.chr*.txt
R --vanilla --args ${V} < ~/selection/code/analysis/effective_sample_size.R
