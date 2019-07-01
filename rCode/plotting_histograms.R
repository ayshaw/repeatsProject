rm(list=ls())
library('DCAforR')
### load inputs
options(echo=TRUE) # To see commands in output file
args <- commandArgs(trailingOnly = TRUE)
print(args)
working_dir = args[1]
setwd(working_dir)
pfam = args[2]
source('../rCode/weight.idREP.R')
file = paste0('/pyOutput/',pfam,'_2reps_plm_input.txt')
png(paste0('/rOutput/',pfam,'_histogram.png'),height=600,width=600)
msa<-readAlignment(file)
msa <-msa2num(msa)
wid <-weight.idREP_ada(msa,paste0('/rOutput/',pfam,'_histogram.png'))
dev.off()

