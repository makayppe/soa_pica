package com.universalbank.cardtoolbox.actor;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Service;

import com.universalbank.cardtoolbox.message.CreateCreditCardRQ;
import com.universalbank.cardtoolbox.message.CreateCreditCardRS;
import com.universalbank.cardtoolbox.util.Util;

@Service
public class CreateCreditCardActor extends AbstractActor<CreateCreditCardRQ> {

	/**
	 * 
	 * @param line
	 * @return
	 */
	protected CreateCreditCardRQ transform(String line) {
		CreateCreditCardRQ messageRQ = new CreateCreditCardRQ();
		messageRQ.setId(line.substring(0, 6));
		messageRQ.setCardholder(line.substring(6, 46));
		messageRQ.setBranchOfficeNumber(line.substring(46, 53));
		messageRQ.setIsCompany(line.substring(53, 58));
		messageRQ.setQuota(line.substring(58, 66));
		messageRQ.setFranchise(line.substring(66, 86));
		messageRQ.setCardholder(line.substring(86, 96));
		messageRQ.setDate(line.substring(96, 115));
		messageRQ.setOperationId(line.substring(115, 119));
		
		return messageRQ;
	}

	@Override
	public InputStream write(List<CreateCreditCardRQ> listMessageRQ) {
		
		CreateCreditCardRS messageRS = null;
		InputStream inputStream = null;
		StringBuffer buffer = new StringBuffer();
		
		for (CreateCreditCardRQ rq : listMessageRQ) {
			messageRS = new CreateCreditCardRS();			
			messageRS.setCardholder(rq.getCardholder());
			messageRS.setCardNumber(Util.randomChar(16));
			messageRS.setCardType(rq.getCardType());
			messageRS.setCvc(Util.randomChar(3)); 
			messageRS.setFranchise(rq.getFranchise());
			messageRS.setIssuingDate(dateFormatter.format(LocalDateTime.now()));
			messageRS.setOperationId(rq.getOperationId());
			messageRS.setQuota(rq.getQuota());
			messageRS.setValidThru("0523");

			buffer.append(messageRS.getCardNumber());
			buffer.append(messageRS.getCardholder());
			buffer.append(messageRS.getValidThru());
			buffer.append(messageRS.getCvc());
			buffer.append(messageRS.getFranchise());
			buffer.append(messageRS.getCardType());
			buffer.append(messageRS.getQuota());
			buffer.append(messageRS.getIssuingDate());
			buffer.append(messageRS.getOperationId());
			buffer.append("\n");			
		}
		inputStream = new ByteArrayInputStream(buffer.toString().getBytes());
		return inputStream;
	}

}
