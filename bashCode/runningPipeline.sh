#!/bin/sh
PFAM_DIR="$1"
PFAM="$2"

module load R/3.5.1
echo "'$PFAM_DIR'"
echo "$PFAM_DIR"
echo $PFAM_DIR
echo  ${PFAM_DIR}/${PFAM}_cor_submit.sh 
Rscript ../rCode/rRepeatsPipeline.R $PFAM_DIR $PFAM
python ../pyCode/pyRepeatsPipeline.py $PFAM_DIR $PFAM
Rscript ../rCode/plotting_histograms.R "'$PFAM_DIR'" "'$PFAM'"
python ../pyCode/python generating_bash_scripts.py "$PFAM_DIR" "$PFAM"
sbatch ${PFAM_DIR}/${PFAM}_cor_submit.sh 

