#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#define line_size 100
#define num_sequences 91058 /*91143*/
int main () {
	double *weights = (double *) malloc(91058 * sizeof(double));
	FILE * file; 
	file = fopen("/Users/adashaw/Dropbox (Harvard University)/Debbie-Ada/repeatsProject/PF00023/pyOutput/PF00023_ones_plm_input.txt","r");
	char *line = (char *) malloc(line_size * sizeof(char));
	int i = 0;
	
	if (!file) {
		printf("\nno file exists\n");
	} else {
		printf("\nfile exists\n");
	}
	
	while(fgets(line, line_size, file)) {
	   if(sscanf(line, "%lf",&weights[i]) != EOF) {
	      ++i;
	   }
	   printf("weights: %lf \n",weights[i]);
	   printf("line: %s \n", line);
	}
	free(weights);
	free(line);
	return 0;
}
