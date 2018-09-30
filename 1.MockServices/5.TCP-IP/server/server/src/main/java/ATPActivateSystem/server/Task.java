package ATPActivateSystem.server;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;

import ATPActivateSystem.server.services.ATPService;

public class Task extends Thread {

	private Socket client;

	@Override
	public void run() {

		System.out.println("Entro al Run");
		BufferedReader bufferIn  = null;
		OutputStream outputStream = null;		
		String data = null;
		try {
			bufferIn = new BufferedReader(new InputStreamReader(client.getInputStream()));
			outputStream = client.getOutputStream();
			while ((data = bufferIn.readLine()) != null) {
				ATPService atpService = new ATPService();
				String response = atpService.seriveOperation(data);
				PrintWriter writer = new PrintWriter(outputStream, true);
				String concat = "<response>Sucess</response>";
				writer.println(concat);
				System.out.println("Operation finished:" + response);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(outputStream != null)
					outputStream.flush();
				if(bufferIn != null)
					bufferIn.close();
				client.close();
			} catch (IOException e) {

			}
			
		}
	}

	public Task(Socket client) {
		super();
		this.client = client;
	}

}
