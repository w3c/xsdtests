<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:t="http://www.w3.org/XML/2004/xml-schema-test-suite/"
  xmlns:c="http://www.w3.org/XML/Group/Schemas/TestSuite1_1"
  xmlns:x="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="xlink t c">

  <!-- report on state of coverage of XSD 1.1 test suite -->
  <!-- invocation:
       saxon -xsl:coverage-report.xsl -s:XSD1_1TestCategories.xml -o:coverage-report.html -it:main
  --> 
  <!-- Parameter supplying the document containing the list of test categories -->  
  
  <xsl:param name="testCategoriesDoc" select="doc('XSD1_1TestCategories.xml')" as="document-node()"/>

  <!-- Parameter supplying the top-level test catalogue -->

  <xsl:param name="suiteDoc" select="doc('../suite.xml')" as="document-node()"/>

  <!-- The subsidiary .testset test catalogues referenced from the master catalogue -->

  <xsl:variable name="testSets" select="document($suiteDoc//@xlink:href)"/>

  <!-- The tests within these test cataogues that include a reference to the list of XSD 1.1 test categories -->

  <xsl:variable name="docRefs" select="$testSets//t:documentationReference[contains(@xlink:href, 'XSD1_1TestCategories')]"/>

  <!-- entry point to the stylesheet -->

  <xsl:template name="main">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
	<link href="http://www.w3.org/StyleSheets/public.css" rel="stylesheet" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js" 
		type="text/javascript"></script>
	<script type="text/javascript">
	  $(document).ready( function() {

	    $("body")
              .children("ol")
              .children("li")
	      .children("ol")
              .hide()
	    .end()
            .click(function() {
	      $(this).children("ol").slideToggle("slow");
	    });
	  
	  });
	</script>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>XML Schema 1.1 Test Suite Coverage</title>
	<style>	
	  ol.auto-gen {
	    counter-reset:numsection; 
	    list-style-type: none; 
	  }
	  ol.auto-gen li.auto-gen:before { 
	    counter-increment: numsection; 
	    content: counters(numsection, ".") " "; 
	  }
	  
	  /* level two goal for test suite:  some tests for each
	  category of each feature */
	  li.zero { background-color: #F99; }
	  li.nonzero { background-color: #8FC; }
	  li.mixed { background-color: #FE8; }
	  
	  /* Categories within features have their own rules */
	  li * li.zero { background-color: #F99; }
	  li * li.nonzero { background-color: #8FC; }
	  li * li.mixed { background-color: #FE8; }

	  /* level one goal for test suite:  some tests for each feature 
	  li.zero { background-color: #F99; }
	  li.nonzero { background-color: #8FC; }
	  li.mixed { background-color: #8FC; }
	  */
	  /* at level one, categories within features just follow the feature
	  li.zero * li { background-color: #F99; }
	  li.nonzero * li { background-color: #8FC; }
	  li.mixed * li { background-color: #8FC; }
	   */
	</style>
      </head>
      <body>
	<p>
	  <a href="/">
	    <img width="72" height="48" alt="W3C" src="http://www.w3.org/Icons/WWW/w3c_home.gif" style="border:0;"/>
	  </a>
	  <a href="http://www.w3.org/UbiWeb/" rel="in-domain">
	    <img src="http://www.w3.org/Icons/ubi212" alt="Ubiquitous Web Domain" height="48" width="212"/>
	  </a>
	  <a rel="in-area" href="http://www.w3.org/XML">XML</a>
	</p>
	<div style="text-align:center; margin-top:60px;">
	  <h1 style="text-align: center;">XML Schema 1.1 Test Suite Coverage</h1>
	</div>
	<p>The list below shows the categories to which XSD 1.1 tests
	are assigned, and the number of tests currently in each
	category.  The figure for a parent category is the sum of the
	figures for its sub-categories; any tests that are not
	assigned explicitly to a subcategory are listed in a
	subcategory called "miscellaneous".</p>
	<p>Categories marked ID involve implementation-defined
	behavior.</p>
	<ol class="auto-gen">    
	  <xsl:apply-templates select="$testCategoriesDoc"/>
        </ol>
        
        <p><b>Total number of categorized tests: <xsl:value-of select="count($docRefs/../(t:schemaTest, t:instanceTest))"/></b></p>
        <p><b>Total number of XSD 1.1 specific tests: <xsl:value-of select="count($docRefs/../(t:schemaTest, t:instanceTest) | $testSets//(t:schemaTest, t:instanceTest)[ancestor-or-self::*/@version='1.1'])"/></b></p>
    
    
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="c:test-feature">
    
    <xsl:variable name="countMisc" 
		  select="count($docRefs[ends-with(@xlink:href, current()/@name)]/../(t:schemaTest, t:instanceTest))"/>
    <xsl:variable name="countSubs" select="sum(
        for $c in c:feature-category 
        return count($docRefs[ends-with(@xlink:href, $c/@name)]/../(t:schemaTest, t:instanceTest))
      )"/>
    <xsl:variable name="someZeroSubs" select="
        some $c in c:feature-category 
        satisfies
        count($docRefs[ends-with(@xlink:href, $c/@name)]) eq 0
      "/>
    <xsl:variable name="classname">
      <xsl:choose>
	<xsl:when test="($countMisc + $countSubs > 0) and not($someZeroSubs)">
	  <xsl:text>nonzero</xsl:text>
	</xsl:when>
	<xsl:when test="($countMisc + $countSubs > 0) and $someZeroSubs">
	  <xsl:text>mixed</xsl:text>
	</xsl:when>
	<xsl:when test="($countMisc + $countSubs = 0)">
	  <xsl:text>zero</xsl:text>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:message>Unexpected count results for <xsl:value-of select="@name"/></xsl:message>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <li xmlns="http://www.w3.org/1999/xhtml"
	class="{concat($classname, ' auto-gen')}" 
	id="{@name}">
      <xsl:value-of select="@description"/>
      <xsl:text/> (<xsl:value-of select="$countMisc + $countSubs"/>) <xsl:text/>
      <ol class="auto-gen">
	<xsl:apply-templates/>
        <xsl:if test="$countMisc ne 0">
	<li class="auto-gen" id="{@name}-countMiscellaneous">miscellaneous (<xsl:value-of select="$countMisc"/>)</li>
      </xsl:if>
      </ol>
    </li>
  </xsl:template>

  <xsl:template match="c:feature-category">
    <xsl:variable name="ct" 
      select="count($docRefs[ends-with(@xlink:href, current()/@name)]/../(t:schemaTest, t:instanceTest))"/>
    <xsl:variable name="classname">
      <xsl:choose>
	<xsl:when test="$ct > 0">
	  <xsl:text>nonzero</xsl:text>
	</xsl:when>
	<xsl:when test="$ct = 0">
	  <xsl:text>zero</xsl:text>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:message>Unexpected count results for <xsl:value-of select="@name"/></xsl:message>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    
    <li xmlns="http://www.w3.org/1999/xhtml" 
      class="{concat($classname, ' auto-gen')}" 
      id="{@name}">
      <xsl:value-of select="."/>
      <xsl:text/> (<xsl:value-of select="count($docRefs[ends-with(@xlink:href, current()/@name)]/../(t:schemaTest, t:instanceTest))"/>) <xsl:text/>
    </li>
  </xsl:template>

</xsl:stylesheet>