#include <stdio.h>
#include <stdlib.h>
#include <cuda.h>
#include <iostream>
#define SIZE 10
using namespace std;

__global__ void DotProduct(int *d_a,int *d_b,int *d_c){

	*d_c=0;
	int sum=0;
	int idx = blockIdx.x * blockDim.x + threadIdx.x;
	sum += d_a[idx]*d_b[idx];	
	printf("Thread ID : %d\n",idx);
	printf(":%d ",sum);
	atomicAdd(d_c,sum);

}

int main(){
	int *d_a,*d_b,*d_c;
	int n = SIZE*sizeof(int);

	int *a = new int[n];
	int *b = new int[n];
	int *c = new int[n];

	cudaMalloc(&d_a,n);
	cudaMalloc(&d_b,n);
	cudaMalloc(&d_c,sizeof(int));

	for(int i=0;i<SIZE;i++){
		a[i]=i*2;	
		b[i]=(i+1)*2;
	}

	cudaMemcpy(d_a,a,n,cudaMemcpyHostToDevice);
	cudaMemcpy(d_b,b,n,cudaMemcpyHostToDevice);

	DotProduct <<<1,SIZE>>>(d_a,d_b,d_c);

	cudaMemcpy(c,d_c,sizeof(int),cudaMemcpyDeviceToHost);

	cout<<"\nDot Product is : "<<*c<<"\n";
	
	cudaFree(d_a);
	cudaFree(d_b);
	cudaFree(d_c);
	free(a);
	free(b);
	free(c);
return 0;
}
