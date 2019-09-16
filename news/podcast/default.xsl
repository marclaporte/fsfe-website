<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:dt="http://xsltsl.org/date-time"
  exclude-result-prefixes="dt">
 
  <xsl:import href="../../fsfe.xsl" />
  <xsl:output method="html" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat" />

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
