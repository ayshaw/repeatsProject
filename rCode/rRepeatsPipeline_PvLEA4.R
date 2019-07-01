##############################################################################
###################### The R example of RepeatsPipeline ######################
##############################################################################
### inputs
### - PF00023_ncbi.txt 
### outputs
### - PF0023_2reps_withgaps.txt 
### - PF0023_2reps_correctednogaps.txt - input to pyRepeatsPipeline
### - weights_rownamestrue.txt - input to pyRepeatsPipeline
### - 

### load necessary package(s) and set working directory for ada-macbook
rm(list=ls()) 
library(DCAforR)
source('/Users/adashaw/Dropbox (Harvard University)/Debbie-Ada/repeatsProject/rCode/delete_file.R')
# source('/Users/adashaw/Dropbox (Harvard University)/Debbie-Ada/repeatsProject/rCode/MSA.n.neighbors.R')

### load inputs
pfam_dir = 'PvLEA4_full_b0.35'
pfam = 'PvLEA4'

### make raw file with gaps ###
setwd(paste('/Users/adashaw/Dropbox (Harvard University)/Debbie-Ada/repeatsProject/',pfam_dir,sep=''))
dir.create('rOutput')
file = paste(pfam,'.a2m',sep='')
msa<-readAlignment(file)
delete_file(paste('rOutput/',pfam,"_2reps_withgaps.txt",sep=''))
msa<-msa.removed.gaps(msa)
MSA.n.neighbours(msa=msa, n=1,outfile=paste('rOutput/',pfam,"_2reps_withgaps.txt",sep=''))

### edit file for input to plm.c code ###
msa<-readAlignment(paste('rOutput/',pfam,"_2reps_withgaps.txt",sep=''))

### removing duplicate rows
duplicates.df = as.data.frame(msa)
duplicates.df = duplicates.df[!duplicated(duplicates.df),]
msa2 = as.matrix(duplicates.df,rownames.force = TRUE)
colnames(msa2)=NULL

### removing X and . from MSA
xs = apply(msa2,1,function(x){sum(which(x=='X' | x=='.'))})

### generate weights and names for python to read and change into just weights ###
msa_num <-msa2num(msa2)
wid <- weight.idREP(msa_num)
wid = wid[-which(xs>0)]
delete_file(paste('rOutput/',pfam,"_weights_py_input.txt",sep=''))
write.table(wid, file=paste('rOutput/',pfam,"_weights_py_input.txt",sep=''), row.names=TRUE, col.names=FALSE)
w <- Henikoff.w(msa_num,fmarg=aa.freq.marg(M=msa_num))
w$w=w$w[-which(xs>0)]
w$w <-w$w*wid
delete_file(paste('rOutput/',pfam,"_heniweights_py_input.txt",sep=''))
write.table(w$w, file=paste('rOutput/',pfam,"_heniweights_py_input.txt",sep=''), row.names=TRUE, col.names=FALSE)

msa2 = msa2[-which(xs>0),]
nom<-rownames(msa2)
outfile = paste('rOutput/',pfam,'_2reps_py_input.txt',sep='')
delete_file(outfile)
for (nom_iter in nom) {
  cat(paste(">",nom_iter,"\n",sep=''),file=outfile,append=T)
  cat(paste(c(msa2[nom_iter,]),collapse = ''),file=outfile,append=T)
  cat("\n",file=outfile,append=T)
}