package stratus.activemq.stratus.services;

public class CancelAccountStratus {

	public long accountNumber;
	public String reasondId;
	public String description;

	public CancelAccountStratus() {
		super();
	}

	public CancelAccountStratus(long accountNumber, String reasondId, String description) {
		super();
		this.accountNumber = accountNumber;
		this.reasondId = reasondId;
		this.description = description;
	}

	public long getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(long accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getReasondId() {
		return reasondId;
	}

	public void setReasondId(String reasondId) {
		this.reasondId = reasondId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
