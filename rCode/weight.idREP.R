weight.idREP_ada<-function(msa.real,file){
  npos1<-ncol(msa.real)/2
  msa.mezcla<-cbind(msa.real[,1:npos1],msa.real[sample(1:nrow(msa.real)),(npos1+1):(2*npos1)])
  
  dist.primeros<-c()
  for(i in 1:nrow(msa.real)){
    dist.primeros<-c(dist.primeros,length(which(msa.real[i,1:npos1]==msa.real[i,(npos1+1):(2*npos1)]))/npos1)
  }
  
  names(dist.primeros)<-rownames(msa.real)
  if(any(is.na(dist.primeros))){dist.primeros[which(is.na(dist.primeros))] <- 0}
  
  ## PID vecinos random
  dist.random<-c()
  for(i in 1:nrow(msa.mezcla)){
    dist.random<-c(dist.random,length(which(msa.mezcla[i,1:npos1]==msa.mezcla[i,(npos1+1):(2*npos1)]))/npos1)
  }
  
  names(dist.random)<-rownames(msa.mezcla)
  if(any(is.na(dist.random))){dist.random[which(is.na(dist.random))] <- 0}
  
  bks<-seq(0,1,length.out=npos1)
  
  hrr_plot=density(dist.random, bw=0.1)
  h1_plot=density(dist.primeros, bw=0.1)
  par(mfrow=c(1,2),oma=c(3.5,3.5,2,0),mar=c(3.5,3.5,1.5,1.5))
  hrr<-hist(dist.random,breaks=bks,plot=T,col=rgb(0,0,1,0.2),xlim=c(0,1),freq=F,main='',xlab='%ID',ylab = 'density')
  par(new=T)
  h1<-hist(dist.primeros,breaks=bks,plot=T,col=rgb(0,1,0,0.2),add=T,freq=F,xlab='',ylab='',main='',axes=F)
  legend("top", legend=c("first neighboring repeats", "Random pairing of repeats"), fill=c(rgb(0,1,0), rgb(0,0,1)), bty="n") 
  
  plot(hrr_plot,xlab='%ID',ylab = 'density',col='blue',pch=4,xlim=c(0,1),ylim=c(0,4),main='',bty="n")
  par(new=T)
  plot(h1_plot,xlab='',ylab = '',col='green',pch=1,xlim=c(0,1),ylim=c(0,4),main='',bty="n",axes=F)
  title(file,outer=TRUE,cex.main=2)
  
  # Armo pesos interpolando los histogramas
  w.seq.pid<-rep(NA,nrow(msa.real))
  cts<-h1$breaks
  pspR<-hrr$counts
  pspF<-h1$counts
  pspR<-pspR/sum(pspR)
  pspF<-pspF/sum(pspF)
  for( i in 1:(length(cts)-1) ){
    w.seq.pid[which(dist.primeros>=cts[i] & dist.primeros<(cts[i+1]+h1$mids[1]))]<- (pspR[i]/pspF[i])
  }
  names(w.seq.pid)<-rownames(msa.real)
  
  return(w.seq.pid)
  
}
