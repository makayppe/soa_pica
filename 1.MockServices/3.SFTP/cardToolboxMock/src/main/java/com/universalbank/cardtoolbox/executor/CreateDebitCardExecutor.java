package com.universalbank.cardtoolbox.executor;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.universalbank.cardtoolbox.actor.AbstractActor;
import com.universalbank.cardtoolbox.message.CreateDebitCardRQ;
import com.universalbank.cardtoolbox.util.ApplicationProperties;
import com.universalbank.cardtoolbox.util.Constant;

@Component
public class CreateDebitCardExecutor {

	private static final Logger logger = LoggerFactory.getLogger(CreateDebitCardExecutor.class);
	private static final DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");

	@Autowired
	private ApplicationProperties properties;

	private FTPClient ftpClient;

	@Autowired
	private AbstractActor<CreateDebitCardRQ> createDebitCardActor;

	@PostConstruct
	public void init() {
		ftpClient = new FTPClient();
	}

	@PreDestroy
	public void destroy() {
		try {
			if (ftpClient.isConnected()) {
				ftpClient.logout();
				ftpClient.disconnect();
			}
		} catch (IOException ex) {
			logger.error("destroy", ex);
		}
	}

	@Scheduled(fixedRateString = "${app.fixedRate}")
	public void scheduleTaskWithFixedRate() {
		logger.info("Fixed Rate Task :: Execution Time - {}", dateTimeFormatter.format(LocalDateTime.now()));
		InputStream inputStream = null;
		InputStream inputStreamRS = null;
		List<CreateDebitCardRQ> listMessageRQ = null;
		try {

			connect();

			FTPFile[] requestList = ftpClient.listFiles(Constant.PATH_DEBIT_CARD_REQUEST);
			String currentFile = null;
			String targetFile = null;
			String renameFile = null;
			for (FTPFile ftpFile : requestList) {
				currentFile = String.format("%s%s", Constant.PATH_DEBIT_CARD_REQUEST, ftpFile.getName());
				targetFile = String.format("%s%s_%s", Constant.PATH_DEBIT_CARD_RESPONSE, ftpFile.getName(),
						dateTimeFormatter.format(LocalDateTime.now()));
				renameFile = String.format("%s%s_%s", Constant.PATH_DEBIT_CARD_PROCESSED, ftpFile.getName(),
						dateTimeFormatter.format(LocalDateTime.now()));

				logger.info("Reading file {} :: Execution Time - {}", currentFile,
						dateTimeFormatter.format(LocalDateTime.now()));

				inputStream = ftpClient.retrieveFileStream(currentFile);
				ftpClient.completePendingCommand();

				if (FTPReply.CANNOT_OPEN_DATA_CONNECTION != ftpClient.getReplyCode()
						&& FTPReply.FILE_UNAVAILABLE != ftpClient.getReplyCode()) {

					if (inputStream != null) {
						listMessageRQ = this.createDebitCardActor.read(inputStream);
						inputStreamRS = this.createDebitCardActor.write(listMessageRQ);
						boolean bool = ftpClient.storeFile(targetFile, inputStreamRS);
						if (bool) {
							logger.info("File transfered :: Execution Time - {}", targetFile,
									dateTimeFormatter.format(LocalDateTime.now()));

							ftpClient.rename(currentFile, renameFile);

							logger.info("Rename file {} to {}", currentFile, renameFile);
						} else {
							logger.info("File not transfered :: Execution Time - {}", targetFile,
									dateTimeFormatter.format(LocalDateTime.now()));
						}
					}
				}
			}
			//ftpClient.completePendingCommand();
		} catch (Exception ex) {
			logger.error("error", ex);
		} finally {
			try {
				if (null != inputStream) {
					inputStream.close();
				}
				if (null != inputStreamRS) {
					inputStreamRS.close();
				}
			} catch (IOException ex) {
				logger.error("finally", ex);
			}
		}
		logger.info("FINISHED :: Execution Time - {}", dateTimeFormatter.format(LocalDateTime.now()));
	}

	private void connect() throws IOException {
		ftpClient.connect(properties.getHostname(), properties.getServerPort());
		if (!FTPReply.isPositiveCompletion(ftpClient.getReplyCode())) {
			ftpClient.disconnect();
			throw new IOException("Exception in connecting to FTP Server");
		}

		ftpClient.login(properties.getUserName(), properties.getPassword());
		ftpClient.enterLocalPassiveMode();
		ftpClient.setFileType(FTP.BINARY_FILE_TYPE, FTP.BINARY_FILE_TYPE);
		ftpClient.setFileTransferMode(FTP.BINARY_FILE_TYPE);
	}

}
