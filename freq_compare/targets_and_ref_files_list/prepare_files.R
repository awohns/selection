#list.files(path="/ebc_data/awwohns/selection/getting_target_freqs/targetfreqs_chrs", pattern = "\\.mafs.gz$")
#list.files(path="/ebc_data/awwohns/selection/getting_1000g_refs/allele_freqs/allelefreqs", pattern = "\\.frq$")
target_list <- list.files(path="/ebc_data/awwohns/selection/getting_target_freqs/targetfreqs_chrs", pattern = "\\.mafs.gz$", full.names=TRUE)
thousandg_list <- list.files(path="/ebc_data/awwohns/selection/getting_1000g_refs/allele_freqs/allelefreqs", full.names=TRUE) 
file_list <- list()

#print(thousandg_list[grep(paste0("chr",1,"\\."),thousandg_list)])
for (i in 1:22) {
	#file_list[[i]] <- target_list[grep(paste0("/",i,"_"),target_list)]
	file_list[[i]] <- cbind(target_list[grep(paste0("/",i,"_"),target_list)], thousandg_list[grep(paste0("chr",i,"\\."),thousandg_list)])
	#print(target_list[grep(paste0("^",i,"_"),target_list)])
	#print(thousandg_list[grep(paste0("chr",i,"\\."),thousandg_list)])
	#print("onelinedone")
}
print(file_list)
df  <- data.frame(matrix(unlist(file_list), nrow=22, byrow=T))
write.table(df, "targetsandrefs.txt",  sep="\t",row.names=FALSE,col.names=FALSE)
#write.table(file_list, "targetsandrefs.txt", sep="\t",row.names=FALSE, col.names=FALSE)
#print(1000g_files)
