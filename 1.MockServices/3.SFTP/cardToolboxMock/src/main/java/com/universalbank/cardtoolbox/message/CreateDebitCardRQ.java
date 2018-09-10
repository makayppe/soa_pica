package com.universalbank.cardtoolbox.message;

import java.io.Serializable;

public class CreateDebitCardRQ implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;
	private String cardholder;
	private String accountNumber;
	private String branchOfficeNumber;
	private String isCompany;
	private String date;
	private String operationId;

	public CreateDebitCardRQ() {
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

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
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
