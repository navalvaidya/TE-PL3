import socket

c = socket.socket()

c.connect(("127.0.0.1",1337))
while True:
	msg =c.recv(1024)
	print msg
	if msg == "bye":
		break;
	sendmsg = raw_input("Enter message---")
	c.send(sendmsg)
c.close()
