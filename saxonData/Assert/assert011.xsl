<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

<xsl:import-schema schema-location="assert011.xsd"/>

<xsl:template name="main">
<twice>
  <xsl:copy-of select="doc('assert011.v1.xml')" validation="strict"/>
  <xsl:copy-of select="doc('assert011.v1.xml')" validation="strict"/>
</twice>  
</xsl:template>

</xsl:stylesheet>