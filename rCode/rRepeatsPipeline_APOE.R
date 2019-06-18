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
### load inputs
pfams = c('APOE_HUMAN_full_rerun_b025_r80-255','APOE_HUMAN_full_rerun_b025_r102-189','APOE_HUMAN_full_rerun_b025_r124-211')
for (pfam in pfams) {
  ### make raw file with gaps ###
  setwd(paste('/Users/adashaw/Dropbox (Harvard University)/Debbie-Ada/repeatsProject/',pfam,sep=''))
  dir.create('rOutput')
  # file = system.file("PF00023_ncbi.txt", package = "DCAforR")
  # msa<-readAlignment(file)
  # delete_file(paste('rOutput/',pfam,"_2reps_withgaps.txt",sep=''))
  # MSA.n.neighbours(msa=msa, n=1,outfile=paste('rOutput/',pfam,"_2reps_withgaps.txt",sep=''))
  
  ### edit file for input to plm.c code ###
  msa<-readAlignment(paste('rOutput/',pfam,".a2m",sep=''))
  msa<-msa.removed.gaps(msa)
  xs = apply(msa,1,function(x){sum(which(x=='X'))})
  msa = msa[-which(xs>0),]
  nom<-rownames(msa)
  outfile = paste('rOutput/',pfam,'_2reps_py_input.txt',sep='')
  delete_file(outfile)
  for (nom_iter in nom) {
    cat(paste(">",nom_iter,"\n",sep=''),file=outfile,append=T)
    cat(paste(c(msa[nom_iter,]),collapse = ''),file=outfile,append=T)
    cat("\n",file=outfile,append=T)
  }
  
  ### generate weights and names for python to read and change into just weights ###
  msa <-msa2num(msa)
  wid <- weight.idREP(msa)
  delete_file(paste('rOutput/',pfam,"_weights_py_input.txt",sep=''))
  write.table(wid, file=paste('rOutput/',pfam,"_weights_py_input.txt",sep=''), row.names=TRUE, col.names=FALSE)
  w <- Henikoff.w(msa,fmarg=aa.freq.marg(M=msa))
  w$w <-w$w*wid
  delete_file(paste('rOutput/',pfam,"_heniweights_py_input.txt",sep=''))
  write.table(w$w, file=paste('rOutput/',pfam,"_heniweights_py_input.txt",sep=''), row.names=TRUE, col.names=FALSE)
}