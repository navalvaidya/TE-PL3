#include <iostream>
#include <stdlib.h>
#include <omp.h>
#define NN 30
using namespace std;

void narySearch(int *s,int low,int high,int key,int Ntrvl,int *pos){
	float step,offset;
	int *mid = new int[Ntrvl+1];
	char *locate = new char[Ntrvl+2];

	locate[0] = 'R';
	locate[Ntrvl+1] = 'L';

	#pragma omp parallel
	{
		while(low<=high && *pos==-1){
			int lmid;
			#pragma omp single
			{
				mid[0]=low-1;
				step = (high-low+1)/(Ntrvl+1);//mistake
			}
			#pragma omp for private(offset) firstprivate(step)//mistake
			for(int i=1;i<=Ntrvl;i++){
				offset = step*i + (i-1);
				lmid = mid[i] = low +(int)offset;
				if(lmid<=high){
					if(s[lmid]<key){
						locate[i] = 'R';
					}
					else if(s[lmid]>key){
						locate[i] = 'L';	
					}
					else{
						locate[i] = 'E';
						*pos =lmid; 
					}
				}
				else{
					mid[i] = high+1;
					locate[i] = 'L';
				}
		
			}

				#pragma omp single//mistake
				{
				for(int i=1;i<=Ntrvl;i++){
					if(locate[i]!=locate[i-1]){
						low = mid[i-1]+1;
						high = mid[i]-1;
					}
				}
				if(locate[Ntrvl]!=locate[Ntrvl+1]){
					low = mid[Ntrvl]+1;
				}
				}
						
			
		}
	}

delete[] mid;
delete[] locate;

}


int main(){
	int pos=-1;//miss
	int interval=4;
	int key=52;
	int S[NN];//miss

	for(int i=0;i<NN;i++){
		S[i]=i*2;
	}

	for(int i=0;i<NN;i++){
		cout<<S[i]<<" ";
	}
	cout<<"\n";
	narySearch(S,0,NN-1,key,interval,&pos);
	if(pos!=-1){
		cout<<"Key "<<key<<" found at index "<<pos<<"\n";
	}
	else{
		cout<<"Number not found\n";
	}
	
return 0; 
}
