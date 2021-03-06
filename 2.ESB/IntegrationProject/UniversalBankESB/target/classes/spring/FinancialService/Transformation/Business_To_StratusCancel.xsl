<?xml version="1.0" encoding="UTF-8" ?>
<?oracle-xsl-mapper
  <!-- SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. -->
  <mapSources>
    <source type="XSD">
      <schema location="../schemas/xsd/CanonicalModel/common-business-domains.xsd"/>
      <rootElement name="BusinessEvent" namespace="http://universalBank.com/schema/businessdomain/v1-0"/>
    </source>
  </mapSources>
  <mapTargets>
    <target type="XSD">
      <schema location="../schemas/xsd/Stratus/StratusAccount.xsd"/>
      <rootElement name="cancelAccount" namespace="http://StratusAccount/systems"/>
    </target>
  </mapTargets>
  <!-- GENERATED BY ORACLE XSL MAPPER 11.1.1.9.0(build 180108.1454) AT [SUN SEP 30 13:06:54 COT 2018]. -->
?>
<xsl:stylesheet version="1.0"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable"
                xmlns:ns2="http://StratusAccount/systems"
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
                exclude-result-prefixes="xsi xsl customer-v1-0 common-v1-0 xsd ns0 ns2 bpws xp20 bpel cus bpm cross ora socket mhdr oraext dvm par hwf med ids xdk xref ldap">
  <xsl:template match="/">
    <ns2:cancelAccount>
      <ns2:request>
        <ns2:accountNumber>
          <xsl:value-of select="/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:products/ns0:accounts/ns0:account/customer-v1-0:accountNumber"/>
        </ns2:accountNumber>
        <ns2:reasonId>
          <xsl:value-of select="/ns0:BusinessEvent/ns0:BusinessEventRequest/ns0:products/ns0:accounts/ns0:operation/customer-v1-0:operationId"/>
        </ns2:reasonId>
        <ns2:description>
          <xsl:text disable-output-escaping="no">CANCELACION CUENTA</xsl:text>
        </ns2:description>
      </ns2:request>
    </ns2:cancelAccount>
  </xsl:template>
</xsl:stylesheet>
