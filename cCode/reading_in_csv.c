#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#define line_size 100
#define num_sequences 40 /*91143*/
int main () {
	char names[num_sequences][30];
	float weights[num_sequences];
	FILE * file; 
	file = fopen("pyCode/trial.txt","r");
	char line[line_size];
	int i = 0;
	char tmp2[30];
	float tmp;
	if (!file) {
		printf("\nno file exists\n");
	} else {
		printf("\nfile exists\n");
	}
	
	while(fgets(line, line_size, file)) {
	   if(sscanf(line, "%[^,],\s%f\n", names[i], &tmp) == 2) {
	      ++i;
	      weights[i]=tmp;
	      // names[i]=tmp2;
	   }
	   printf("line: %s\n", line);
	   printf("names: %s \n",names[i]);
	   printf("weights: %0.21f \n\n",weights[i]);
	}
	return 0;
}
