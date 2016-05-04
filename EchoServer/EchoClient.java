import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;


public class EchoClient {
		
	public static void main(String[] args){
		String host = args[0];
		int port = Integer.parseInt(args[1]);
		Socket connection;
		Scanner s;
		try{
			connection = new Socket(host,port);
			BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			PrintWriter writer = new PrintWriter(connection.getOutputStream(),true);
			System.out.println("Connected");
			s = new Scanner(System.in);
			while(true){
				System.out.print("Enter Text : ");
				String input = s.nextLine();
				writer.println(input);
				String reply = reader.readLine();
				System.out.println(reply);
				writer.flush();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}

