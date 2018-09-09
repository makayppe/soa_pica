package stratus.activemq.stratus.services;

public class CreateAccountStratus {
	
	public String name;
	public String lastName;
	public String id;
	public String idType;
	public String accountType;
	
	public CreateAccountStratus() {
		super();
	}

	public CreateAccountStratus(String name, String lastName, String id, String idType, String accountType) {
		super();
		this.name = name;
		this.lastName = lastName;
		this.id = id;
		this.idType = idType;
		this.accountType = accountType;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIdType() {
		return idType;
	}

	public void setIdType(String idType) {
		this.idType = idType;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

}
