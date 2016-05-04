import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;


public class EchoServer {

	public static void main(String[] args){
		int port = Integer.parseInt(args[0]);
		ServerSocket server;
		try{
			server = new ServerSocket(port);
			while(true){
			Socket connection = server.accept();
			ConnectionHandler handler = new ConnectionHandler(connection);
			handler.start();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}

class ConnectionHandler extends Thread{
	private Socket connection;
	public ConnectionHandler(Socket connection){
		this.connection=connection;
	}
	
	public void run(){
		try{
			System.out.println("Connecting........");
			BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			PrintWriter writer = new PrintWriter(connection.getOutputStream());
			System.out.println("ok");
			while(true){
				String clientText = reader.readLine();
				writer.println("Server Reply : "+clientText);
				writer.flush();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
