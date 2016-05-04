#include <iostream>
#include <stdlib.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <sys/types.h>
#include <unistd.h>
#define SHMSZ 30
using namespace std;

int square(int num){
	int a=num/10;
	int b=num%10;
	int sqr = a*a*100+2*a*b*10+b*b;
	return sqr;
}

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
	num =(int)*s;
	sqr = square(num);
	cout<<"Square is : "<<sqr<<"\n";

	s++;
	int d=1000;
	for(int i=0;i<4;i++){
		*s =(char)(sqr/d+48);//mistake dont forget to put bracket and cast it to char
		sqr=sqr%d;
		d=d/10;
		s++;
	}


return 0;
}
