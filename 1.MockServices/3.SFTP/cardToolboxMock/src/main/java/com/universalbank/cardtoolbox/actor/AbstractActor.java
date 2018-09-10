package com.universalbank.cardtoolbox.actor;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public abstract class AbstractActor<T> {
	
	protected DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss");
	protected DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

	/**
	 * 
	 * @param inputStream
	 * @return
	 * @throws Exception
	 */
	public List<T> read(InputStream inputStream) throws Exception {
		try {
			List<T> listMessageRQ = new ArrayList<>();
			String line = null;
			try (BufferedReader bf = new BufferedReader(new InputStreamReader(inputStream))) {
				while (null != (line = bf.readLine())) {
					listMessageRQ.add(transform(line));
				}
			}
			return listMessageRQ;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


	/**
	 * 
	 * @param listMessageRQ
	 * @return
	 */
	abstract public InputStream write(List<T> listMessageRQ);
	
	/**
	 * 
	 * @param line
	 * @return
	 */
	abstract protected T transform(String line);

}
