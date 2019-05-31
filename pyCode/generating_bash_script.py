import os
directory = os.getcwd().split('pyCode')[0]
pfam = 'PF00023'
start_lines = ['''#!/bin/bash
#SBATCH -p medium                           # Partition to run in
#SBATCH -t 0-16:00                          # Runtime in D-HH:MM format
#SBATCH -o log_weights.%j.out              # File to which STDOUT will be written, including job ID
#SBATCH --mem 1G                            # Memory total (for all cores)
#SBATCH -c 2                                # Request 8 cores
#SBATCH -N 1                                # Request one node (if you request more than one core with -c)
#SBATCH --mail-user=ayshaw@g.harvard.edu    # Email to which notifications will be sent
#SBATCH --mail-type=ALL                     # Email all types of notifications
'''
,'cCode/plmc/bin/plmc -o ']
lines = start_lines[0] + '\n' +\
        directory + start_lines[1] + directory + pfam + '/cOutput/' + pfam + '.model -c ' +\
        directory + pfam + '/cOutput/' + pfam + '_ECscores.txt -rw ' +\
        directory + pfam + '/pyOutput/' + pfam + '_weights_plm_input.txt ' +\
        directory + pfam + '/pyOutput/' + pfam + '_2reps_plm_input.txt'
with open(directory + pfam + '/'+ pfam  +'_submit.sh','w') as file:
    file.writelines(lines)

