import os
import sys

pfam_dir = argv[1]
pfam = argv[2]

# running r script
os.system("Rscript ../rCode/rRepeatsPipeline.R " + pfam_dir + " " + pfam)

# running py script
os.system("python pyRepeatsPipeline.py " + pfam_dir + " " + pfam)

# generating bash script
os.system('python generating_bash_scripts.py ' + pfam_dir + " " + pfam )

# running bash script
os.system('sbatch ' + pfam_dir + '/'+ pfam  +'_submit_cor.sh')