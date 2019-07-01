# repeatsProject
This is currently implemented to run manually. If by some stroke of luck (and I didn't add some horrible coding error into the plmc code), it is a successful repeats correction, I will make it easier to run.

For now, it is implemented for PF00023 - the ankyrin protein family, PvLEA4 - a Late Embryogenesis Abundant proteins (LEA proteins), and APOE - Apolipoprotein. 

To run, you make sure you have the PF00023 alignments from https://github.com/roespada/DCAforRpackage/blob/master/DCAforR/inst/PF00023_ncbi.txt (it all comes from this paper https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-015-0648-3)

Directions:
1) Download and install DCAforR:
https://github.com/roespada/DCAforRpackage/blob/master/DCAforR/
2) Download and install modified plmc code: https://github.com/ayshaw/plmc
2) run rPipelineRepeats.R - change the working directory, pfam, pfam_dir
3) run pyPipelineRepeats.ipynb - change the pfam, pfam_dir
3) run generating_bash_scripts.py - change pfam, pfam_dir
4) submit the generated bash script above


