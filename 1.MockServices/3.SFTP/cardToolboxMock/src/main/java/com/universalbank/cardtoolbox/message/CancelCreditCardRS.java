package com.universalbank.cardtoolbox.message;

import java.io.Serializable;

public class CancelCreditCardRS implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public String status;
	public String date;
	public String operationId;
	
	public CancelCreditCardRS() {
		super();
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getOperationId() {
		return operationId;
	}

	public void setOperationId(String operationId) {
		this.operationId = operationId;
	}	
	
}
