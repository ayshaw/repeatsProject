#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#define line_size 100
#define num_sequences 40 /*91143*/
int main () {
	float weights[num_sequences];
	FILE * file; 
	file = fopen("pyCode/numbers.txt","r");
	char line[line_size];
	int i = 0;
	
	float tmp;
	if (!file) {
		printf("\nno file exists\n");
	} else {
		printf("\nfile exists\n");
	}
	
	while(fgets(line, line_size, file)) {
	   if(sscanf(line, "%f", &tmp) == 2) {
	      ++i;
	      weights[i]=tmp;
	   }
	   printf("weights: %0.20f \n",tmp);
	   printf("line: %s \n", line);
	}
	return 0;
}