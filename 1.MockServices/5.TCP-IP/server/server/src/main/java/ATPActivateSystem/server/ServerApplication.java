package ATPActivateSystem.server;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ServerApplication {

	public static void main(String[] args) throws Exception {
		SpringApplication.run(ServerApplication.class, args);
		ActivationSystemSocket app = new ActivationSystemSocket("");
        System.out.println("\r\nRunning Server: " + 
                "Host=" + app.getSocketAddress().getHostAddress() + 
                " Port=" + app.getPort());
        
        app.listen();
	}
}
