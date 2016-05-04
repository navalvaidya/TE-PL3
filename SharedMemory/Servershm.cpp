#include <stdlib.h>
#include<sys/types.h>
#include<sys/shm.h>
#include<sys/ipc.h>
#include<stdio.h>
#include<iostream>
#define shmsz 30
using namespace std;

int square(int n){
	int a,b;
	a=n/10;
	b=n%10;
	int squared=a*a*100+a*b*2*10+b*b;
	return squared;
}

int main() {
	int shmid,num,squared;
	void *shm;
	char *s;
	key_t key=1000;

	  if((shmid=shmget(key,shmsz,IPC_CREAT | 0666))<0)
	  {
	    cout<<"ERROR";
	  }

	  shm=shmat(shmid,NULL,0);
	  if((int*)shm==(int*)-1)
	  {
	  cout<<"Error while attach";

	  }
	  s =(char *)shm;

	  *s++;
	  num=(int)*s;

	  cout<<num<<"\n";
	  squared=square(num);
	  cout<<squared<<"\n";

	int d=1000;
	s++;
	for (int i=0;i<4;i++){
        *s = (char)(squared/d+48);
        squared=squared%d;
        d=d/10;
        s++;
        }

	return 0;
}



