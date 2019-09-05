<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:import href="../tools/xsltsl/static-elements.xsl" />
  <xsl:import href="../fsfe.xsl" />

  <xsl:output method="html" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat" />

  <xsl:template match="/buildinfo/document/body/include-podcast">
    <xsl:apply-templates />

    <!-- $today = current date (given as <html date="...">) -->
    <xsl:variable name="today">
      <xsl:value-of select="/buildinfo/@date" />
    </xsl:variable>

    <xsl:for-each select="/buildinfo/document/set/news[translate(@date,'-','') &lt;= translate($today,'-','')]">
      <xsl:sort select="@date" order="descending"/>
      <p>
        <b><xsl:value-of select="@date" /></b><br/>
        <xsl:value-of select="body"/>
        <xsl:variable name="link"><xsl:value-of select="link"/></xsl:variable>
        <xsl:if test="$link!=''">
          &#160;<a href="{link}" class="learn-more"><xsl:value-of select="/buildinfo/document/text[@id='more']"/></a>
        </xsl:if>
      </p>
    </xsl:for-each>
  </xsl:template>
  
  <!-- TODO: translated sentence "receive-podcast"-->
  <xsl:template match="receive-podcast">
    <xsl:call-template name="gettext">
      <xsl:with-param name="id" select="'receive-podcast'" />
    </xsl:call-template>
  </xsl:template>

</xsl:stylesheet>

