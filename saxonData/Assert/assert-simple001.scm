<?xml version="1.0" encoding="UTF-8"?>
<scm:schema xmlns:scm="http://ns.saxonica.com/schema-component-model"
            generatedAt="2018-02-12T18:15:38.474Z"
            xsdVersion="1.1">
   <scm:simpleType id="C0" base="#date" variety="atomic" primitiveType="#date">
      <scm:assert>
         <scm:assertion xmlns:xs="http://www.w3.org/2001/XMLSchema"
                        test="$value lt current-date()"
                        defaultNamespace=""
                        xml:base="file:/Users/mike/w3c/xsd-tests/saxonData/Assert/assert-simple001.xsd"/>
      </scm:assert>
   </scm:simpleType>
   <scm:element id="C1"
                name="date"
                type="C0"
                global="true"
                nillable="false"
                abstract="false"/>
   <scm:element id="C2"
                name="outer"
                type="C3"
                global="true"
                nillable="false"
                abstract="false"/>
   <scm:complexType id="C3"
                    base="#anyType"
                    derivationMethod="restriction"
                    abstract="false"
                    variety="element-only">
      <scm:elementParticle minOccurs="1" maxOccurs="unbounded" ref="C1"/>
      <scm:finiteStateMachine initialState="0">
         <scm:state nr="0">
            <scm:edge term="C1" to="1"/>
         </scm:state>
         <scm:state nr="1" final="true">
            <scm:edge term="C1" to="2"/>
         </scm:state>
         <scm:state nr="2" final="true">
            <scm:edge term="C1" to="2"/>
         </scm:state>
      </scm:finiteStateMachine>
   </scm:complexType>
</scm:schema>
<?Σ 47605ca8?>
