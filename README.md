# repeatsProject
This is currently implemented to run manually. If by some stroke of luck (and I didn't add some horrible coding error into the plmc code), it is a successful repeats correction, I will make it easier to run.

For now, it is implemented for PF00023 - the ankyrin protein family, PvLEA4 - a Late Embryogenesis Abundant proteins (LEA proteins), and APOE - Apolipoprotein. 

To run, you make sure you have the PF00023 alignments from https://github.com/roespada/DCAforRpackage/blob/master/DCAforR/inst/PF00023_ncbi.txt (it all comes from this paper https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-015-0648-3)

set-up:
1) Download and install DCAforR:
https://github.com/roespada/DCAforRpackage/blob/master/DCAforR/
2) Download and install modified plmc code: https://github.com/ayshaw/plmc
3) clone this github repository and put your alignment working directory in the directory

Old directions:
1) modify and run splicing_repeats-general.ipynb - specify the pfam, pfam_dir, repeat starts, repeat length, and specify where the full alignment is.
2) run script rPipelineRepeats.R - change the working directory, pfam, pfam_dir
3) run notebook pyPipelineRepeats.ipynb - change the pfam, pfam_dir
4) run script generating_bash_scripts.py - change pfam, pfam_dir
5) submit the generated bash script above

New and streamlined directions:
1) modify and run splicing_repeats-general.ipynb - specify the pfam, pfam_dir, repeat starts, repeat length, and specify where the full alignment is.
2) run in command line: RunningRepeats.py [directory of your repeats alignment] [prefix of output files]

note: I used the name of pfam and pfam_dir because it was originally built to run the ankyrin alignment
