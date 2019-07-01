rm(list=ls())
library('DCAforR')
setwd('/Users/adashaw/Dropbox (Harvard University)/Debbie-Ada/repeatsProject/')
pfam = 'PF00023'
source('~/Dropbox (Harvard University)/Debbie-Ada/repeatsProject/rCode/weight.idREP.R')
file = paste0(pfam,'/pyOutput/',pfam,'_2reps_plm_input.txt')
png(paste0(pfam,'/rOutput/',pfam,'_histogram.png'),height=600,width=600)
msa<-readAlignment(file)
msa <-msa2num(msa)
wid <-weight.idREP_ada(msa,paste0(pfam,'/rOutput/',pfam,'_histogram.png'))
dev.off()

