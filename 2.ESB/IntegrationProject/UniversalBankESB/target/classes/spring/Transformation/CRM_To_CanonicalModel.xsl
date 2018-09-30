<?xml version="1.0" encoding="UTF-8" ?>
<?oracle-xsl-mapper <!-- SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. -->
  <mapSources>
    <source type="XSD">
      <schema location="../schemas/xsd/CRM/universal-bank-business-events.xsd"/>
      <rootElement name="CRMBusinessEvent" namespace="http://universal-bank/crm/enterprise-model/framework/1.0.0"/>
    </source>
  </mapSources>
  <mapTargets>
    <target type="XSD">
      <schema location="../schemas/xsd/CanonicalModel/common-business-domains.xsd"/>
      <rootElement name="BusinessEvent" namespace="http://universalBank.com/schema/businessdomain/v1-0"/>
    </target>
  </mapTargets>
  <!-- GENERATED BY ORACLE XSL MAPPER 11.1.1.9.0(build 180108.1454) AT [WED SEP 26 20:29:27 COT 2018]. -->
?>
<xsl:stylesheet version="1.0"
	xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
	xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
	xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:cus="http://www.oracle.com/XSL/Transform/java/oracle.fabric.common.xml.xpath.DomainValueMapper"
	xmlns:ns3="http://universal-bank/crm/enterprise-model/framework/common-artifacts/1.0.0"
	xmlns:customer-v1-0="http://universalBank.com/schema/businessdomain/customer/v1-0"
	xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions"
	xmlns:cross="http://www.oracle.com/XSL/Transform/java/oracle.fabric.common.xml.xpath.CrossReferences"
	xmlns:ora="http://schemas.oracle.com/xpath/extension"
	xmlns:common-v1-0="http://universalBank.com/schema/businessdomain/common/v1-0"
	xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
	xmlns:ns1="http://universal-bank/crm/enterprise-model/framework/1.0.0"
	xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
	xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
	xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
	xmlns:par="http://www.oracle.com/XSL/Transform/java/oracle.fabric.common.xml.xpath.ParameterValueManager"
	xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
	xmlns:med="http://schemas.oracle.com/mediator/xpath"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
	xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
	xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
	xmlns:xsd="http://www.w3.org/2001/XMLSchema"
	xmlns:ns0="http://universalBank.com/schema/businessdomain/v1-0"
	xmlns:ns2="http://universal-bank/crm/enterprise-model/framework/domain-events/1.0.0"
	xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap"
	exclude-result-prefixes="xsi xsl ns3 ns1 xsd ns2 customer-v1-0 common-v1-0 ns0 bpws xp20 bpel cus bpm cross ora socket mhdr oraext dvm par hwf med ids xdk xref ldap">
	<xsl:template match="/">
		<ns0:body>
			<xsl:for-each
				select="/ns1:CRMBusinessEvent/ns1:enterpriseOperationEventObject/ns1:financialActionDomainObject">
				<ns0:BusinessEvent>
					<ns0:RequestMetadata>
						<requestID>
							<xsl:value-of
								select="/ns1:CRMBusinessEvent/ns1:eventHeader/ns1:eventID" />
						</requestID>
						<systemID>
							<xsl:value-of
								select="/ns1:CRMBusinessEvent/ns1:eventHeader/ns1:sourceSystem" />
						</systemID>
						<sourceID>
							<xsl:value-of
								select="/ns1:CRMBusinessEvent/ns1:eventHeader/ns1:eventChannel" />
						</sourceID>
					</ns0:RequestMetadata>
					<xsl:if test='name(ns1:financialActionDomainEvents)'>
						<ns0:BusinessEventRequest>
							<ns0:customer>
								<customer-v1-0:name>
									<xsl:value-of
										select="/ns1:CRMBusinessEvent/ns1:enterpriseOperationEventObject/ns1:customerInfo/ns1:fullName" />
								</customer-v1-0:name>
								<customer-v1-0:id>
									<xsl:value-of
										select="/ns1:CRMBusinessEvent/ns1:enterpriseOperationEventObject/ns1:customerInfo/ns1:id" />
								</customer-v1-0:id>
								<customer-v1-0:isCompany>
									<xsl:value-of
										select="/ns1:CRMBusinessEvent/ns1:enterpriseOperationEventObject/ns1:customerInfo/ns1:isACompany" />
								</customer-v1-0:isCompany>
								<customer-v1-0:lineNumber>
									<xsl:value-of
										select="/ns1:CRMBusinessEvent/ns1:enterpriseOperationEventObject/ns1:branchOfficeInfo/ns1:lineNumber" />
								</customer-v1-0:lineNumber>
							</ns0:customer>
							<ns0:products>
								<xsl:for-each
									select="ns1:financialProduct/ns1:enterpriseProductsDomainEvents/*">
									<xsl:if
										test='contains(name(.),"ChekingAccountDomainEvent") or contains(name(.),"SavingAccountDomainEvent")'>

										<ns0:accounts>
											<ns0:account>
												<customer-v1-0:accountNumber>
													<xsl:value-of select="ns2:accountNumber" />
												</customer-v1-0:accountNumber>

												<customer-v1-0:accountType>
													<xsl:value-of
														select="/ns1:CRMBusinessEvent/ns1:enterpriseOperationEventObject/ns1:financialActionDomainObject/ns1:financialProduct/ns1:type" />
												</customer-v1-0:accountType>
												<customer-v1-0:founds>
													<xsl:value-of select="ns2:initialFunds" />
												</customer-v1-0:founds>
											</ns0:account>
											<ns0:operation>
												<customer-v1-0:operationType>
													<xsl:value-of select="name(.)" />
												</customer-v1-0:operationType>
												<customer-v1-0:operationId>
													<xsl:value-of
														select="/ns1:CRMBusinessEvent/ns1:enterpriseOperationEventObject/@enterpriseOperationKey" />
												</customer-v1-0:operationId>
											</ns0:operation>
											<ns0:date>
												<customer-v1-0:date>
													<xsl:value-of
														select="/ns1:CRMBusinessEvent/ns1:eventHeader/ns1:eventCreationTime" />
												</customer-v1-0:date>
											</ns0:date>
										</ns0:accounts>
									</xsl:if>
									<xsl:if test='contains(name(.),"CardDomainEvent")'>
										<ns0:cards>
											<ns0:account>
												<customer-v1-0:accountNumber>
													<xsl:value-of select="ns2:accountNumber" />
												</customer-v1-0:accountNumber>
												<customer-v1-0:accountType>
													<xsl:value-of
														select="/ns1:CRMBusinessEvent/ns1:enterpriseOperationEventObject/ns1:financialActionDomainObject/ns1:financialProduct/ns1:type" />
												</customer-v1-0:accountType>
												<customer-v1-0:cardType>
													<xsl:value-of select="ns2:cardType" />
												</customer-v1-0:cardType>
											</ns0:account>
											<ns0:operation>
												<customer-v1-0:operationType>
													<xsl:value-of select="name(.)" />
												</customer-v1-0:operationType>
												<customer-v1-0:operationId>
													<xsl:value-of
														select="/ns1:CRMBusinessEvent/ns1:enterpriseOperationEventObject/@enterpriseOperationKey" />
												</customer-v1-0:operationId>
											</ns0:operation>
											<ns0:date>
												<customer-v1-0:date>
													<xsl:value-of
														select="/ns1:CRMBusinessEvent/ns1:eventHeader/ns1:eventCreationTime" />
												</customer-v1-0:date>
											</ns0:date>
										</ns0:cards>
									</xsl:if>
									<xsl:if test='contains(name(.),"LoanDomainEvent")'>
										<ns0:loans>
											<ns0:account>
												<customer-v1-0:accountNumber>
													<xsl:value-of select="ns2:loanNumber" />
												</customer-v1-0:accountNumber>
												<customer-v1-0:founds>
													<xsl:value-of select="ns2:requestedAmount" />
												</customer-v1-0:founds>
												<customer-v1-0:quota>
													<xsl:value-of select="ns2:fees" />
												</customer-v1-0:quota>
												<customer-v1-0:accountType>
													<xsl:value-of
														select="/ns1:CRMBusinessEvent/ns1:enterpriseOperationEventObject/ns1:financialActionDomainObject/ns1:financialProduct/ns1:type" />
												</customer-v1-0:accountType>
											</ns0:account>
											<ns0:operation>
												<customer-v1-0:operationType>
													<xsl:value-of select="name(.)" />
												</customer-v1-0:operationType>
												<customer-v1-0:operationId>
													<xsl:value-of
														select="/ns1:CRMBusinessEvent/ns1:enterpriseOperationEventObject/@enterpriseOperationKey" />
												</customer-v1-0:operationId>
											</ns0:operation>
											<ns0:date>
												<customer-v1-0:date>
													<xsl:value-of
														select="/ns1:CRMBusinessEvent/ns1:eventHeader/ns1:eventCreationTime" />
												</customer-v1-0:date>
											</ns0:date>
										</ns0:loans>
									</xsl:if>
								</xsl:for-each>
							</ns0:products>
							<ns0:service>
								<xsl:for-each
									select="ns1:financialService/ns1:enterpriseServicesDomainEvents/*">
									<xsl:if test='contains(name(.),"execute")'>
										<ns0:Payment>
											<xsl:if test="ns2:sourceAccountNumber">
												<ns0:account>
													<customer-v1-0:accountNumber>
														<xsl:value-of
															select="ns2:sourceAccountNumber" />
													</customer-v1-0:accountNumber>
													<customer-v1-0:accountType>
														<xsl:value-of select="ns2:sourceAccountType" />
													</customer-v1-0:accountType>
												</ns0:account>
											</xsl:if>
											<ns0:targetAccount>
												<xsl:if test="ns2:targetBankCode">
													<customer-v1-0:bankCode>
														<xsl:value-of select="ns2:targetBankCode" />
													</customer-v1-0:bankCode>
												</xsl:if>
												<xsl:if test="ns2:clearingHouseCode">
													<customer-v1-0:bankCode>
														<xsl:value-of select="ns2:clearingHouseCode" />
													</customer-v1-0:bankCode>
												</xsl:if>
												<customer-v1-0:accountNumber>
													<xsl:value-of select="ns2:targetAccountNumber" />
												</customer-v1-0:accountNumber>
												<customer-v1-0:accountType>
													<xsl:value-of select="ns2:targetAccountType" />
												</customer-v1-0:accountType>
											</ns0:targetAccount>
											<ns0:operation>
												<customer-v1-0:operationType>
													<xsl:value-of
														select="/ns1:CRMBusinessEvent/ns1:enterpriseOperationEventObject/ns1:financialActionDomainObject/ns1:financialService/ns1:type" />
												</customer-v1-0:operationType>
												<customer-v1-0:transactionType>
													<xsl:value-of
														select="/ns1:CRMBusinessEvent/ns1:enterpriseOperationEventObject/ns1:financialActionDomainObject/ns1:financialService/ns1:enterpriseServicesDomainEvents/ns2:cancelDomainEvent/ns2:operationIdentifier" />
												</customer-v1-0:transactionType>
												<customer-v1-0:operationId>
													<xsl:value-of
														select="/ns1:CRMBusinessEvent/ns1:enterpriseOperationEventObject/@enterpriseOperationKey" />
												</customer-v1-0:operationId>
											</ns0:operation>
											<ns0:payment>
												<xsl:if test="ns2:value">
													<customer-v1-0:value>
														<xsl:value-of select="ns2:value" />
													</customer-v1-0:value>
												</xsl:if>
												<xsl:if test="ns2:cashValue">
													<customer-v1-0:value>
														<xsl:value-of select="ns2:cashValue" />
													</customer-v1-0:value>
												</xsl:if>
											</ns0:payment>
											<ns0:date>
												<customer-v1-0:date>
													<xsl:value-of
														select="/ns1:CRMBusinessEvent/ns1:eventHeader/ns1:eventCreationTime" />
												</customer-v1-0:date>
											</ns0:date>
										</ns0:Payment>
									</xsl:if>
								</xsl:for-each>
							</ns0:service>
						</ns0:BusinessEventRequest>
					</xsl:if>
				</ns0:BusinessEvent>
			</xsl:for-each>
		</ns0:body>
	</xsl:template>
</xsl:stylesheet>
