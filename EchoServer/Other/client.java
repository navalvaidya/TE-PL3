import java.io.DataInputStream;
import java.io.InputStream;
import java.net.Socket;


public class client {


	public static void main(String[] args) {
		try {
			Socket connection = new Socket("localhost",1234);
			InputStream inputStream = connection.getInputStream();
			DataInputStream dataInputStream = new DataInputStream(inputStream);
			
			String  received = dataInputStream.readUTF();
			System.out.println(received);
			
			
			dataInputStream.close();
			connection.close();
		} catch (Exception e) {

			e.printStackTrace();
		}
		

	}

}

