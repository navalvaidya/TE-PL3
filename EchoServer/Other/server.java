import java.io.DataOutputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;


public class server {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		try{
			ServerSocket soc = new ServerSocket(1234);
			Socket accept = soc.accept();
			OutputStream outputStream = accept.getOutputStream();
			DataOutputStream dataOutputStream = new DataOutputStream(outputStream);
			dataOutputStream.writeUTF("Sending from server to client");
			dataOutputStream.close();
			outputStream.close();
			accept.close();
			soc.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}

