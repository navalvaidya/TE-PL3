#include <stdio.h>
#include <cuda.h>
#define SIZE 10
using namespace std;

__global__ void OddEvenSort(int *in,int *out,int size){
		
	bool OddEven = true;
	__shared__ bool swappedodd;
	__shared__ bool swappedeven;
	swappedodd=true;
	swappedeven=true;
	int temp;
	

	while(true){	
		if(OddEven){

			__syncthreads();
			swappedodd=false;
	
			int idx = blockIdx.x * blockDim.x + threadIdx.x;
			if(idx < size/2){
				if(in[idx*2] > in[idx*2+1]){
					//printf("\nThe odd swapping is: ");
					printf("\n\nThread id: %d \nodd Swapping %d <-> %d \nindexes [%d] <-> [%d]",idx,in[idx*2],in[idx*2+1],idx*2,(idx*2+1));				
					temp = in[idx*2];
					in[idx*2] = in[idx*2+1];
					in[idx*2+1] = temp;
					swappedodd=true;
				}
			}
			__syncthreads();			
		}
		else{
			__syncthreads();
			swappedeven=false;
	
			int idx = blockIdx.x * blockDim.x + threadIdx.x;
			
			if(idx < size/2-1){
				if(in[idx*2+1] > in[idx*2+2]){
					//printf("\nThe Even swapping is: ");
					printf("\n\nThread id: %d \nEven Swapping %d <-> %d \nindexes [%d] <-> [%d]",idx,in[idx*2+1],in[idx*2+2],(idx*2+1),(idx*2+2));				
					temp = in[idx*2+1];
					in[idx*2+1] = in[idx*2+2];
					in[idx*2+2] = temp;
					swappedeven=true;
				}
			}
			__syncthreads();	

		}

	if(!(swappedodd || swappedeven))
	break;		
	OddEven = !OddEven;	
	}
	__syncthreads();
	int idx = threadIdx.x;
	if(idx<size)
		out[idx] = in[idx];	
}

int main(){

	int *d_a,*d_asorted; 
	int size = sizeof(int) * SIZE;

	int *a = new int[size];
	int *asorted =new int[size];
	
	cudaMalloc(&d_a,size);
	cudaMalloc(&d_asorted,size);

	printf("\nEnter %d numbers to be sorted: \n",SIZE);
	for(int i=0;i<SIZE;i++){
		scanf("%d",&a[i]);	
	}

	printf("\nUnsorted array is: \n");
	for(int i=0;i<SIZE;i++){
		printf(" %d ",a[i]);	
	}

	cudaMemcpy(d_a,a,size,cudaMemcpyHostToDevice);
	OddEvenSort<<<1,SIZE>>>(d_a,d_asorted,SIZE);
	cudaMemcpy(asorted,d_asorted,size,cudaMemcpyDeviceToHost);

	printf("\nSorted array is: \n");	
	for(int i=0;i<SIZE;i++){
	printf(" %d ",asorted[i]);
	}
	
	printf("\n\n");

	free(a);
	free(asorted);

	cudaFree(d_a);
	cudaFree(d_asorted);
return 0;
}
