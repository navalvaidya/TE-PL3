#include<iostream>
#include<omp.h>
#include<stdlib.h>
using namespace std;

void ParallelPrims(int W[][4],int **T,int N){

	int *nearNode = new int[N];
	int *minDist = new int[N];
	int min,i,j,k;
	for(i=0;i<N;i++){
	nearNode[i] = 0;
	minDist[i] = W[i][0];
	}

	for(i=0;i<N-1;i++){
		min=9999;
		
		for(j=1;j<N;j++){
			if(min>minDist[j] && minDist[j]>0){
				min = minDist[j];
				k=j;
			}
			
		}
		minDist[k]=-1;
		T[i][0] = nearNode[k];
		T[i][1] = k;
	
		#pragma omp for
		for(j=1;j<N;j++){
			if(W[j][k]<minDist[j]){
				minDist[j]=W[j][k];
				nearNode[j]=k;
			}
		}
	
	}
	return;
	free(nearNode); 
	free(minDist);

}



int main(){
	int W[][4] = {{999, 50, 999, 40}, {50, 999, 20, 999}, {999, 20, 999, 30}, {40, 999, 30, 999}};
	int N=4;
	int **T = new int*;
	for(int i=0;i<N;i++){
		T[i] = new int;

	}

	ParallelPrims(W,T,N);

	for(int i=0;i<N;i++){
		cout<<T[i][0]<<"->"<<T[i][1]<<"\n";
	}
return 0;
}
