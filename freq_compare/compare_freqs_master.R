args = commandArgs(trailingOnly = TRUE)
print(args[1])

#Read in the provided txt file of file locations
files <- read.table(args[1], sep="\t")
#print(files[1,2])


calculate_freq <- function(x, output) {
pos = regexpr('chr', x[2])
filename <- substr(x[2], pos, pos + 4)
#filename <- regmatches(x[2], regexpr("joined.f",x[2]), invert= TRUE)[[1]][1]
#filename <- regmatches(filename, regexpr("joined/",filename))[[1]][1]
system(paste(paste0("sbatch --job-name=",filename),"freq_compare_pipeline.sh",x[1],x[2]))
system("sleep 1")
}

apply(files, 1, calculate_freq)
