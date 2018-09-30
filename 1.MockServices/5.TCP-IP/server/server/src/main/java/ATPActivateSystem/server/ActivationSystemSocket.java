package ATPActivateSystem.server;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;

import ATPActivateSystem.server.services.ATPService;

public class ActivationSystemSocket {

	private ServerSocket server;

	public ActivationSystemSocket(String ipAddress) {
		try {
			if (ipAddress != null & !ipAddress.isEmpty())
				this.server = new ServerSocket(9701, 1, InetAddress.getByName(ipAddress));
			else
				this.server = new ServerSocket(9701, 1, InetAddress.getLocalHost());
		} catch (Exception e) {
			String response = "error en comunicacion";
			System.out.println(response);
		}
	}

	public void listen() {
		Socket client = null;
		try {
			
			while (true) {
				client = this.server.accept();
				String clientAddress = client.getInetAddress().getHostAddress();
				System.out.println("\r\nNew connection from " + clientAddress);
				Task task = new Task(client);
				task.start();
			}
			
		} catch (Exception e) {
			String response = "error en comunicacion";
			System.out.println(response);
		}finally {
			if(client != null) {
				try {
					this.server.close();
				} catch (IOException e) {
				}
			}
		}
	}

	public InetAddress getSocketAddress() {
		return this.server.getInetAddress();
	}

	public int getPort() {
		return this.server.getLocalPort();
	}

}
