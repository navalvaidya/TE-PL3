import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Scanner;


public class EchoServermod {


	public static void main(String[] args) {
		ServerSocket server;
		int port = Integer.parseInt(args[0]);
		try {
			server = new ServerSocket(port);
			while(true){
				Socket connection = server.accept();
				ConnectionHandler handler = new ConnectionHandler(connection);
				handler.start();
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
class ConnectionHandler extends Thread{
	private Socket connection;
	public ConnectionHandler(Socket connection) {
		this.connection=connection;
	}
	
	public void run(){
		try{
			BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			PrintWriter writer = new PrintWriter(connection.getOutputStream(),true);//dont miss true in clients
			while(true){
				
				String clientText = reader.readLine();
				writer.println("Server reply : "+clientText);//mistake writer.println not writer.write
				writer.flush();
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
