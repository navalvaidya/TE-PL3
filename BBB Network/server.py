import socket
s=socket.socket()
s.bind(("127.0.0.1",1338))
s.listen(5)#mistake miss first listen than accept

while True:
	c,addr=s.accept()
	c.send("Enter file to receive:\n1.test.txt\n2.test2.txt\n" )
	ch=c.recv(1024)
	fl=open(ch,'r')
	buff=fl.read()
	c.send(buff)
c.close()
s.close()
