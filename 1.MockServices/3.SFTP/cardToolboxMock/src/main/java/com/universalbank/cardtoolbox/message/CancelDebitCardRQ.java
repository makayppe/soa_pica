package com.universalbank.cardtoolbox.message;

import java.io.Serializable;

public class CancelDebitCardRQ implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String branchOfficeNumber;
	private String cardNumber;
	private String date;
	private String operationId;

	public CancelDebitCardRQ() {
		super();
	}

	public String getBranchOfficeNumber() {
		return branchOfficeNumber;
	}

	public void setBranchOfficeNumber(String branchOfficeNumber) {
		this.branchOfficeNumber = branchOfficeNumber;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
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
