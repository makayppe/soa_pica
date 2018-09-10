package com.universalbank.cardtoolbox.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class ApplicationProperties {

	@Value("${app.ftp.hostname}")
	private String hostname;

	@Value("${app.ftp.port}")
	private Integer serverPort;

	@Value("${app.ftp.username}")
	private String userName;

	@Value("${app.ftp.password}")
	private String password;
	
	public ApplicationProperties() {
		super();
	}

	public String getHostname() {
		return hostname;
	}

	public void setHostname(String hostname) {
		this.hostname = hostname;
	}

	public Integer getServerPort() {
		return serverPort;
	}

	public void setServerPort(Integer serverPort) {
		this.serverPort = serverPort;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
