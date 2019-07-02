# repeatsProject

This code was used for PF00023 - the ankyrin protein family, PvLEA4 - a Late Embryogenesis Abundant proteins (LEA proteins), and APOE - Apolipoprotein. 

To run an example, you make sure you have the PF00023 alignments from https://github.com/roespada/DCAforRpackage/blob/master/DCAforR/inst/PF00023_ncbi.txt (The repeats correction method all comes from this paper: https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-015-0648-3. My only role was implementing it into evCouplings pseudo-likelihood maximization.)

set-up:
1) Download and install DCAforR:
https://github.com/roespada/DCAforRpackage/
2) Download and install modified EvCouplings plmc code: https://github.com/ayshaw/plmc (originally from https://github.com/debbiemarkslab/plmc)
3) clone repeatsProject directory and place your alignment directory in this directory

Old directions:
1) modify and run splicing_repeats-general.ipynb - specify the pfam, pfam_dir, repeat starts, repeat length, and specify where the full alignment is.
2) run script rPipelineRepeats.R - change the working directory, pfam, pfam_dir
3) run notebook pyPipelineRepeats.ipynb - change the pfam, pfam_dir
4) run script generating_bash_scripts.py - change pfam, pfam_dir
5) submit the generated bash script above

New and streamlined directions:
1) modify and run splicing_repeats-general.ipynb - specify the pfam, pfam_dir, repeat starts, repeat length, and specify where the full alignment is.
2) cd into repeatsProject repo and run in command line: <br>
bash bashCode/runningPipeline.sh [directory of your repeats alignment] [prefix of output files]

note: I used the names pfam and pfam_dir because this was originally built to run the PF00023 alignment
