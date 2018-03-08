<?xml version="1.0" encoding="UTF-8"?>
<scm:schema xmlns:scm="http://ns.saxonica.com/schema-component-model">
   <scm:complexType id="C0" name="t3" targetNamespace="http://chess/ns/" base="C1"
                    derivationMethod="extension"
                    abstract="false"
                    variety="element-only">
      <scm:modelGroupParticle minOccurs="1" maxOccurs="1">
         <scm:sequence>
            <scm:modelGroupParticle minOccurs="1" maxOccurs="unbounded">
               <scm:sequence>
                  <scm:elementParticle minOccurs="1" maxOccurs="1" ref="C2"/>
                  <scm:elementParticle minOccurs="0" maxOccurs="1" ref="C3"/>
               </scm:sequence>
            </scm:modelGroupParticle>
            <scm:modelGroupParticle minOccurs="1" maxOccurs="1">
               <scm:sequence>
                  <scm:elementParticle minOccurs="1" maxOccurs="1" ref="C4"/>
               </scm:sequence>
            </scm:modelGroupParticle>
         </scm:sequence>
      </scm:modelGroupParticle>
      <scm:finiteStateMachine initialState="0">
         <scm:state nr="0">
            <scm:edge term="C2" to="1"/>
         </scm:state>
         <scm:state nr="1">
            <scm:edge term="C3" to="2"/>
            <scm:edge term="C4" to="3"/>
            <scm:edge term="C2" to="4"/>
         </scm:state>
         <scm:state nr="2">
            <scm:edge term="C4" to="3"/>
            <scm:edge term="C2" to="4"/>
         </scm:state>
         <scm:state nr="3" final="true"/>
         <scm:state nr="4">
            <scm:edge term="C3" to="5"/>
            <scm:edge term="C4" to="3"/>
            <scm:edge term="C2" to="4"/>
         </scm:state>
         <scm:state nr="5">
            <scm:edge term="C4" to="3"/>
            <scm:edge term="C2" to="4"/>
         </scm:state>
      </scm:finiteStateMachine>
      <scm:assertion xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:chess="http://chess/ns/"
                     test="(every $w in chess:white satisfies not($w/following-sibling::*[1][self::chess:white])) and                        (every $b in chess:black satisfies not($b/following-sibling::*[1][self::chess:black]))"
                     xml:base="file:/c:/tests/xmlschema2006-11-06/saxonData/Assert/assert007.xsd"/>
      <scm:assertion xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:chess="http://chess/ns/"
                     test="count(chess:white[. = 'oo']) lt 2"
                     xml:base="file:/c:/tests/xmlschema2006-11-06/saxonData/Assert/assert007.xsd"/>
      <scm:assertion xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:chess="http://chess/ns/"
                     test="chess:result = ('black wins', 'white wins', 'draw')"
                     xml:base="file:/c:/tests/xmlschema2006-11-06/saxonData/Assert/assert007.xsd"/>
   </scm:complexType>
   <scm:complexType id="C1" name="t2" targetNamespace="http://chess/ns/" base="C5"
                    derivationMethod="restriction"
                    abstract="false"
                    variety="element-only">
      <scm:modelGroupParticle minOccurs="1" maxOccurs="unbounded">
         <scm:sequence>
            <scm:elementParticle minOccurs="1" maxOccurs="1" ref="C2"/>
            <scm:elementParticle minOccurs="0" maxOccurs="1" ref="C3"/>
         </scm:sequence>
      </scm:modelGroupParticle>
      <scm:finiteStateMachine initialState="0">
         <scm:state nr="0">
            <scm:edge term="C2" to="1"/>
         </scm:state>
         <scm:state nr="1" final="true">
            <scm:edge term="C3" to="2"/>
            <scm:edge term="C2" to="3"/>
         </scm:state>
         <scm:state nr="2" final="true">
            <scm:edge term="C2" to="3"/>
         </scm:state>
         <scm:state nr="3" final="true">
            <scm:edge term="C3" to="4"/>
            <scm:edge term="C2" to="3"/>
         </scm:state>
         <scm:state nr="4" final="true">
            <scm:edge term="C2" to="3"/>
         </scm:state>
      </scm:finiteStateMachine>
      <scm:assertion xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:chess="http://chess/ns/"
                     test="(every $w in chess:white satisfies not($w/following-sibling::*[1][self::chess:white])) and                        (every $b in chess:black satisfies not($b/following-sibling::*[1][self::chess:black]))"
                     xml:base="file:/c:/tests/xmlschema2006-11-06/saxonData/Assert/assert007.xsd"/>
      <scm:assertion xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:chess="http://chess/ns/"
                     test="count(chess:white[. = 'oo']) lt 2"
                     xml:base="file:/c:/tests/xmlschema2006-11-06/saxonData/Assert/assert007.xsd"/>
   </scm:complexType>
   <scm:complexType id="C5" name="t1" targetNamespace="http://chess/ns/" base="#anyType"
                    derivationMethod="restriction"
                    abstract="false"
                    variety="element-only">
      <scm:modelGroupParticle minOccurs="1" maxOccurs="unbounded">
         <scm:sequence>
            <scm:elementParticle minOccurs="1" maxOccurs="1" ref="C6"/>
            <scm:elementParticle minOccurs="0" maxOccurs="1" ref="C7"/>
         </scm:sequence>
      </scm:modelGroupParticle>
      <scm:finiteStateMachine initialState="0">
         <scm:state nr="0">
            <scm:edge term="C6" to="1"/>
         </scm:state>
         <scm:state nr="1" final="true">
            <scm:edge term="C7" to="2"/>
            <scm:edge term="C6" to="3"/>
         </scm:state>
         <scm:state nr="2" final="true">
            <scm:edge term="C6" to="3"/>
         </scm:state>
         <scm:state nr="3" final="true">
            <scm:edge term="C7" to="4"/>
            <scm:edge term="C6" to="3"/>
         </scm:state>
         <scm:state nr="4" final="true">
            <scm:edge term="C6" to="3"/>
         </scm:state>
      </scm:finiteStateMachine>
      <scm:assertion xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:chess="http://chess/ns/"
                     test="(every $w in chess:white satisfies not($w/following-sibling::*[1][self::chess:white])) and                        (every $b in chess:black satisfies not($b/following-sibling::*[1][self::chess:black]))"
                     xml:base="file:/c:/tests/xmlschema2006-11-06/saxonData/Assert/assert007.xsd"/>
   </scm:complexType>
   <scm:element id="C8" name="game" targetNamespace="http://chess/ns/" type="C0" global="true"
                nillable="false"
                abstract="false"/>
   <scm:element id="C4" name="result" targetNamespace="http://chess/ns/" type="#string"
                global="false"
                containingComplexType="C0"
                nillable="false"
                abstract="false"/>
   <scm:element id="C3" name="black" targetNamespace="http://chess/ns/" type="#string"
                global="false"
                containingComplexType="C1"
                nillable="false"
                abstract="false"/>
   <scm:element id="C7" name="black" targetNamespace="http://chess/ns/" type="#string"
                global="false"
                containingComplexType="C5"
                nillable="false"
                abstract="false"/>
   <scm:element id="C2" name="white" targetNamespace="http://chess/ns/" type="#string"
                global="false"
                containingComplexType="C1"
                nillable="false"
                abstract="false"/>
   <scm:element id="C6" name="white" targetNamespace="http://chess/ns/" type="#string"
                global="false"
                containingComplexType="C5"
                nillable="false"
                abstract="false"/>
</scm:schema>