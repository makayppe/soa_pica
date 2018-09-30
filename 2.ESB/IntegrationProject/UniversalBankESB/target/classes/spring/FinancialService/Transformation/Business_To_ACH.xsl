<xsl:stylesheet version="1.0"
	xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
	xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
	xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:cus="http://www.oracle.com/XSL/Transform/java/oracle.fabric.common.xml.xpath.DomainValueMapper"
	xmlns:customer-v1-0="http://universalBank.com/schema/businessdomain/customer/v1-0"
	xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions"
	xmlns:cross="http://www.oracle.com/XSL/Transform/java/oracle.fabric.common.xml.xpath.CrossReferences"
	xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
	xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
	xmlns:ora="http://schemas.oracle.com/xpath/extension"
	xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
	xmlns:common-v1-0="http://universalBank.com/schema/businessdomain/common/v1-0"
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
	xmlns:sys="http://LocalPayments/systems"
	xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap"
	exclude-result-prefixes="xsi xsl customer-v1-0 common-v1-0 xsd ns0 soap wsdl sys bpws xp20 bpel cus bpm cross ora socket mhdr oraext dvm par hwf med ids xdk xref ldap">
	<xsl:template match="/">
		<crearPago>
			<value>
				<xsl:value-of
					select="/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:service/ns0:Payment/ns0:payment/customer-v1-0:value" />
			</value>
			<sourceAccountNumber>
				<xsl:value-of
					select="/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:service/ns0:Payment/ns0:account/customer-v1-0:accountNumber" />
			</sourceAccountNumber>
			<sourceAccountType>
				<xsl:value-of
					select="/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:service/ns0:Payment/ns0:account/customer-v1-0:accountType" />
			</sourceAccountType>
			<targetBankCode>
				<xsl:value-of
					select="/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:service/ns0:payment/ns0:account/customer-v1-0:bankCode" />
			</targetBankCode>
			<targetAccountNumber>
				<xsl:value-of
					select="/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:service/ns0:Payment/ns0:targetAccount/customer-v1-0:accountNumber" />
			</targetAccountNumber>
			<targetAccountType>
				<xsl:value-of
					select="/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:service/ns0:Payment/ns0:targetAccount/customer-v1-0:accountType" />
			</targetAccountType>
			<operationIdentifier>
				<xsl:value-of
					select="/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:service/ns0:Payment/ns0:operation/customer-v1-0:operationId" />
			</operationIdentifier>
		</crearPago>
	</xsl:template>
</xsl:stylesheet>
