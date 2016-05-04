import Adafruit_BBIO.GPIO as g                                                  
import time as t                                                                
                                                                                
segment = ["P8_11","P8_12","P8_13","P8_14","P8_15","P8_16","P8_17"]             
up = ["P9_24","P9_11","P9_13","P9_15"]                                          
down = ["P9_23","P9_12","P9_14","P9_16"]                                        
zero = ["P8_11","P8_12","P8_13","P8_14","P8_15","P8_16"]                        
one = ["P8_12","P8_13"]                                                         
two = ["P8_11","P8_12","P8_14","P8_15","P8_17"]                                 
three = ["P8_11","P8_12","P8_13","P8_14","P8_17"]  
floor = [zero,one,two,three]                             
                                                                                
g.setup("P8_7",g.IN)  #settng buttns to ip mode                                                          
g.setup("P8_8",g.IN)                                                            
g.setup("P8_9",g.IN)                                                            
g.setup("P8_10",g.IN)                                                           
                                                                                
for j in range(0,len(up)):          #updown leds clear                                            
        g.setup(up[j],g.OUT)                                                    
        g.output(up[j],g.LOW)                                                   
                                                                                
for j in range(0,len(down)):                                                    
        g.setup(down[j],g.OUT)                                                  
        g.output(down[j],g.LOW)                                                 
                                                                                
def display(a):                         #disp 7 segmnt                                        
        for i in range(0,len(a)):                                               
                g.setup(a[i],g.OUT)                                             
                g.output(a[i],g.LOW) #for 7 segmnt low is high                                            
def clear():                                                                    
        for i in range (0,len(segment)):                                        
                g.setup(segment[i],g.OUT)                                       
                g.output(segment[i],g.HIGH) #for 7 segmnt high is low                                     
def upclr():
	for j in range(0,len(up)):                                                      
        	g.setup(up[j],g.OUT)                                                    
        	g.output(up[j],g.LOW) 
 
def downclr():
	 for j in range(0,len(down)):                                                    
		g.setup(down[j],g.OUT)                                                  
		g.output(down[j],g.LOW)       


def updisp():
	for j in range(0,len(up)):                                                      
        	g.setup(up[j],g.OUT)                                                    
        	g.output(up[j],g.HIGH)   

def downdisp():
	for j in range(0,len(down)):                                                    
		g.setup(down[j],g.OUT)                                                  
		g.output(down[j],g.HIGH)

def checking(current,nextst):
	if current < nextst:
        	downclr()
       		updisp()
		while current != nextst:
			clear()
			display(floor[current])
			current = current + 1
			t.sleep(1)
        	
        if current > nextst:
        	upclr()
       		downdisp()
		while current != nextst-1:
			clear()
			display(floor[current])
			current = current - 1
			t.sleep(1)
 
display(zero)#initial ll disp 0 main
current = 0
nextst = 0   
while True:  
	  
	if g.input("P8_8")==0:
		print "pressed 1"
		nextst = 1   
		checking(current,nextst)  
		current = nextst 
	                                                       
	if g.input("P8_7")==0:  
		print "pressed 3"
		nextst = 3  
		checking(current,nextst)
		current = nextst
			                                                                                                                                                  
		                                               
		                                                
		                                                                        
	if g.input("P8_9")==0:
		print "pressed 2"
		nextst = 2
		checking(current,nextst)  
		current = nextst
				                                                                                                 
		                                                                        
	if g.input("P8_10")==0:
		print "pressed 0"
		nextst = 0 #user needed
		checking(current,nextst)  
		current = nextst # 3 0,,.0 currnt floor
	
		#if current == nextst:
		#	display(floor[current])
                 
       
        	                                                
                                                                                                                                         
t.sleep(10)               
