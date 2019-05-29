library(DCAforR)
setwd('/Users/adashaw/Dropbox (Harvard University)/Debbie-Ada/repeatsProject/rCode/')

### make raw file with gaps ###
file<-system.file("PF00023_ncbi.txt", package = "DCAforR")
msa<-readAlignment(file)
MSA.n.neighbours(msa=msa, n=1,outfile="PF0023_2reps_withgaps.txt")

### edit file for input to plm.c code ###
msa<-readAlignment("PF0023_2reps_withgaps.txt")
msa<-msa.removed.gaps(msa)
nom<-rownames(msa)
outfile = 'PF0023_2reps_correctednogaps.txt'
for (nom_iter in nom) {
  cat(paste(">",nom_iter,"\n",sep=''),file=outfile,append=T)
  cat(paste(c(msa[nom_iter,]),collapse = ''),file=outfile,append=T)
  cat("\n",file=outfile,append=T)
}

### generate weights and names for python to read and change into just weights ###
msa <-msa2num(msa)
wid <- weight.idREP(msa)
write.table(wid, file="weights_rownamestrue.txt", row.names=TRUE, col.names=FALSE)
