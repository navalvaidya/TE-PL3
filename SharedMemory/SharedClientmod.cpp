#include <iostream>
#include <stdlib.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <sys/types.h>
#include <unistd.h>
#define SHMSZ 30
using namespace std;

int main(){
	int num,shmid,sqr;
	void *shm;
	char *s;
	key_t key=1000;

	if((shmid=shmget(key,SHMSZ,IPC_CREAT|0666))<-1){
		cout<<"error";
	}

	shm = shmat(shmid,NULL,0);
	if((int*)shm==(int*)-1){
		cout<<"Error attach\n";
	}

	s=(char*)shm;
	s++;
		
	cout<<"Enter a two digit number : ";
	cin>>num;

	*s=(char)num;
	sleep(10);

	cout<<"The square is : ";
	s++;
	for(int i=0;*s!=NULL && i<4;i++){
		cout<<(char)*s;//mistake it is (char)*s not (char*)s
		s++;
	}

	cout<<"\n";



return 0;
}
