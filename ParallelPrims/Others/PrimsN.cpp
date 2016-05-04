#include <iostream>
#include <stdlib.h>
#include <omp.h>
using namespace std;

int main(){
	double start_time = omp_get_wtime();
	int count,min,u=0,v=0,total=0;
	cout<<"Enter no. of nodes :";
	cin>>count;

	//int Matrix[10][10];
	int visited[10];
	int Matrix[4][4] = {{999, 50, 999, 40}, {50, 999, 20, 999}, {999, 20, 999, 30}, {40, 999, 30, 999}};
	for(int i=0;i<count;i++){
		visited[i]=0;
		for(int j=0;j<count;j++){
		//	cout<<"\nEnter the weight in Matrix :";
		//	cin>>Matrix[i][j];
			if(Matrix[i][j]==0){
				Matrix[i][j]=999;			
			}
		}
	}

	for(int i=0;i<count;i++){
		for(int j=0;j<count;j++){	
			cout<<Matrix[i][j]<<"\t";
		}
		cout<<"\n";
	}
	
	visited[0]=1;

	//start algorithm

	for(int counter=0;counter<count-1;counter++){
		min=999;
		for(int i=0;i<count;i++){
			if(visited[i]==1){
				#pragma omp parallel for
				for(int j=0;j<count;j++){
						if(visited[j]!=1){
							#pragma omp critical
							if(min>Matrix[i][j]){
								min=Matrix[i][j];
								u=i;
								v=j;
							}
						}
				}
			
			}	

		}
		total += min;
		visited[v] = 1;
		cout<<"Edge Connected: "<<u<<" -> "<<v<<" : "<<min<<"\n";
	}
	cout<<"Total Weight of spanning tree is :"<<total<<"\n";
	cout<< omp_get_wtime() - start_time<<"\n";
return 0;
}
