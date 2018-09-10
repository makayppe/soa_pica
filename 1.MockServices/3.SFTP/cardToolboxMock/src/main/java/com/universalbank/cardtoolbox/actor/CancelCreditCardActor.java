package com.universalbank.cardtoolbox.actor;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Service;

import com.universalbank.cardtoolbox.message.CancelCreditCardRQ;
import com.universalbank.cardtoolbox.message.CancelCreditCardRS;

@Service
public class CancelCreditCardActor extends AbstractActor<CancelCreditCardRQ> {

	/**
	 * 
	 * @param line
	 * @return
	 */
	protected CancelCreditCardRQ transform(String line) {
		CancelCreditCardRQ messageRQ = new CancelCreditCardRQ();
		messageRQ.setBranchOfficeNumber(line.substring(0, 7));
		messageRQ.setCardNumber(line.substring(7, 23));
		messageRQ.setDate(line.substring(23, 42));		
		messageRQ.setOperationId(line.substring(42, 46));		
		return messageRQ;
	}

	@Override
	public InputStream write(List<CancelCreditCardRQ> listMessageRQ) {

		CancelCreditCardRS messageRS = null;
		InputStream inputStream = null;
		StringBuffer buffer = new StringBuffer();
		
		for (CancelCreditCardRQ rq : listMessageRQ) {
			messageRS = new CancelCreditCardRS();			
			messageRS.setDate(dateTimeFormatter.format(LocalDateTime.now()));
			messageRS.setOperationId(rq.getOperationId());
			messageRS.setStatus("CANCELED");			

			buffer.append(messageRS.getStatus());
			buffer.append(messageRS.getDate());
			buffer.append(messageRS.getOperationId());
			buffer.append("\n");			
		}
		
		inputStream = new ByteArrayInputStream(buffer.toString().getBytes());
		return inputStream;
	}

}
