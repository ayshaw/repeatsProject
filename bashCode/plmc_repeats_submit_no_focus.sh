#!/bin/bash
#SBATCH -p medium                           # Partition to run in
#SBATCH -t 2-00:00                          # Runtime in D-HH:MM format
#SBATCH -o mutation_log.%j.out              # File to which STDOUT will be written, including job ID
#SBATCH --mem 1G                            # Memory total (for all cores)
#SBATCH -c 8                                # Request 8 cores
#SBATCH -N 1                                # Request one node (if you request more than one core with -c)
#SBATCH --mail-user=ayshaw@g.harvard.edu    # Email to which notifications will be sent
#SBATCH --mail-type=ALL                     # Email all types of notifications
/home/as974/ada/plmc_repeats/bin/plmc -o /home/as974/ada/repeatsProject/PF0023_2reps.model -c /home/as974/ada/repeatsProject/PF0023_2reps_ECS.txt /home/as974/ada/repeatsProject/PF0023_2reps.txt