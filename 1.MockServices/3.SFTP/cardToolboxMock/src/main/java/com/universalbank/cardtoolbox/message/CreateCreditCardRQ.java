package com.universalbank.cardtoolbox.message;

import java.io.Serializable;

public class CreateCreditCardRQ implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;
	private String cardholder;
	private String branchOfficeNumber;
	private String isCompany;
	private String quota;
	private String franchise;
	private String cardType;
	private String date;
	private String operationId;

	public CreateCreditCardRQ() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCardholder() {
		return cardholder;
	}

	public void setCardholder(String cardholder) {
		this.cardholder = cardholder;
	}

	public String getBranchOfficeNumber() {
		return branchOfficeNumber;
	}

	public void setBranchOfficeNumber(String branchOfficeNumber) {
		this.branchOfficeNumber = branchOfficeNumber;
	}

	public String getIsCompany() {
		return isCompany;
	}

	public void setIsCompany(String isCompany) {
		this.isCompany = isCompany;
	}

	public String getQuota() {
		return quota;
	}

	public void setQuota(String quota) {
		this.quota = quota;
	}

	public String getFranchise() {
		return franchise;
	}

	public void setFranchise(String franchise) {
		this.franchise = franchise;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
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
