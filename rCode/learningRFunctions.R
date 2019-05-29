library(DCAforR)

msa<-readAlignment("PF0023_2reps.txt")
msa<-msa.removed.gaps(msa)
msa <-msa2num(msa)
npos1<-ncol(msa)/2
msa.mezcla<-cbind(msa[,1:npos1],msa[sample(1:nrow(msa)),(npos1+1):(2*npos1)])

dist.primeros<-c()
for(i in 1:nrow(msa)){
  dist.primeros<-c(dist.primeros,length(which(msa[i,1:npos1]==msa[i,(npos1+1):(2*npos1)]))/npos1)
}
names(dist.primeros)<-rownames(msa)
if(any(is.na(dist.primeros))){dist.primeros[which(is.na(dist.primeros))]<-0}

## PID vecinos random
dist.random<-c()
for(i in 1:nrow(msa.mezcla)){
  dist.random<-c(dist.random,length(which(msa.mezcla[i,1:npos1]==msa.mezcla[i,(npos1+1):(2*npos1)]))/npos1)
}
names(dist.random)<-rownames(msa.mezcla)
if(any(is.na(dist.random))){dist.random[which(is.na(dist.random))]<-0}


bks<-seq(0,1,length.out=npos1)
hrr<-hist(dist.random,breaks=bks,plot=F)
h1<-hist(dist.primeros,breaks=bks,plot=F)  

hist_df=data.frame(dist.primeros,dist.random)
library(ggplot2)
ggplot(hist_df) +
  stat_bin(aes(dist.random,y=..density..),geom='bar',binwidth=0.01,col='blue',alpha=0.3) +
  stat_bin(aes(dist.primeros,y=..density..),geom='bar',binwidth=0.01,col='red',alpha=0.3)+
  xlab('%ID')+
  title("PF0023_2reps.txt")+
  theme(legend.justification=c(0.5,0), legend.position=c(0.5,0))+
  scale_colour_manual(name = 'Legend', 
                      guide = 'legend',
                      values = c('dist.primeros' = 'red',
                                 'dist.random' = 'blue'), 
                      labels = c('first neighboring repeats',
                                 'random repeats'))
# Armo pesos interpolando los histogramas
w.seq.pid<-rep(NA,nrow(msa))
cts<-h1$breaks
pspR<-hrr$counts
pspF<-h1$counts
pspR<-pspR/sum(pspR)
pspF<-pspF/sum(pspF)
for( i in 1:(length(cts)-1) ){
  w.seq.pid[which(dist.primeros>=cts[i] & dist.primeros<(cts[i+1]+h1$mids[1]))]<- (pspR[i]/pspF[i])
}
names(w.seq.pid)<-rownames(msa)