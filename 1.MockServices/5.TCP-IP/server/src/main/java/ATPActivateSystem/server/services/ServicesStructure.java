package ATPActivateSystem.server.services;

public class ServicesStructure {
	
	public int operationType;
	public String cardNumber;
	public int cardType;
	
	public ServicesStructure() {
		super();
	}
	public ServicesStructure(int operationType, String cardNumber, int cardType) {
		super();
		this.operationType = operationType;
		this.cardNumber = cardNumber;
		this.cardType = cardType;
	}

	public int getOperationType() {
		return operationType;
	}

	public void setOperationType(int operationType) {
		this.operationType = operationType;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public int getCardType() {
		return cardType;
	}

	public void setCardType(int cardType) {
		this.cardType = cardType;
	}

}
