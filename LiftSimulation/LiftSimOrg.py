import time as T
import Adafruit_BBIO.GPIO as g
All=["P8_11","P8_12","P8_13","P8_14","P8_15","P8_16","P8_17"]
up=["P9_24","P9_11","P9_13","P9_15"]
down=["P9_23","P9_12","P9_14","P9_16"]
zero=["P8_11","P8_12","P8_13","P8_14","P8_15","P8_16"]
one=["P8_12","P8_13"]
two=["P8_11","P8_12","P8_17","P8_15","P8_14"]
three=["P8_11","P8_12","P8_17","P8_13","P8_14"]
button=["P8_7","P8_8","P8_9","P8_10"]
floor=[zero,one,two,three]
currentFloor=0
destFloor=0

for i in range(0,len(All)):
	g.setup(All[i],g.OUT)
def UpLed():			#function to activate up leds
	for i in range(0,len(up)):
		g.setup(up[i],g.OUT)
 		g.output(up[i],g.HIGH)

def ClearUpLed():			#function to activate up leds
	for i in range(0,len(up)):
		g.setup(up[i],g.OUT)
 		g.output(up[i],g.LOW)

def DownLed(): 		#function to activate down leds
	for i in range(0,len(down)):
		g.setup(down[i],g.OUT)
		g.output(down[i],g.HIGH)

def ClearDownLed(): 		#function to activate down leds
	for i in range(0,len(down)):
		g.setup(down[i],g.OUT)
		g.output(down[i],g.LOW)

def lightDisplay(a):
	for i in range(0,len(a)):                                               
                g.setup(a[i],g.OUT)                                             
                g.output(a[i],g.LOW)			#function to activate led of no. entered
		T.sleep(1)

def clear():                                                                    
        for i in range (0,len(All)):                                        
                g.setup(All[i],g.OUT)                                       
                g.output(All[i],g.HIGH)


lightDisplay(zero)
while True:
	flag=0
	for i in range(0,len(button)):
		g.setup(button[i],g.IN)
	
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
			for i in range(currentFloor,destFloor+1):
				clear()
				lightDisplay(floor[currentFloor])
				T.sleep(1)
				currentFloor=currentFloor+1;
				
			currentFloor=destFloor
			ClearUpLed()

		elif(currentFloor>destFloor):	#lift coming down
			DownLed()
			for i in range(destFloor,currentFloor+1):
				clear()
				lightDisplay(floor[currentFloor])
				T.sleep(1)
				currentFloor=currentFloor-1;

			currentFloor=destFloor
			ClearDownLed()
	





