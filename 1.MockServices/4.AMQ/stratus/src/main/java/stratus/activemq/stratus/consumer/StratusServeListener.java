package stratus.activemq.stratus.consumer;

import java.io.IOException;
import java.io.StringReader;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.TextMessage;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.jms.annotation.JmsListener;
import org.springframework.stereotype.Component;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import stratus.activemq.stratus.services.CancelAccountStratus;
import stratus.activemq.stratus.services.CreateAccountStratus;

@Component
public class StratusServeListener {

	public static final String createAccountString = "sys:createAccount";
	public static final String cancelAccountString = "cancelAccount";

	@JmsListener(destination = "jms/stratus/accountSystem")
	public void onMessage(final Message message)
			throws JMSException, ParserConfigurationException, SAXException, IOException {
		String response = null;
		TextMessage tm = (TextMessage) message;
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
		Document doc = dBuilder.parse(new InputSource(new StringReader(tm.getText().toString())));

		doc.getDocumentElement().normalize();

		Node txType = doc.getFirstChild();
		
		if (txType.getNodeName().equals(createAccountString)) {
			CreateAccountStratus createAccount = new CreateAccountStratus();
			createAccount.setName(doc.getElementsByTagName("sys:name").item(0).getTextContent());
			createAccount.setLastName(doc.getElementsByTagName("sys:lastName").item(0).getTextContent());
			createAccount.setId(doc.getElementsByTagName("sys:id").item(0).getTextContent());
			createAccount.setIdType(doc.getElementsByTagName("sys:idType").item(0).getTextContent());
			createAccount.setAccountType(doc.getElementsByTagName("sys:accountType").item(0).getTextContent());
			long accountNumber = accountNumberCreation();
			response = "The account Numer " + accountNumber + " has been created for account type "
					+ createAccount.getIdType() + " for client " + createAccount.getId() + ".";
		}else if(txType.getNodeName().equals(cancelAccountString)) {
			CancelAccountStratus cancelAccount = new CancelAccountStratus();
			cancelAccount.setAccountNumber(Long.parseLong(doc.getElementsByTagName("sys:accountNumber").item(0).getTextContent()));
			cancelAccount.setReasondId(doc.getElementsByTagName("sys:reasonId").item(0).getTextContent());
			cancelAccount.setDescription(doc.getElementsByTagName("sys:description").item(0).getTextContent());
			response = "The account Numer " + cancelAccount.getAccountNumber() + " has been canceled for reason id "
					+ cancelAccount.getReasondId() + " because" + cancelAccount.getDescription() + ".";
		}
		else {
			response = "OPERATION NOT KNOWN";			
		}

		System.out.println(response);
	}

	public long accountNumberCreation() {
		long accountNumber = (long) (Math.random() * 100000 + 3333300000L);
		return accountNumber;
	}

}
