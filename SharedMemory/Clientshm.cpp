#include<sys/types.h>
#include<sys/shm.h>
#include<sys/ipc.h>
#include<stdio.h>
#include<iostream>
#include<unistd.h>
#define shmsz 30

using namespace std;

int main()
{

  int shmid,a,b;
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

 s =(char*)shm;
 cout<<"Enter the numbers :";
 cin>>a;

 *s++;
 *s=(char)a;

 sleep(10);
 cout<<"Square: ";
 *s++;
 for (int i=0; *s != NULL && i<4;i++){
	cout<<(char)*s;        
        s++;
        }
cout<<"\n";
return 0;
}
