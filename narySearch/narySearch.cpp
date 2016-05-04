#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <omp.h>
#define NN 30
using namespace std;

void narySearch(int *A,int low,int high,int key,int Ntrvl,int *pos){

	float step,offset;
	int *mid = new int[Ntrvl+1];
	char *locate = new char[Ntrvl+2];
	int i;

	locate[0] = 'R';
	locate[Ntrvl+1] = 'L';

	#pragma omp parallel
	{
		while(low <= high && *pos==-1){
			int lmid;
			#pragma omp single
			{
				mid[0]=low-1;
				step = (float)(high-low+1)/(Ntrvl+1);
			}

			#pragma omp for private(offset) firstprivate(step)
			for(i=1;i<=Ntrvl;i++){
				offset = step*i + (i-1);
				lmid = mid[i] = low + (int)offset;
				if(lmid<=high){
					if(A[lmid]<key)
						locate[i] = 'R';
					else if(A[lmid]>key)
						locate[i] = 'L';
					else{
						locate[i] = 'E';
						*pos=lmid;
					}
				}
				else{
					mid[i] = high+1;
					locate[i] = 'L';
				}
	
			}
	
			#pragma omp single
			{
				for(i=1;i<=Ntrvl;i++){
					if(locate[i] != locate[i-1]){
						low = mid[i-1]+1;
						high = mid[i]-1;
					}
				}
	
				if(locate[Ntrvl] != locate[Ntrvl+1]){
					low = mid[Ntrvl]+1;
				}
			}
		}	
	}	

delete[] locate;
delete[] mid;
	
}



int main(int argc, char* argv[])
{
	int pos = -1;
	int S[NN];
	int intervals = 4;
	int key=52;
	for (int i = 0; i < NN; i++){
		S[i] = 2*i;
	}
	printf("\nArray is given by:\n");
	for (int j = 0; j < NN; j++){
		printf("%3d ",S[j]);
	}
	printf("\n");
		pos = -1;
		narySearch(S, 0, NN-1, key, intervals, &pos);

		if (pos != -1) 
			printf("key = %d found at index %d\n", key, pos );
		else 
			printf("key = %d NOT found.\n",key);
	printf("\n");
	return 0;
}

