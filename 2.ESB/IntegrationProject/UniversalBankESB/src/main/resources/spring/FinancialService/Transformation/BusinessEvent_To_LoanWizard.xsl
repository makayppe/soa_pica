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
			test='contains(/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:products/ns0:loans/ns0:operation/customer-v1-0:operationType/text(),"add")'>
			<SQL-SP>
				<xsl:value-of
					select='concat("BEGIN PR_CREATE_LOAN (&apos;01&apos;,&apos;",/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:customer/customer-v1-0:id/text(),"&apos;,&apos;01&apos;,&apos;",/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:products/ns0:loans/ns0:account/customer-v1-0:founds,"&apos;, &apos;Prueba de Prestamo&apos;);COMMIT;END;")' />
			</SQL-SP>
		</xsl:if>
		<xsl:if
			test='contains(/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:products/ns0:loans/ns0:operation/customer-v1-0:operationType/text(),"cancel")'>
			<SQL-SP>
				<xsl:value-of
					select='concat("BEGIN PR_CANCEL_LOAN (&apos;",/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:customer/customer-v1-0:id,"&apos;,&apos;1142&apos;);COMMIT;END")' />
			</SQL-SP>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>


