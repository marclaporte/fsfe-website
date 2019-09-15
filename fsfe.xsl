<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:dt="http://xsltsl.org/date-time"
  exclude-result-prefixes="dt"
  xmlns:str="http://exslt.org/strings"
  extension-element-prefixes="str">

  <xsl:import href="build/xslt/gettext.xsl" />
  <xsl:import href="tools/xsltsl/static-elements.xsl" />
  <xsl:import href="tools/xsltsl/tagging.xsl" />

  <xsl:import href="build/xslt/fsfe_head.xsl" />
  <xsl:import href="build/xslt/fsfe_body.xsl" />

  <!-- For pages used on external web servers, load the CSS from absolute URL -->
  <xsl:variable name="urlprefix">
    <xsl:if test="/buildinfo/document/@external">https://fsfe.org</xsl:if>
  </xsl:variable>

  <xsl:include href="build/xslt/fsfe_document.xsl" />
  <xsl:include href="build/xslt/fsfe_headings.xsl" />
  <xsl:include href="build/xslt/fsfe_localmenu.xsl" />

  <!-- Do not copy non-HTML elements to output -->
  <xsl:include href="build/xslt/fsfe_nolocal.xsl" />

  <!-- HTML 5 compatibility doctype, since our XSLT parser doesn't support disabling output escaping -->
  <xsl:output method="html" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat" />

  <!-- Ignore "latin" tags, used only for printable material -->
  <xsl:template match="latin">
    <xsl:apply-templates select="@*|node()"/>
  </xsl:template>
  
 <!--FIXME ↓-->
  <xsl:template match="fetch-news">
    <xsl:call-template name="fetch-news">
      <xsl:with-param name="tag" select="'/buildinfo/document/sidebar/@news'"/>
      <xsl:with-param name="nb-items" select="4"/>
    </xsl:call-template>
  </xsl:template>
  
  <!-- Static elements which can be included everywhere -->
  <xsl:template match="static-element">
    <xsl:variable name="id"><xsl:value-of select="@id"/></xsl:variable>
    <xsl:copy-of select="/buildinfo/document/set/element[@id=$id]/node()" />
  </xsl:template>

  <!-- Podcast audio player for both MP3 and OGG -->
  <xsl:template match="audio-player">
    <xsl:element name="audio">
      <xsl:attribute name="controls" />
      <xsl:attribute name="style">width:100%;</xsl:attribute>
      <!-- OGG -->
      <xsl:element name="source">
        <xsl:attribute name="src">
          <xsl:value-of select="/buildinfo/document/podcast/ogg/url" />
        </xsl:attribute>
        <xsl:attribute name="type">audio/ogg</xsl:attribute>
      </xsl:element>
      <!-- MP3 -->
      <xsl:element name="source">
        <xsl:attribute name="src">
          <xsl:value-of select="/buildinfo/document/podcast/mp3/url" />
        </xsl:attribute>
        <xsl:attribute name="type">audio/mp3</xsl:attribute>
      </xsl:element>
      <xsl:text>Your browser dows not support the audio element.</xsl:text>
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>
