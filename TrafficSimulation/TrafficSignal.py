import Adafruit_BBIO.GPIO as g
import time as t

a1 = ["P9_15","P9_24","P8_12","P8_14","P8_11","P9_23"]
a2 = ["P8_15","P8_17","P9_12","P9_14","P9_11","P8_18"]
y1 = ["P9_13","P8_16","P8_11","P9_23"]
y2 = ["P8_13","P9_16","P9_11","P8_18"]

while True:
	
	for i in range (0,len(a1)):
		print "green red com 1"
		g.setup(a1[i],g.OUT)
		g.output(a1[i],g.HIGH)
	t.sleep(8)
	
	for i in range(0,len(a1)):
		print "green red com 1 off"
		g.output(a1[i],g.LOW)
		
	for i in range(0,len(y1)):
		print "yellow red com 1"
		g.setup(y1[i],g.OUT)
		g.output(y1[i],g.HIGH)
	t.sleep(2)

	for i in range(0,len(y1)):
		print "yellow red com 1 off"
		g.output(y1[i],g.LOW)


	for i in range (0,len(a2)):
		print "green red com 2"
		g.setup(a2[i],g.OUT)
		g.output(a2[i],g.HIGH)
	t.sleep(8)
	
	for i in range(0,len(a2)):
		print "green red com 2 off"
		g.output(a2[i],g.LOW)
		
	for i in range(0,len(y2)):
		print "yellow red com 2"
		g.setup(y2[i],g.OUT)
		g.output(y2[i],g.HIGH)
	t.sleep(2)

	for i in range(0,len(y2)):
		print "yellow red com 2 off"
		g.output(y2[i],g.LOW)

