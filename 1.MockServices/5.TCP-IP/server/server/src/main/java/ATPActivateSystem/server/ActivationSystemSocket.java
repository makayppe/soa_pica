package ATPActivateSystem.server;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.UnknownHostException;

import ATPActivateSystem.server.services.ATPService;

public class ActivationSystemSocket {

	private ServerSocket server;
	

	public ActivationSystemSocket(String ipAddress) throws UnknownHostException, IOException {
		if(ipAddress != null & !ipAddress.isEmpty())
			this.server = new ServerSocket(9701,1,InetAddress.getByName(ipAddress));
		else
			this.server =new ServerSocket(9701, 1, InetAddress.getLocalHost());
	
	}
	
	public void listen() throws Exception{
		String data = null;
        Socket client = this.server.accept();
        String clientAddress = client.getInetAddress().getHostAddress();
        System.out.println("\r\nNew connection from " + clientAddress);
        OutputStream output = client.getOutputStream();
        
        BufferedReader in = new BufferedReader(
                new InputStreamReader(client.getInputStream()));        
        while ( (data = in.readLine()) != null ) {
        	ATPService atpService = new ATPService();
        	String response = atpService.seriveOperation(data);
        	System.out.println("Message from " + clientAddress + " message " + data);
        	PrintWriter writer = new PrintWriter(output, true);
        	writer.println(response);
        }
	}
	
	public InetAddress getSocketAddress() {
        return this.server.getInetAddress();
    }
    
    public int getPort() {
        return this.server.getLocalPort();
    }


}
