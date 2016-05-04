#include <iostream>
#include <sys/shm.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <stdlib.h>
#include <unistd.h>
#define SHMSZ 30
using namespace std;

int square(int num){
	int a=num/10;
	int b=num%10;
	int squared = a*a*100+2*a*b*10+b*b;
	return squared;
}


int main(){
	int shmid,num;
	void *shm;
	char *s;
	key_t key=1000;

	if((shmid=shmget(key,SHMSZ,IPC_CREAT | 0666))<-1)
		cout<<"\nError in getting shared Memory";

	shm = shmat(shmid,NULL,0);
	if((int*)shm==(int*)-1)
		cout<<"\nError in attaching ";


	s=(char*)shm;
	*s++;

	num=(int)*s;
	cout<<num<<"\n";
	int squared = square(num);
	cout<<squared<<"\n";
	
	*s++;
	int d=1000;
	for(int i=0;i<4;i++){
		*s =(char)(squared/d+48);
		squared = squared%d;
		d=d/10;
 		*s++;
	}

return 0;
}
