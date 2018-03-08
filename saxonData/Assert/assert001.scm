<?xml version="1.0" encoding="UTF-8"?>
<scm:schema xmlns:scm="http://ns.saxonica.com/schema-component-model"
            generatedAt="2018-02-12T18:27:16.129Z"
            xsdVersion="1.1">
   <scm:element id="C0"
                name="temp"
                type="C1"
                global="true"
                nillable="false"
                abstract="false"/>
   <scm:complexType id="C1"
                    base="#anyType"
                    derivationMethod="restriction"
                    abstract="false"
                    variety="empty">
      <scm:attributeUse required="true" inheritable="false" ref="C2"/>
      <scm:attributeUse required="false" inheritable="false" ref="C3"/>
      <scm:finiteStateMachine initialState="0">
         <scm:state nr="0" final="true"/>
      </scm:finiteStateMachine>
      <scm:assertion xmlns:xs="http://www.w3.org/2001/XMLSchema"
                     test="@x &gt; 300"
                     defaultNamespace=""
                     xml:base="file:/Users/mike/w3c/xsd-tests/saxonData/Assert/assert001.xsd"/>
   </scm:complexType>
   <scm:attribute id="C3"
                  name="y"
                  type="#anySimpleType"
                  global="false"
                  inheritable="false"
                  containingComplexType="C1"/>
   <scm:attribute id="C2"
                  name="x"
                  type="#anySimpleType"
                  global="false"
                  inheritable="false"
                  containingComplexType="C1"/>
</scm:schema>
<?Σ 57ce7994?>
