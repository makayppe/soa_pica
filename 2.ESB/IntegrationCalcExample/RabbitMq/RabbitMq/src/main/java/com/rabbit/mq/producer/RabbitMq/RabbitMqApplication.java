package com.rabbit.mq.producer.RabbitMq;

import java.io.IOException;

import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.MessageProperties;

//@SpringBootApplication
public class RabbitMqApplication {

	public static void main(String[] args) throws IOException {
	    ConnectionFactory factory = new ConnectionFactory();
	    factory.setHost("localhost");
	    Connection connection = factory.newConnection();
	    Channel channel = connection.createChannel();
	    
	    channel.exchangeDeclare("testingPica", "direct", true);
	    
	    channel.queueDeclare("testingQueue", true, false, false, null);
	    String message = "YESELIN ES UNA NENA DE WEB CAM";
	    channel.queueBind("testingQueue", "testingPica", "camel"); 
	    channel.basicPublish("testingPica", "camel", MessageProperties.PERSISTENT_TEXT_PLAIN, message.getBytes("UTF-8"));
	    System.out.println(" [x] Sent '" + message + "'");

	    channel.close();
	    connection.close();
	}
}
