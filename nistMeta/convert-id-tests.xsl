<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:t="http://www.w3.org/XML/2004/xml-schema-test-suite/"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   exclude-result-prefixes="t xs xsi"
 >
 
 <!-- This stylesheet was used in June 2010 to modify the tests in this test collection that
      had an element of type xs:ID as the outermost element in the document, following the
      decision on bug #9922 that such documents were invalid. See also bug #9973 against the
      test suite.
      
      The stylesheet takes the file NISTXMLSchemaDataTypes.testSet in this directory as input,
      and modifies all the schema and instance documents with atomic-ID or list-ID in their names,
      changing them to add a wrapper element around the xs:ID, thus removing this invalidity.
      The modified schema and instance documents are written to a new directory (Schema+Instance2),
      which is then manually renamed to replace the original.
 -->
 
<xsl:strip-space elements="*"/>
<xsl:output method="xml" indent="yes"/>

<xsl:template match="/">
  <xsl:for-each select="//t:schemaDocument/@*:href[contains(., 'atomic-ID') or contains(., 'list-ID')]">
      <xsl:apply-templates select="document(.)" mode="schema">
        <xsl:with-param name="href" select="replace(resolve-uri(string(.), static-base-uri()), 'Schema\+Instance', 'Schema+Instance2')"/>
     </xsl:apply-templates>
  </xsl:for-each>
  <xsl:for-each select="//t:instanceDocument/@*:href[contains(., 'atomic-ID') or contains(., 'list-ID')]">
     <xsl:apply-templates select="document(.)" mode="instance">
        <xsl:with-param name="href" select="replace(resolve-uri(string(.), static-base-uri()), 'Schema\+Instance', 'Schema+Instance2')"/>
     </xsl:apply-templates>
  </xsl:for-each>   
</xsl:template>

<xsl:template match="/" mode="instance">
  <xsl:param name="href"/>
  <xsl:result-document href="{$href}">
      <xsl:copy-of select="comment()"/>
      <xsl:text>&#xa;&#xa;</xsl:text>
      <xsl:comment><xsl:value-of select="current-date()"/>: added a wrapper element: see bug 9922</xsl:comment>
      <xsl:text>&#xa;&#xa;</xsl:text>
      <xsl:element name="out" namespace="{namespace-uri(*[1])}">
        <xsl:copy-of select="*[1]/@xsi:schemaLocation"/>
        <xsl:for-each select="*[1]">
            <xsl:copy>
                <xsl:copy-of select="@* except @xsi:schemaLocation"/>
                <xsl:copy-of select="child::node()"/>
            </xsl:copy>
        </xsl:for-each>
      </xsl:element>
  </xsl:result-document>
</xsl:template>

<xsl:template match="*" mode="schema">
  <xsl:param name="href"/>
  <xsl:result-document href="{$href}">
      <xsl:copy>
          <xsl:copy-of select="@*"/>
          <xsl:for-each select="*">
            <xsl:copy-of select="."/>
            <xsl:text>&#xa;&#xa;</xsl:text>
          </xsl:for-each>
          <xsl:comment><xsl:value-of select="current-date()"/>: added a wrapper element: see bug 9922</xsl:comment>
          <xsl:text>&#xa;&#xa;   </xsl:text>
          <element name="out" xmlns="http://www.w3.org/2001/XMLSchema">
            <complexType>
              <sequence>
                <any processContents="strict"/>
              </sequence>
            </complexType>
          </element>
      </xsl:copy>
  </xsl:result-document>
</xsl:template>

<xsl:function name="t:href">
    <xsl:param name="doc" as="node()"/>
    <xsl:sequence select="concat(
        '../nistData/',
        (if (contains(document-uri($doc), 'atomic')) then 'atomic' else 'list'),
        '/ID/Schema+Instance2/',
        tokenize(document-uri($doc), '/')[last()])"/>
</xsl:function>

</xsl:transform>
        