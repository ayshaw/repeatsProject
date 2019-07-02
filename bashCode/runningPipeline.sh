#!/usr/bin/sh
PFAM_DIR="$1"
PFAM="$2"
source ~/.bashrc
source activate evcouplings_develop
#echo "'$PFAM_DIR'"
#echo "$PFAM_DIR"
#echo $PFAM_DIR
#echo  ${PFAM_DIR}/${PFAM}_cor_submit.sh 
#Rscript ../rCode/rRepeatsPipeline.R $PFAM_DIR $PFAM
#python ../pyCode/pyRepeatsPipeline.py $PFAM_DIR $PFAM
Rscript ../rCode/plotting_histograms.R $PFAM_DIR $PFAM
#python ../pyCode/generating_bash_script.py $PFAM_DIR $PFAM
#sbatch ${PFAM_DIR}/${PFAM}_cor_submit.sh 

