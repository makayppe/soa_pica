<xsl:stylesheet version="1.0"
	xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
	xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
	xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
	xmlns:sys="http://StratusAccount/systems"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:cus="http://www.oracle.com/XSL/Transform/java/oracle.fabric.common.xml.xpath.DomainValueMapper"
	xmlns:customer-v1-0="http://universalBank.com/schema/businessdomain/customer/v1-0"
	xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions"
	xmlns:cross="http://www.oracle.com/XSL/Transform/java/oracle.fabric.common.xml.xpath.CrossReferences"
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
	xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap"
	exclude-result-prefixes="xsi xsl customer-v1-0 common-v1-0 xsd ns0 sys bpws xp20 bpel cus bpm cross ora socket mhdr oraext dvm par hwf med ids xdk xref ldap">

	<xsl:template match="/">
		<xsl:if
			test='contains(/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:products/ns0:cards/ns0:operation/customer-v1-0:operationType/text(),"cancel")'>
			<xsl:if
				test='/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:products/ns0:cards/ns0:account/customer-v1-0:cardType/text()="DEBIT"'>
				<FTP_PLAIN_TEXT>
					<xsl:value-of
						select="concat(format-number(/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:customer/customer-v1-0:id, '000000'),substring(concat(/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:customer/customer-v1-0:name, '                                        '), 1, 40),format-number(2300043430030403, '0000000000000000'),substring(concat(/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:customer/customer-v1-0:lineNumber, '       '), 1, 7),substring(concat(/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:customer/customer-v1-0:isCompany , '     '), 1, 5), /ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:products/ns0:cards/ns0:date/customer-v1-0:date,substring(concat(/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:products/ns0:cards/ns0:operation/customer-v1-0:operationId , '    '), 1, 4))" />
				</FTP_PLAIN_TEXT>
			</xsl:if>
			<xsl:if
				test='/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:products/ns0:cards/ns0:account/customer-v1-0:cardType/text()="CREDIT"'>
				<FTP_PLAIN_TEXT>
					<xsl:value-of
						select="concat(format-number(/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:customer/customer-v1-0:id, '000000'), substring(concat(/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:customer/customer-v1-0:name, '                                        '), 1, 40), substring(concat(/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:customer/customer-v1-0:lineNumber, '       '), 1, 7), substring(concat(/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:customer/customer-v1-0:isCompany , '     '), 1, 5), format-number(/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:customer/customer-v1-0:id, '00000000'), substring(concat(/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:products/ns0:cards/ns0:account/customer-v1-0:franchise, '                    '), 1, 4), substring(concat(/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:products/ns0:cards/ns0:account/customer-v1-0:cardType, '          '), 1, 4), /ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:products/ns0:cards/ns0:date/customer-v1-0:date, substring(concat(/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:products/ns0:cards/ns0:operation/customer-v1-0:operationId , '    '), 1, 4))" />
				</FTP_PLAIN_TEXT>
			</xsl:if>
		</xsl:if>
		<xsl:if
			test='contains(/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:products/ns0:cards/ns0:operation/customer-v1-0:operationType/text(),"cancel")'>
			<xsl:if
				test='/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:products/ns0:cards/ns0:account/customer-v1-0:cardType/text()="DEBIT"'>
				<FTP_PLAIN_TEXT>
					<xsl:value-of
						select="concat(substring(concat(/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:customer/customer-v1-0:lineNumber, '       '), 1, 7), '1234567812345678', /ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:products/ns0:cards/ns0:date/customer-v1-0:date, substring(concat(/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:products/ns0:cards/ns0:operation/customer-v1-0:operationId , '    '), 1, 4))" />
				</FTP_PLAIN_TEXT>
			</xsl:if>
			<xsl:if
				test='/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:products/ns0:cards/ns0:account/customer-v1-0:cardType/text()="CREDIT"'>
				<FTP_PLAIN_TEXT>
					<xsl:value-of
						select="concat(substring(concat(/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:customer/customer-v1-0:lineNumber, '       '), 1, 7), '1234567812345678', /ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:products/ns0:cards/ns0:date/customer-v1-0:date, substring(concat(/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:products/ns0:cards/ns0:operation/customer-v1-0:operationId , '    '), 1, 4))" />
				</FTP_PLAIN_TEXT>
			</xsl:if>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>


