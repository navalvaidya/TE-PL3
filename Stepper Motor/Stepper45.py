import Adafruit_BBIO.GPIO as g
import time as t

a = ["P9_11","P9_12","P9_13","P9_14"]

def rot(i):
	g.output(a[i%4],g.HIGH)
	print "high"+str(a[i%4])
	
	g.output(a[(i+1)%4],g.LOW)
	print "low "+str(a[(i+1)%4])

	g.output(a[(i+2)%4],g.LOW)
	print "low "+str(a[(i+2)%4])

	g.output(a[(i+3)%4],g.LOW)
	print "low "+str(a[(i+3)%4])
#------------------------------------------
	g.output(a[i%4],g.HIGH)
	print "high"+str(a[i%4])
	
	g.output(a[(i+1)%4],g.HIGH)
	print "high "+str(a[(i+1)%4])

	g.output(a[(i+2)%4],g.LOW)
	print "low "+str(a[(i+2)%4])

	g.output(a[(i+3)%4],g.LOW)
	print "low "+str(a[(i+3)%4])
	print "--------------------------------------"

for i in range(0,len(a)):
	g.setup(a[i],g.OUT)
	g.output(a[i],g.LOW)

i=0
while True:
	rot(i)
	t.sleep(2)
	i=i+1	
	if(i>3):
		i=0
