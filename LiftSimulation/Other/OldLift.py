import time as T
import Adafruit_BBIO.GPIO as g
All=["P8_11","P8_12","P8_13","P8_14","P8_15","P8_16","P8_17"]
up=["P9_24","P9_11","P9_13","P9_15"]
down=["P9_23","P9_12","P9_14","P9_16"]
zero=["P8_11","P8_12","P8_13","P8_14","P8_15","P8_16"]
one=["P8_12","P8_13"]
two=["P8_11","P8_12","P8_17","P8_15","P8_14"]
three=["P8_11","P8_12","P8_17","P8_13","P8_14"]
input=["P8_7","P8_8","P8_9","P8_10"]
currentFloor=0
destFloor=0
for i in range(0,len(All)):
	g.setup(All[i],g.OUT)
def UpLed():			#function to activate up leds
	for i in range(0,len(up)):
		g.setup(up[i],g.OUT)
 		g.output(up[i],g.HIGH)

def DownLed(): 		#function to activate down leds
	for i in range(0,len(down)):
		g.setup(down[i],g.OUT)
		g.output(down[i],g.HIGH)

def lightDisplay(floorNo):			#function to activate led of no. entered
	if(floorNo==0):
		for i in range(0,len(All)):
			g.output(All[i],g.HIGH)
		for i in range(0,len(zero)):
            g.output(zero[i],g.LOW)
        T.sleep(1)

	elif(floorNo==1):
		for i in range(0,len(All)):
			g.output(All[i],g.HIGH)
		for i in range(0,len(one)):
			g.output(one[i],g.LOW)
		 T.sleep(1)

	elif(floorNo==2):
		for i in range(0,len(All)):
			g.output(All[i],g.HIGH)
		for i in range(0,len(two)):
			g.output(two[i],g.LOW)
         T.sleep(1)

	elif(floorNo==3):
		for i in range(0,len(All)):
			g.output(All[i],g.HIGH)
		for i in range(0,len(three)):
            g.output(three[i],g.LOW)
        T.sleep(1)

lightDisplay(0)
while True:
	flag=0
    for i in range(0,len(input)):
		g.setup(input[i],g.IN)
    if g.input("P8_10")==0:
		flag=1
		destFloor=0
	if g.input("P8_8")==0:
		flag=1
		destFloor=1
    if g.input("P8_9")==0:
		flag=1
        destFloor=2
    if g.input("P8_7")==0:
		flag=1
        destFloor=3
	if(flag==1):
		if(currentFloor<destFloor):		#lift going up
			UpLed()
			for i in range(currentFloor,destFloor):
				lightDisplay(currentFloor)
				currentFloor=currentFloor+1;
			currentFloor=destFloor
			for i in range(0,len(up)):
				g.output(up[i],g.LOW)

		elif(currentFloor>destFloor):	#lift coming down
			DownLed()
			for i in range(currentFloor,destFloor):
				lightDisplay(currentFloor)
				currentFloor=currentFloor-1;
			currentFloor=destFloor
			for i in range(0,len(down)):
               	g.output(down[i],g.LOW)
