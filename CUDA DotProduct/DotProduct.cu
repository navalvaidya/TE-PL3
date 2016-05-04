#include<stdio.h>
#include<cuda.h>
#include<stdlib.h>
#define SIZE 10
using namespace std;

__global__ void DotProduct(int *d_a,int *d_b,int *d_c)
{
	__shared__ int temp[SIZE];
	int tid = blockIdx.x * blockDim.x + threadIdx.x;
	temp[threadIdx.x] = d_a[tid] * d_b[tid];
	printf("%d:",temp[tid]);
	printf("\nThread id is: %d",threadIdx.x);
	__syncthreads();

	if(tid==0){
		int sum=0;
		for(int i=0;i<SIZE;i++){
			sum += temp[i];
		}	
	*d_c = sum;
	printf("\nBlock id is: %d",blockIdx.x);
	printf("\nSum is:%d",*d_c);
	}

}


int main(){

	int *d_a,*d_b,*d_c;
	int n = sizeof(int) * SIZE;

	int *a = new int[n];
	int *b = new int[n];
	int *c = new int[n];

	for(int i=0;i<SIZE;i++){
		a[i]=i*2;
		b[i]=(i+1)*2;
	}

	cudaMalloc(&d_a,n);
	cudaMalloc(&d_b,n);
	cudaMalloc(&d_c,sizeof(int));

	cudaMemcpy(d_a,a,n,cudaMemcpyHostToDevice);
	cudaMemcpy(d_b,b,n,cudaMemcpyHostToDevice);
		
	DotProduct<<<1,SIZE>>>(d_a,d_b,d_c);

	cudaMemcpy(c,d_c,sizeof(int),cudaMemcpyDeviceToHost);
	printf("\nDot product is: %d\n",*c);

	free(a);
	free(b);
	free(c);


	cudaFree(d_a);
	cudaFree(d_b);
	cudaFree(d_c);
return 0;
}
