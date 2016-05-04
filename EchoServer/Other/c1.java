import java.net.*;
import java.util.Scanner;
import java.io.*;
public class c1
{
    public static void main(String args[]) throws IOException 
    {

    Socket s1 = new Socket("localhost",1234);

    OutputStream s1out = s1.getOutputStream();
    DataOutputStream dis1 = new DataOutputStream(s1out);

    Scanner b = new Scanner(System.in);
    while(true)
    {
    String str=b.nextLine();
    dis1.writeUTF(str);

    }

    }
}
