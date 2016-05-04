import socket

s = socket.socket()
s.bind(("127.0.0.1",1337))
s.listen(5)
c,a = s.accept()
while True:
	smsg = raw_input("Enter message --");
	c.send(smsg)
	msg = c.recv(1024)
	print msg
	if msg=="bye" or smsg=="bye":
		break;
c.close()
s.close()
