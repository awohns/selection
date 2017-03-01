args = commandArgs(trailingOnly = TRUE)
print(args[1])

#Check that we have the right files
stopifnot(grepl("mafs", args[1]))
stopifnot(grepl(".frq", args[2])) 

#Read in the provided txt file of file locations
target <- read.table(args[1], sep="\t")

no_col <- max(count.fields(args[2], sep = " "))
thousandgenomeref <- read.table(args[2], sep=" ", fill=TRUE, row.names = NULL, col.names=1:no_col)

#Find the name of the chromosome for naming the file
pos = regexpr('chr', args[2])
#filename <- regmatches(args[2], regexpr("joined.f",string), invert= TRUE)[[1]][1]
filename <- substr(args[2], pos, pos + 4)
print(filename)

target_freqs <- read.table(args[1], sep="\t", fill=TRUE, row.names = NULL)
print("done with long step")
head(thousandgenomeref)
overlap <- merge(thousandgenomeref, target_freqs, by.x="X2", by.y = "V2")
print("merging done")
highcov_overlap <- overlap[as.numeric(as.character(overlap$V8)) >= 15,]
highcov_overlap$freqdiff <- as.numeric(as.character(substr(highcov_overlap$X7, 3, 10))) - as.numeric(as.character(highcov_overlap$V6))
print("freqdiff done")
highcov_overlap <- highcov_overlap[order(-highcov_overlap$freqdiff),]
highcov_overlap <- highcov_overlap[c(2,1,3,6,7,8,10,11,12,13,14,15,16)]
write.table(highcov_overlap, file = paste0("freq_chrs/", filename), sep = "\t")
print("outputted table")
rsidtopandbottom <- toString(head(highcov_overlap,10)[,3])
write(rsidtopandbottom,paste0("top_rsids/", filename))
