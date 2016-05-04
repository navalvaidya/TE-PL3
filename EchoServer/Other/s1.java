import java.net.*;
import java.io.*;
public class s1 extends Thread
{
	ServerSocket s;
     public s1()
     {
	try
	{
	s = new ServerSocket(1234);
	System.out.println("socket created");
	}
	catch(Exception e){}
	this.start();
     }

     public void run()
     {
	while(true)
	{
	try
	{
		Socket ss=s.accept();
		connection con=new connection(ss);
		System.out.println("connection established");
	}
	catch(Exception e){}
	}

     }
     
     public static void main(String args[]) throws IOException 
     {
   	new s1();
     }
}

class connection extends Thread
{
	DataInputStream dis;
	public connection(Socket ss)
	{
	try
	{
		InputStream s1In = ss.getInputStream();
    		dis = new DataInputStream(s1In);
	}
	catch(Exception e){}
	this.start();
	}

	public void run()
        {
	while(true)
	{
	try
	{
		String st = new String (dis.readUTF());
    		System.out.println(st);
	}
	catch(Exception e){}
	}

        }
}
