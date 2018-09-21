package com.rabbit.mq.producer.RabbitMq.Endpoint;

import java.io.IOException;

import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;

public class Endpoint {
	
    protected Channel channel;
    protected Connection connection;
    protected String endPointName;
	
	public Endpoint() throws IOException {
		
	    ConnectionFactory factory = new ConnectionFactory();
	    factory.setHost("localhost");
	    Connection connection = factory.newConnection();
	    Channel channel = connection.createChannel();

	    channel.queueDeclare("testingQueue", false, false, false, null);
	    String message = "Hello World!";
	    channel.basicPublish("", "testingQueue", null, message.getBytes("UTF-8"));
	    System.out.println(" [x] Sent '" + message + "'");

	    channel.close();
	    connection.close();
	  }
}
