MSA.n.neighbours<-function(msa,n=2,outfile=paste("MSA_neighb_",n,".fasta",sep=""),maxdist=ncol(msa)*(n*1.5-1),mindist=ncol(msa)*(n-1)){
  
  #ids de los repeats en matriz nombrePROT/inicioREP/finalREP
  nom<-rownames(msa)
  nom<-matrix(unlist(sapply(sapply(nom,strsplit,"/"),strsplit,"-")),ncol=3,byrow=T)
  print(nom)
  ##### Busco los repeats que esten separados por n repeats  #######
  #calculo la frecuencia de ocurrencia por nombre de proteina (ver cuantos repeats tiene)
  f<-table(nom[,1])
  #busco los nombres de las proteinas que tienen al menos n+1 repeats asociados
  n1<-names(which(f>n))
  print(n1)
  #en pares guardo los nombres de repeats a distancia n
  print(paste('maxdist:',maxdist,'\n'))
  print(paste('mindist:',mindist))
  
  for(i in seq_along(n1)){
    enp<-which(nom[,1]==n1[i])  #indices de donde aparece la proteina n1[i]
    nom.sub<-nom[enp,]
    nom.sub<-nom.sub[order(as.numeric(nom.sub[,2])),]
    for(j in 1:(nrow(nom.sub)-n)){
      #si la distancia en secuencia es mayor a maxdist o los repeats se superponen, entonces lo salteo
      seqdist<-as.numeric(nom.sub[j+n,2])-as.numeric(nom.sub[j,3])
      # print(paste('nom.sub[j+n,2]:',nom.sub[j+n,2],'\n'))
      # print(paste('nom.sub[j,3]:',nom.sub[j,3]))
      if(seqdist>maxdist | seqdist< mindist ){next}
      # else {print('shit!! did not move on!')}
      #sino uno los dos repeats y lo agrego al alineamiento en el outfile
      r1<-paste(nom.sub[j,1],"/",nom.sub[j,2],"-",nom.sub[j,3],sep="")
      r2<-paste(nom.sub[j+n,1],"/",nom.sub[j+n,2],"-",nom.sub[j+n,3],sep="")
      
      cat(paste(">",r1,"-",r2,"\n",sep=""),file=outfile,append=T)
      cat(paste(c(msa[r1,],msa[r2,]),collapse = ""),file=outfile,append=T)
      cat("\n",file=outfile,append=T)
    }    
  }
  return(0)
}