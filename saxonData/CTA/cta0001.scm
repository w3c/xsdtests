<?xml version="1.0" encoding="UTF-8"?>
<scm:schema xmlns:scm="http://ns.saxonica.com/schema-component-model"
            generatedAt="2018-02-13T00:36:54.177Z"
            xsdVersion="1.1">
   <scm:simpleType id="C0" base="#string" variety="atomic" primitiveType="#string"/>
   <scm:simpleType id="C1" base="#string" variety="atomic" primitiveType="#string">
      <scm:enumeration value="date"/>
      <scm:enumeration value="string"/>
      <scm:enumeration value="base64"/>
      <scm:enumeration value="XML"/>
      <scm:enumeration value="xml"/>
      <scm:enumeration value="binary"/>
      <scm:enumeration value="time"/>
   </scm:simpleType>
   <scm:simpleType id="C2" base="C3" variety="atomic" primitiveType="#time"/>
   <scm:simpleType id="C4"
                   base="#anySimpleType"
                   variety="union"
                   memberTypes="C1 C0"/>
   <scm:simpleType id="C5" base="#string" variety="atomic" primitiveType="#string"/>
   <scm:simpleType id="C3" base="#time" variety="atomic" primitiveType="#time"/>
   <scm:complexType id="C6"
                    name="messageTypeString"
                    base="C7"
                    derivationMethod="restriction"
                    abstract="false"
                    variety="simple"
                    simpleType="C8">
      <scm:attributeUse required="false" inheritable="false" ref="C9"/>
   </scm:complexType>
   <scm:simpleType id="C10"
                   base="#base64Binary"
                   variety="atomic"
                   primitiveType="#base64Binary"/>
   <scm:complexType id="C7"
                    name="messageType"
                    base="#anyType"
                    derivationMethod="restriction"
                    abstract="false"
                    variety="mixed">
      <scm:attributeUse required="false" inheritable="false" ref="C9"/>
      <scm:attributeWildcard ref="C11"/>
      <scm:elementWildcard minOccurs="0" maxOccurs="unbounded" ref="C12"/>
      <scm:finiteStateMachine initialState="0">
         <scm:state nr="0" final="true">
            <scm:edge term="C12" to="1"/>
         </scm:state>
         <scm:state nr="1" final="true">
            <scm:edge term="C12" to="1"/>
         </scm:state>
      </scm:finiteStateMachine>
   </scm:complexType>
   <scm:complexType id="C13"
                    name="messageTypeXML"
                    base="C7"
                    derivationMethod="restriction"
                    abstract="false"
                    variety="element-only">
      <scm:attributeUse required="false" inheritable="false" ref="C9"/>
      <scm:elementWildcard minOccurs="1" maxOccurs="1" ref="C14"/>
      <scm:finiteStateMachine initialState="0">
         <scm:state nr="0">
            <scm:edge term="C14" to="1"/>
         </scm:state>
         <scm:state nr="1" final="true"/>
      </scm:finiteStateMachine>
   </scm:complexType>
   <scm:complexType id="C15"
                    name="messageTypeDate"
                    base="C7"
                    derivationMethod="restriction"
                    abstract="false"
                    variety="simple"
                    simpleType="C16">
      <scm:attributeUse required="false" inheritable="false" ref="C9"/>
   </scm:complexType>
   <scm:complexType id="C17"
                    name="messageTypeTime"
                    base="C7"
                    derivationMethod="restriction"
                    abstract="false"
                    variety="simple"
                    simpleType="C2">
      <scm:attributeUse required="false" inheritable="false" ref="C9"/>
   </scm:complexType>
   <scm:simpleType id="C8" base="C5" variety="atomic" primitiveType="#string"/>
   <scm:complexType id="C18"
                    name="messageTypeBase64"
                    base="C7"
                    derivationMethod="restriction"
                    abstract="false"
                    variety="simple"
                    simpleType="C19">
      <scm:attributeUse required="false" inheritable="false" ref="C9"/>
   </scm:complexType>
   <scm:simpleType id="C16" base="C20" variety="atomic" primitiveType="#date"/>
   <scm:simpleType id="C19"
                   base="C10"
                   variety="atomic"
                   primitiveType="#base64Binary"/>
   <scm:simpleType id="C20" base="#date" variety="atomic" primitiveType="#date"/>
   <scm:element id="C21"
                name="messages"
                type="C22"
                global="true"
                nillable="false"
                abstract="false"/>
   <scm:element id="C23"
                name="message"
                type="C7"
                global="true"
                nillable="false"
                abstract="false">
      <scm:alternativeType xmlns:xs="http://www.w3.org/2001/XMLSchema"
                           test="@kind='string'"
                           type="C6"
                           defaultNamespace=""
                           xml:base="file:/Users/mike/w3c/xsd-tests/saxonData/CTA/cta0001.xsd"/>
      <scm:alternativeType xmlns:xs="http://www.w3.org/2001/XMLSchema"
                           test="@kind='base64'"
                           type="C18"
                           defaultNamespace=""
                           xml:base="file:/Users/mike/w3c/xsd-tests/saxonData/CTA/cta0001.xsd"/>
      <scm:alternativeType xmlns:xs="http://www.w3.org/2001/XMLSchema"
                           test="@kind='binary'"
                           type="C18"
                           defaultNamespace=""
                           xml:base="file:/Users/mike/w3c/xsd-tests/saxonData/CTA/cta0001.xsd"/>
      <scm:alternativeType xmlns:xs="http://www.w3.org/2001/XMLSchema"
                           test="@kind='date'"
                           type="C15"
                           defaultNamespace=""
                           xml:base="file:/Users/mike/w3c/xsd-tests/saxonData/CTA/cta0001.xsd"/>
      <scm:alternativeType xmlns:xs="http://www.w3.org/2001/XMLSchema"
                           test="@kind='time'"
                           type="C17"
                           defaultNamespace=""
                           xml:base="file:/Users/mike/w3c/xsd-tests/saxonData/CTA/cta0001.xsd"/>
      <scm:alternativeType xmlns:xs="http://www.w3.org/2001/XMLSchema"
                           test="@kind='xml'"
                           type="C13"
                           defaultNamespace=""
                           xml:base="file:/Users/mike/w3c/xsd-tests/saxonData/CTA/cta0001.xsd"/>
      <scm:alternativeType xmlns:xs="http://www.w3.org/2001/XMLSchema"
                           test="@kind='XML'"
                           type="C13"
                           defaultNamespace=""
                           xml:base="file:/Users/mike/w3c/xsd-tests/saxonData/CTA/cta0001.xsd"/>
   </scm:element>
   <scm:attribute id="C9"
                  name="kind"
                  type="C4"
                  global="false"
                  inheritable="false"
                  containingComplexType="C7"/>
   <scm:wildcard id="C14" processContents="strict" constraint="any"/>
   <scm:complexType id="C22"
                    base="#anyType"
                    derivationMethod="restriction"
                    abstract="false"
                    variety="element-only">
      <scm:elementParticle minOccurs="1" maxOccurs="unbounded" ref="C23"/>
      <scm:finiteStateMachine initialState="0">
         <scm:state nr="0">
            <scm:edge term="C23" to="1"/>
         </scm:state>
         <scm:state nr="1" final="true">
            <scm:edge term="C23" to="2"/>
         </scm:state>
         <scm:state nr="2" final="true">
            <scm:edge term="C23" to="2"/>
         </scm:state>
      </scm:finiteStateMachine>
   </scm:complexType>
   <scm:wildcard id="C11" processContents="skip" constraint="any"/>
   <scm:wildcard id="C12" processContents="skip" constraint="any"/>
</scm:schema>
<?Σ f3a93fa2?>
