#include <iostream>
#include <sys/shm.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <stdlib.h>
#include <unistd.h>
#define SHMSZ 30
using namespace std;

int main(){
	int shmid,a;
	void *shm;
	char *s;
	key_t key=1000;

	if((shmid=shmget(key,SHMSZ,IPC_CREAT | 0600))<-1)
		cout<<"\nshmget failed";

	shm = shmat(shmid,NULL,0);
	if((int*)shm==(int*)-1)
		cout<<"\nshmat error";

	s=(char*)shm;
	cout<<"Enter a two digit number: ";
	cin>>a;

	*s++;
	*s =(char)a;
	sleep(10);
	
	cout<<"Square :";
	*s++;
	for(int i=0; *s!=NULL && i<4;i++){
		cout<<(char)*s;
		*s++;
	}	
	cout<<"\n";

	return 0;
}

