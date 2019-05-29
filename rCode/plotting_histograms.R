library('DCAforR')
setwd('/Users/adashaw/Dropbox (Harvard University)/marksLab/repeatsProject/alignments')
source('~/Dropbox (Harvard University)/marksLab/repeatsProject/rCode/weight.idREP.R')
alignments = c('APOE_HUMAN_full_rerun_b01_r124-145.a2m',  'APOE_HUMAN_full_rerun_b025_r124-211.a2m', 'APOE_HUMAN_full_rerun_b02_r168-189.a2m','APOE_HUMAN_full_rerun_b01_r124-167.a2m',  'APOE_HUMAN_full_rerun_b025_r80-255.a2m',  'APOE_HUMAN_full_rerun_b02_r168-211.a2m','APOE_HUMAN_full_rerun_b01_r168-189.a2m',  'APOE_HUMAN_full_rerun_b02_r102-189.a2m',  'APOE_HUMAN_full_rerun_b02_r80-255.a2m','APOE_HUMAN_full_rerun_b01_r168-211.a2m',  'APOE_HUMAN_full_rerun_b02_r124-145.a2m',  'apoe_pfam_standard_81-288_r102-189.a2m', 'APOE_HUMAN_full_rerun_b01_r80-255.a2m', 'APOE_HUMAN_full_rerun_b02_r124-167.a2m', 'apoe_pfam_standard_81-288_r124-211.a2m','APOE_HUMAN_full_rerun_b025_r102-189.a2m', 'APOE_HUMAN_full_rerun_b02_r124-211.a2m')
for (file in alignments){
print(file)
png(paste('histograms/',strsplit(file,'.a2m')[[1]][1],'.png',sep=''),height=600,width=600)
msa<-readAlignment(file)
msa <-msa2num(msa)
wid <-weight.idREP_ada(msa,file)
dev.off()
}
