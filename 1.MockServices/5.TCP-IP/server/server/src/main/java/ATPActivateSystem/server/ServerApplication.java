package ATPActivateSystem.server;

public class ServerApplication {

	public static void main(String[] args) {
		ActivationSystemSocket app = new ActivationSystemSocket("");
		System.out.println(
				"\r\nRunning Server: Host=" + app.getSocketAddress().getHostAddress() + " Port=" + app.getPort());
		app.listen();
	}
}
