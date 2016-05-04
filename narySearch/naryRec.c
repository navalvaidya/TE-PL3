/#include <stdio.h>
#include <omp.h>
#include <stdlib.h>

int size,threads,num;
int a[5000],flag=0;

void nary(int size,int start){
	int globalStart,globalSize;
	
	if(size<=threads){
		flag=0;
		#pragma omp parallel num_threads(threads)
		{
			int tid = omp_get_thread_num();
			if(a[start+tid]==num){
				flag++;
				if(flag==1){
					printf("Number %d found at index %d\n",a[start+tid],start+tid);
				}
			}
			if(flag==0){
				printf("Number not found\n");
			}
		}
	}
	else{
		flag=0;
		#pragma omp parallel num_threads(threads)
		{	
			int tid = omp_get_thread_num();
			int numperthread = size/threads;
			int first = tid*numperthread + start;
			int last = first + numperthread -1; 

			if(tid==(threads-1)){
				last = start + size-1;
			}

			if(num>=a[first]  && num<=a[last]){
				flag=1;
				printf("No. can be present between %d and %d\n",a[first],a[last]);
				globalStart = first;
				globalSize = last - first +1;
			}
		}
		if(flag==1){
			nary(globalSize,globalStart);
		}
		else{
			printf("number not found\n");
		}
	}
	
}

int main(){
	int i,start=0;
	printf("Enter no. of elements : ");
	scanf("%d",&size);

	for(i=0;i<size;i++){
		a[i]=2*i;	
	}	

	for(i=0;i<size;i++){
		printf("%d ",a[i]);
	}

	printf("\nEnter no. of threads :");
	scanf("%d",&threads);

	
	printf("Enter the element to be searched :");
	scanf("%d",&num);

	nary(size,start);
return 0;
}

