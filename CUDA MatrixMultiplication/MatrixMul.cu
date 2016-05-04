#include <stdio.h>
#include <cuda.h>
#include <stdlib.h>
#define BLOCK_SIZE 2
#define GRID_SIZE 2
#define N GRID_SIZE*BLOCK_SIZE
using namespace std;

__global__ void MatrixMul(float *d_a,float *d_b,float *d_c,int n){

	int row = blockIdx.y * blockDim.y + threadIdx.y;
	int column = blockIdx.x * blockDim.x + threadIdx.x;
	float sum=0;

	for(int i=0;i<n;i++){
		sum += (d_a[row * n + i] * d_b[i * n + column]);
	}

	d_c[row*n+column] = sum;
	printf("\nBlock Id [%d][%d], Thread Id [%d][%d], Product : %.2f ",blockIdx.x,blockIdx.y,threadIdx.x,threadIdx.y,sum);	
	
}



int main(){

	float *d_a,*d_b,*d_c;
	int n = N * N * sizeof(float);

	float *a = new float[n];
	float *b = new float[n];
	float *c = new float[n];

	for(int j=0;j<N;j++){
		for(int i=0;i<N;i++){
			a[j*N+i] = 2*i+4*j+1;
			b[j*N+i] = 3*i+2*j+1;	 	
		}	
	}

	printf("\nMatrix 1 is:\n");
	for(int j=0;j<N;j++){
		for(int i=0;i<N;i++){
			printf(" %.2f ",a[j*N+i]);	 	
		}
		printf("\n");	
	}

	printf("\nMatrix 2 is:\n");
	for(int j=0;j<N;j++){
		for(int i=0;i<N;i++){
			printf(" %.2f ",b[j*N+i]);	 	
		}
		printf("\n");	
	}

	cudaMalloc(&d_a,n);
	cudaMalloc(&d_b,n);
	cudaMalloc(&d_c,n);

	cudaMemcpy(d_a,a,n,cudaMemcpyHostToDevice);
	cudaMemcpy(d_b,b,n,cudaMemcpyHostToDevice);

	dim3 threadBlock(BLOCK_SIZE,BLOCK_SIZE);
	dim3 grid(GRID_SIZE,GRID_SIZE);

	MatrixMul<<<grid,threadBlock>>>(d_a,d_b,d_c,N);

	cudaMemcpy(c,d_c,n,cudaMemcpyDeviceToHost);
	printf("\nMatrix Multiplication:\n");
	for(int j=0;j<N;j++){
		for(int i=0;i<N;i++){
			printf(" %.2f ",c[j*N+i]);	 	
		}
		printf("\n");	
	}	
	free(a);
	free(b);
	free(c);

	cudaFree(a);
	cudaFree(b);
	cudaFree(c);


	return 0;
}


