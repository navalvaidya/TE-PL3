import socket
c=socket.socket()
c.connect(("127.0.0.1",1338))
m=c.recv(1024)
print m
ch=raw_input("enter : ")
c.send(ch)
buff=c.recv(1024)
print buff
fl=open("recv.txt",'w')
fl.write(buff)
fl.close()
c.close()

