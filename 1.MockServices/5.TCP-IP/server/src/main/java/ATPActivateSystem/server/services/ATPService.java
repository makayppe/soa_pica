package ATPActivateSystem.server.services;

public class ATPService {


	public String seriveOperation(String data) {
		String response = null;
		ServicesStructure servicesStructure = new ServicesStructure();
		servicesStructure.setOperationType(Integer.parseInt(data.substring(0, 2)));
		servicesStructure.setCardNumber(data.substring(2, 12));
		servicesStructure.setCardType(Integer.parseInt(data.substring(12, 14)));
		if(servicesStructure.getOperationType()==1) {
			response =  "00SUCCESS         ";
			System.out.println("Activation Successful");
		}
		else if(servicesStructure.getOperationType()==2) {
			response =  "33SUCCESS         ";
			System.out.println("Cancelation Successful");
		}
		else {
			response = "87OPERATION FAILED";
			System.out.println("Operation not known.");
		}
		return response;		
	}

}
