<!DOCTYPE xsl:stylesheet PUBLIC 'http://www.w3.org/1999/XSL/Transform'
      'http://blackmesatech.com/lib/xslt10.dtd' [
<!ATTLIST xsl:stylesheet
  xmlns:xsl CDATA "http://www.w3.org/1999/XSL/Transform" 
  xmlns:ts  CDATA #IMPLIED
  xmlns:xl  CDATA #IMPLIED
  xmlns:xhtml CDATA #IMPLIED
>

<!ENTITY rArr   "&#x21D2;" ><!--/Rightarrow A: =implies-->

]>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ts ="http://www.w3.org/XML/2004/xml-schema-test-suite/"
  xmlns:xl ="http://www.w3.org/1999/xlink"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
>
 <!--* xsts.xsl:  simple formatting for XML Schema test suite 
     * and test set documents.
     * 
     * Copyright &copy; 2010 World Wide Web Consortium,
     * (Massachusetts Institute of Technology, European Research Consortium for
     * Informatics and Mathematics, Keio University). All Rights Reserved. This
     * work is distributed under the W3C&reg; Document License [1] in the hope that
     * it will be useful, but WITHOUT ANY WARRANTY; without even the implied
     * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
     *
     * [1] http://www.w3.org/Consortium/Legal/2002/copyright-documents-20021231
     */
     *-->

 <!--* Written for W3C by 2010 Black Mesa Technologies LLC *-->

 <!--* Fallback rule (show unexpected elements in red) *-->
 <xsl:template match="*">
  <xsl:element name="div">
   <xsl:attribute name="class">unknown</xsl:attribute>
   <xsl:value-of select="concat('&lt;', name(), '>')"/>
   <xsl:apply-templates/>
   <xsl:value-of select="concat('&lt;/', name(), '>')"/>
  </xsl:element>
 </xsl:template>

 <!--* Root (set up HTML document) *-->
 <xsl:template match="/">
  <xsl:element name="html">
   <xsl:element name="head">
    <xsl:element name="title">
     <xsl:choose>
      <xsl:when test="ts:testSuite/@name">
       <xsl:value-of select="concat('Test suite ', /ts:testSuite/@name)"/>
      </xsl:when>
      <xsl:when test="ts:testSuite">
       <xsl:value-of select="concat('Test set ',/ts:testset/@name)"/>
      </xsl:when>
      <xsl:otherwise>XML Schema test suite info</xsl:otherwise>
     </xsl:choose>
    </xsl:element>
    <xsl:element name="link">
     <xsl:attribute name="rel">stylesheet</xsl:attribute>
     <xsl:attribute name="href">./ancillary/xsts.css</xsl:attribute>
    </xsl:element>
    <xsl:element name="style">
     <xsl:attribute name="type">text/css</xsl:attribute>
     div.unknown {
       margin-left: 1em;
       color: red;
     }
    </xsl:element>
   </xsl:element>

  <xsl:element name="body">
    <xsl:apply-templates/>
  </xsl:element>
  </xsl:element>
 </xsl:template>

 <!--* testSuite as root (emit headers) *-->
 <xsl:template match="/ts:testSuite">
  <xsl:element name="h1">
   <xsl:value-of select="concat('Test suite:  ', @name)"/>
  </xsl:element>
  <xsl:apply-templates select="@schemaVersion"/>
  <xsl:apply-templates select="@releaseDate"/>
  <xsl:element name="hr"/>
  <xsl:apply-templates/>
 </xsl:template>

 <xsl:template match="ts:testSuite/@schemaVersion">
  <xsl:element name="h2">
   <xsl:value-of select="concat('For XSD ', .)"/>
  </xsl:element>
 </xsl:template>

 <xsl:template match="ts:testSuite/@releaseDate">
  <xsl:element name="h2">
   <xsl:value-of select="concat('Release date: ', .)"/>
  </xsl:element>
 </xsl:template>

 <!--* test set references:  hyperlink *-->
 <xsl:template match="ts:testSetRef">
  <xsl:element name="p">
   <xsl:text>Test set:  </xsl:text>
   <xsl:element name="a">
    <xsl:attribute name="href"><xsl:value-of select="@xl:href"/></xsl:attribute>
    <xsl:value-of select="@xl:href"/>
   </xsl:element>
  </xsl:element>
 </xsl:template>

 <!--* testSet as root (emit headers) *-->
 <xsl:template match="/ts:testSet">
  <xsl:element name="h1">
   <xsl:value-of select="concat('Test set:  ', @name)"/>
  </xsl:element>
  <xsl:apply-templates select="@contributor"/>
  <xsl:element name="hr"/>
  <xsl:if test="./ts:testGroup">
   <xsl:element name="ul">
    <xsl:apply-templates select="./ts:testGroup" mode="toc"/>
   </xsl:element>
   <xsl:element name="hr"/>
  </xsl:if>
  <xsl:apply-templates/>
 </xsl:template>

 <xsl:template match="ts:testSet/@contributor">
  <xsl:element name="h2">
   <xsl:value-of select="concat('Contributed by: ', .)"/>
  </xsl:element>
 </xsl:template>

 <xsl:template match="ts:testSet/ts:testGroup" mode="toc">
  <xsl:element name="li">
   <xsl:element name="a">
    <xsl:attribute name="href">#<xsl:value-of select="@name"/></xsl:attribute>
    <xsl:value-of select="concat('Test group ', ./@name)"/>
   </xsl:element>
  </xsl:element>
 </xsl:template>

 <!--* testGroup *-->
 <xsl:template match="ts:testSet/ts:testGroup">
  <xsl:element name="div">
   <xsl:attribute name="id"><xsl:value-of select="@name"/></xsl:attribute>
   <xsl:attribute name="class">testGroup</xsl:attribute>
   <xsl:element name="h2">
    <xsl:value-of select="concat('Test group ', ./@name)"/>
   </xsl:element>
   <xsl:element name="div">
    <xsl:attribute name="class">testlist</xsl:attribute>
    <xsl:apply-templates/>
   </xsl:element>
  </xsl:element>
 </xsl:template>

 <!--* documentation references:  hyperlink *-->
 <xsl:template match="ts:documentationReference">
  <xsl:element name="p">
   <xsl:attribute name="class">docref</xsl:attribute>
   <xsl:text>See external documentation at: </xsl:text>
   <xsl:element name="a">
    <xsl:attribute name="href"><xsl:value-of select="@xl:href"/></xsl:attribute>
    <xsl:value-of select="@xl:href"/>
   </xsl:element>
  </xsl:element>
 </xsl:template>

 <xsl:template match="ts:schemaTest | ts:instanceTest">
  <xsl:apply-templates select="ts:expected"/>
 </xsl:template>

 <!--* schema test: show result and documents *-->
 <xsl:template match="ts:schemaTest/ts:expected">
  <xsl:variable name="expected-result">
   <xsl:choose>
    <xsl:when test="parent::*/@implDe = 'true' or parent::*/@impleDe = 1">
     <xsl:text>indeterminate</xsl:text>
    </xsl:when>
    <xsl:otherwise>
     <xsl:value-of select="./@validity"/>
    </xsl:otherwise>
   </xsl:choose>
  </xsl:variable>
  <xsl:variable name="explicit-versions" 
   select="normalize-space(ancestor-or-self::ts:*[@version][1]/@version)"/>
  <xsl:variable name="applicable-versions">
   <xsl:choose>
    <xsl:when test="$explicit-versions = ''">
     <xsl:text>all versions</xsl:text>
    </xsl:when>
    <xsl:when test="contains($explicit-versions,' ')">
     <xsl:value-of select="concat('versions in {',translate($explicit-versions,' ',','),'}')"/>
    </xsl:when>
    <xsl:otherwise>
     <xsl:value-of select="concat('version ',$explicit-versions)"/>
    </xsl:otherwise>
   </xsl:choose>
  </xsl:variable>

  <xsl:element name="p">
   <xsl:attribute name="class">
    <xsl:value-of select="$expected-result"/>
    <xsl:text> schemaTest</xsl:text>
   </xsl:attribute>

   <xsl:value-of select="concat('For ',$applicable-versions,', schema ')"/>
   <xsl:element name="span">
    <xsl:attribute name="class">schema-name</xsl:attribute>
    <xsl:value-of select="../@name"/>
   </xsl:element>
   <xsl:text> (constructed from </xsl:text>
   <xsl:apply-templates select="../ts:schemaDocument"/>
   <xsl:text>) </xsl:text>
   <xsl:choose>
    <xsl:when test="$expected-result = 'valid'">
     <xsl:text>is a conforming schema.</xsl:text>
    </xsl:when>
    <xsl:when test="$expected-result = 'invalid'">
     <xsl:text>is </xsl:text>
     <xsl:element name="em">not</xsl:element>
     <xsl:text> a conforming schema.</xsl:text>
    </xsl:when>
    <xsl:when test="$expected-result = 'notKnown'">
     <xsl:text>has validity </xsl:text>
     <xsl:element name="code">notKnown</xsl:element>
     <xsl:text>. (This makes no sense; possible error in catalog?</xsl:text>
    </xsl:when>
    <xsl:when test="$expected-result = 'indeterminate'">
     <xsl:text>has indeterminate status.</xsl:text>
     <xsl:text>Its conformance is either unspecified, contradictory, implementation-defined, or implementation-dependent.</xsl:text>
    </xsl:when>
    <xsl:otherwise>has no expected result specified in this catalog.</xsl:otherwise>
   </xsl:choose>
  </xsl:element>
  
  <xsl:choose>
   <xsl:when test="$expected-result = 'valid'">
    <xsl:element name="p">
     <xsl:text>This schema is used for all instance tests in this test group, for XSD </xsl:text>
     <xsl:value-of select="$applicable-versions"/>
     <xsl:text>.</xsl:text>
    </xsl:element>
   </xsl:when>
   <xsl:when test="$expected-result = 'invalid'">
    <xsl:element name="p">
     <xsl:text>Because this schema is non-conforming, </xsl:text>
     <xsl:text>any instance tests in this test group for XSD </xsl:text>
     <xsl:value-of select="$applicable-versions"/>
     <xsl:text> would be meaningless and should not be run.</xsl:text>
    </xsl:element>
   </xsl:when>
   <xsl:otherwise>
    <xsl:element name="p">
     <xsl:text>If the processor being tested finds this a conforming schema, </xsl:text>
     <xsl:text>it should use this schema for all instance tests </xsl:text>
     <xsl:text>in this test group for XSD </xsl:text>
     <xsl:value-of select="$applicable-versions"/>
     <xsl:text>. If the processr finds this schema to be non-conforming, </xsl:text>
     <xsl:text>the instance tests </xsl:text>
     <xsl:text>would be meaningless and should not be run.</xsl:text>
    </xsl:element>
   </xsl:otherwise>
   </xsl:choose>

 </xsl:template>

 <!--* schema or instance document:  hyperlink *-->
 <xsl:template match="ts:schemaDocument | ts:instanceDocument">
  <xsl:if test="self::ts:schemaDocument and preceding-sibling::ts:schemaDocument">
   <xsl:text> + </xsl:text>
  </xsl:if>
  <xsl:element name="span">
   <xsl:attribute name="class">
    <xsl:value-of select="name()"/>
   </xsl:attribute>
   <xsl:element name="a">
    <xsl:attribute name="href"><xsl:value-of select="@xl:href"/></xsl:attribute>
    <xsl:value-of select="@xl:href"/>
   </xsl:element>
  </xsl:element>
 </xsl:template>

 <!--* instance test: show result and documents *-->
 <xsl:template match="ts:instanceTest/ts:expected">
  <xsl:variable name="expected-result">
   <xsl:choose>
    <xsl:when test="(parent::*/@implDe = 'true') or (parent::*/@implDe = 1)">
     <xsl:text>indeterminate</xsl:text>
    </xsl:when>
    <xsl:otherwise>
     <xsl:value-of select="./@validity"/>
    </xsl:otherwise>
   </xsl:choose>
  </xsl:variable>
  <xsl:variable name="explicit-versions" 
   select="normalize-space(ancestor-or-self::ts:*[@version][1]/@version)"/>
  <xsl:variable name="applicable-versions">
   <xsl:choose>
    <xsl:when test="$explicit-versions = ''">
     <xsl:text>all versions</xsl:text>
    </xsl:when>
    <xsl:when test="contains($explicit-versions,' ')">
     <xsl:value-of select="concat('versions in {',translate($explicit-versions,' ',','),'}')"/>
    </xsl:when>
    <xsl:otherwise>
     <xsl:value-of select="concat('version ',$explicit-versions)"/>
    </xsl:otherwise>
   </xsl:choose>
  </xsl:variable>

  <xsl:element name="p">
   <xsl:attribute name="class">
    <xsl:value-of select="$expected-result"/>
    <xsl:text> instanceTest</xsl:text>
   </xsl:attribute>

   <xsl:value-of select="concat('For ',$applicable-versions,', instance test ')"/>
   <xsl:element name="span">
    <xsl:attribute name="class">instance-test-name</xsl:attribute>
    <xsl:value-of select="../@name"/>
   </xsl:element>
   <xsl:text> (</xsl:text>
   <xsl:apply-templates select="../ts:instanceDocument"/>
   <xsl:text>) </xsl:text>
   <xsl:choose>
    <xsl:when test="$expected-result = 'indeterminate'">
     <xsl:text>has indeterminate validity.  </xsl:text>
     <xsl:text>(Its validity is either unspecified, contradictory, implementation-defined, or implementation-dependent.)</xsl:text>
    </xsl:when>
    <xsl:when test="contains(' valid invalid notKnown ', $expected-result)">
     <xsl:text>expects [validity] = </xsl:text>
     <xsl:element name="code">
      <xsl:value-of select="$expected-result"/>
     </xsl:element>
     <xsl:text> on the root element.</xsl:text>
    </xsl:when>
    <xsl:otherwise>has no expected result specified in this catalog.</xsl:otherwise>
   </xsl:choose>
  </xsl:element>
 </xsl:template>


 <!--* Anotations *-->
 <xsl:template match="ts:annotation">
  <xsl:element name="div">
   <xsl:attribute name="class">annotation</xsl:attribute>
   <!--*
   <xsl:if test="not(./ts:documentation//*[@class='bodytext'])">
    <xsl:element name="h3">Annotation</xsl:element>
   </xsl:if>
   *-->
   <xsl:element name="div">
    <xsl:choose>
     <xsl:when test="./ts:documentation//*[@class='bodytext']">
      <!--* if the schema document is already using class=bodytext,
          * let the schema author control the margins, don't 
          * assign the class here.
          *-->
     </xsl:when>
     <xsl:otherwise>
      <xsl:attribute name="class">bodytext</xsl:attribute>
     </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates/>
   </xsl:element>
  </xsl:element>
 </xsl:template>

 <xsl:template match="ts:documentation">
  <xsl:choose>
   <xsl:when test=".//xhtml:* or .//div or .//p or .//li">
    <xsl:copy-of select="*"/>
   </xsl:when>
   <xsl:when test="./*">
    <xsl:message>! Unrecognized children in xs:documentation element</xsl:message>
    <xsl:copy-of select="*"/>
   </xsl:when>
   <xsl:otherwise>
    <xsl:call-template name="break-pcdata">
     <xsl:with-param name="s" select="string(.)"/>
    </xsl:call-template>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>

 <xsl:template name="break-pcdata">
  <xsl:param name="s"></xsl:param>

  <xsl:choose>
   <xsl:when test="starts-with($s,'&#xA;')">
    <xsl:text>&#xA;</xsl:text>
    <xsl:element name="br"/>
    <xsl:call-template name="break-pcdata">
     <xsl:with-param name="s" select="substring($s,2)"/>
    </xsl:call-template>
   </xsl:when>
   <xsl:when test="starts-with($s,' ')">
    <xsl:text>&#xA0;</xsl:text>
    <xsl:call-template name="break-pcdata">
     <xsl:with-param name="s" select="substring($s,2)"/>
    </xsl:call-template>
   </xsl:when>
   <xsl:when test="contains($s,'&#xA;')">
    <xsl:value-of select="substring-before($s,'&#xA;')"/>
    <xsl:text>&#xA;</xsl:text>
    <xsl:element name="br"/>
    <xsl:call-template name="break-pcdata">
     <xsl:with-param name="s" select="substring-after($s,'&#xA;')"/>
    </xsl:call-template>
   </xsl:when>
   <xsl:otherwise>
    <xsl:value-of select="$s"/>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>



</xsl:stylesheet>
<!-- Keep this comment at the end of the file
Local variables:
mode: xml
sgml-default-dtd-file:"/Library/SGML/Public/Emacs/xslt.ced"
sgml-omittag:t
sgml-shorttag:t
sgml-indent-data:t
sgml-indent-step:1
End:
-->
