package com.universalbank.cardtoolbox.message;

import java.io.Serializable;

public class CreateDebitCardRS implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String cardholder;
	private String cardNumber;
	private String validThru;
	private String franchise;
	private String issuingDate;
	private String operationId;

	public CreateDebitCardRS() {
		super();
	}

	public String getCardholder() {
		return cardholder;
	}

	public void setCardholder(String cardholder) {
		this.cardholder = cardholder;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getValidThru() {
		return validThru;
	}

	public void setValidThru(String validThru) {
		this.validThru = validThru;
	}

	public String getFranchise() {
		return franchise;
	}

	public void setFranchise(String franchise) {
		this.franchise = franchise;
	}

	public String getIssuingDate() {
		return issuingDate;
	}

	public void setIssuingDate(String issuingDate) {
		this.issuingDate = issuingDate;
	}

	public String getOperationId() {
		return operationId;
	}

	public void setOperationId(String operationId) {
		this.operationId = operationId;
	}

}
