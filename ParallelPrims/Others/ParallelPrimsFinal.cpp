#include <iostream>
#include <stdlib.h>
#include <omp.h>
using namespace std;

int main(){
	int count,min,u=0,v=0,total=0;
	cout<<"Enter no. of nodes :";
	cin>>count;

	//int Matrix[10][10];
	int visited[10];
		int Matrix[5][5] = {{0,6,7,5,3},{6,0,2,9,1},{7,2,0,9,3},{5,9,9,0,6},{3,1,3,6,0}};
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

		for(int counter = 0; counter < count-1 ; counter++){
			
			min = 999;
			
			for(int i = 0; i < count; i++){
			
			if(visited[i]==1){
			
				for(int j = 0; j < count; j++){
				
					if(visited[j]==0){
						
						if(min > Matrix[i][j]){
							
							min = Matrix[i][j];
							u = i;
							v = j;
							
						}
						
					}
					
				}
				
			}
			
			}
			visited[v] = 1;
			total += min;
			//Matrix[u][v] = Matrix[u][v] = 999; 
			cout<<"Edge connected: "<<u<<" -> "<<v<<" : "<<min<<"\n";
			
			
		
		}
		cout<<"The total weight of the spanning tree is "<< total<<"\n";
return 0;
}
