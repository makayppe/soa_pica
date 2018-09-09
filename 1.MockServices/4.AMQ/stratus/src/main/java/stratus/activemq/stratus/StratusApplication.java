package stratus.activemq.stratus;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan(basePackages="stratus.activemq.stratus.consumer")
@SpringBootApplication
public class StratusApplication {

	public static void main(String[] args) {
		SpringApplication.run(StratusApplication.class, args);
	}
}
