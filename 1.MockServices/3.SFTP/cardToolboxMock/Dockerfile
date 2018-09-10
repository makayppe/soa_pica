FROM openjdk

#ENV FTP_USERNAME=universalbank
#ENV FTP_PASSWORD=universalbank
#ENV FTP_CLIENT_RATE=60000
#ENV FTP_HOST=localhost
#ENV FTP_PORT=2121

WORKDIR /app

COPY  build/libs/cardToolboxMock-*.jar cardToolboxMock.jar

CMD ["java", "-jar", "cardToolboxMock.jar"]