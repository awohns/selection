args = commandArgs(trailingOnly = TRUE)
print(args[1])

#Check that we have the right files
#stopifnot(grepl(".freq", args[1]))
#stopifnot(grepl(".mafs", args[2])) 

#Read in the provided txt file of file locations
files <- read.table(args[1], sep="\t")
#print(files[1,2])


calculate_freq <- function(x, output) {
#print(x)
#print("here we go")
#print(x[[1]])
#print(x[2])
no_col <- max(count.fields(x[2], sep = "\t"))
thousandgenomeref <- read.table(x[2], sep="\t", fill=TRUE, row.names = NULL, col.names=1:no_col)

#Find the name of the chromosome for naming the file
pos = regexpr('chr', x[2])
filename <- substr(x[2], pos, pos + 4)
print(filename)

target_freqs <- read.table(x[1], sep="\t", fill=TRUE, row.names = NULL)
print("done with long step")
head(target_freqs)
overlap <- merge(thousandgenomeref, target_freqs, by.x="X2", by.y = "V2")
print("merging done")
highcov_overlap <- overlap[as.numeric(as.character(overlap$V8)) >= 15,]
highcov_overlap$freqdiff <- as.numeric(as.character(substr(highcov_overlap$X6, 3, 10))) - as.numeric(as.character(highcov_overlap$V6))
print("freqdiff done")
write.table(highcov_overlap, file = paste0("freq_chrs/", filename), sep = "\t")
print("outputted table")

}

apply(files, 1, calculate_freq)
