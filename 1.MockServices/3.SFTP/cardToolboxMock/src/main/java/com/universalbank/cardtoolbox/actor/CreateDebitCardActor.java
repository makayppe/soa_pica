package com.universalbank.cardtoolbox.actor;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Service;

import com.universalbank.cardtoolbox.message.CreateDebitCardRQ;
import com.universalbank.cardtoolbox.message.CreateDebitCardRS;
import com.universalbank.cardtoolbox.util.Util;

@Service
public class CreateDebitCardActor extends AbstractActor<CreateDebitCardRQ> {
	
	/**
	 * 
	 * @param line
	 * @return
	 */
	protected CreateDebitCardRQ transform(String line) {
		CreateDebitCardRQ messageRQ = new CreateDebitCardRQ();
		messageRQ.setId(line.substring(0,6));
		messageRQ.setCardholder(line.substring(6,46));
		messageRQ.setAccountNumber(line.substring(46,62));
		messageRQ.setBranchOfficeNumber(line.substring(62,69));
		messageRQ.setIsCompany(line.substring(69,74));
		messageRQ.setDate(line.substring(74,93));
		messageRQ.setOperationId(line.substring(93,97));		
		return messageRQ;
	}

	@Override
	public InputStream write(List<CreateDebitCardRQ> listMessageRQ) {
		CreateDebitCardRS messageRS = null;
		InputStream inputStream = null;
		StringBuffer buffer = new StringBuffer();
		
		for (CreateDebitCardRQ rq : listMessageRQ) {
			messageRS = new CreateDebitCardRS();			
			messageRS.setCardholder(Util.padLeft(rq.getCardholder(), 30));
			messageRS.setCardNumber(Util.randomChar(16));
			messageRS.setValidThru("0523");
			messageRS.setFranchise(Util.padLeft(Util.generateFranchise(), 20));
			messageRS.setIssuingDate(dateFormatter.format(LocalDateTime.now()));
			messageRS.setOperationId(rq.getOperationId());			
			
			buffer.append(messageRS.getCardholder());
			buffer.append(messageRS.getCardNumber());
			buffer.append(messageRS.getValidThru());
			buffer.append(messageRS.getFranchise());
			buffer.append(messageRS.getIssuingDate());
			buffer.append(messageRS.getOperationId());
			buffer.append("\n");			
		}
		inputStream = new ByteArrayInputStream(buffer.toString().getBytes());
		return inputStream;
	}

}
