<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:import href="../fsfe.xsl" />
  <xsl:output method="html" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat" />

  <!-- Fill dynamic content -->
  <xsl:template match="dynamic-content">
    <xsl:variable name="type"><xsl:value-of select="@type"/></xsl:variable>

    <xsl:for-each select="/buildinfo/document/set/item [@type = $type]">
      <xsl:sort select="@order" order="ascending"/>
      
      <!-- Full Item -->
      <xsl:element name="div">
        <xsl:attribute name="class">left break margin-vertical</xsl:attribute>
        
        <xsl:variable name="id"><xsl:value-of select="@id"/></xsl:variable>
        <xsl:variable name="year"><xsl:value-of select="@year"/></xsl:variable>

        <!-- Name -->
        <xsl:element name="p">
          <xsl:attribute name="id"><xsl:value-of select="$id"/></xsl:attribute>
          <xsl:element name="strong">
            <xsl:value-of select="/buildinfo/document/set/info[@id=$id]/name" />
          </xsl:element>
        </xsl:element>
        <!-- / Name -->
        
        <!-- Image -->
        <xsl:for-each select="image">
          <!-- <xsl:element name="a">
            <xsl:attribute name="href">
              <xsl:value-of select="@imglarge" />
            </xsl:attribute>
            <xsl:attribute name="title">
              <xsl:value-of select="/buildinfo/document/set/info[@id=$id]/name" />
            </xsl:attribute> -->
          
            <xsl:element name="img">
              <xsl:attribute name="class">left grid-30</xsl:attribute>
              <xsl:attribute name="src">
                <xsl:value-of select="@imgsmall" />
              </xsl:attribute>
            </xsl:element> <!-- /img -->
          <!-- </xsl:element> --> <!-- /a -->
        </xsl:for-each>
        <!-- /Image -->
        
        <!-- Description -->
        <xsl:element name="p">
          <xsl:attribute name="class">right grid-70</xsl:attribute>
          <xsl:attribute name="style">margin-top:0;</xsl:attribute>
          <xsl:value-of select="/buildinfo/document/set/info[@id=$id]/description" />
        </xsl:element>
        <!-- / Description -->
        
		<!-- Printed version -->
          <xsl:if test="/buildinfo/document/set/info[@id=$id]/printed != ''">
            <xsl:element name="p">
				<xsl:attribute name="class">right grid-70</xsl:attribute>
              <!--<xsl:attribute name="style">font-size:0.8em</xsl:attribute>-->
              <xsl:element name="abbr"> <!-- mouseover info text -->
                <xsl:attribute name="title">
                  <xsl:call-template name="fsfe-gettext"><xsl:with-param name="id" select="'stw-printed-tooltip'" /></xsl:call-template>
                </xsl:attribute>
                <xsl:element name="strong"> <!-- Field name -->
                  <xsl:call-template name="fsfe-gettext"><xsl:with-param name="id" select="'stw-printed'" /></xsl:call-template>
                </xsl:element> <!-- /strong -->
              </xsl:element> <!-- /abbr -->
              <xsl:text>: </xsl:text>
              <xsl:element name="br"></xsl:element>
              <xsl:copy-of select="/buildinfo/document/set/info[@id=$id]/printed" /> <!-- Dynamic value of the field -->
            </xsl:element> <!-- /p -->
            <!--<xsl:element name="br"></xsl:element>-->
          </xsl:if>        
        
        <!-- Details -->
        <xsl:element name="p">
          <xsl:attribute name="class">right grid-70</xsl:attribute>
          
          <!-- Type -->
          <xsl:if test="/buildinfo/document/set/info[@id=$id]/type != ''">
            <xsl:element name="strong">
              <xsl:call-template name="fsfe-gettext"><xsl:with-param name="id" select="'stw-type'" /></xsl:call-template>
              <xsl:text>: </xsl:text>
            </xsl:element>
            <xsl:value-of select="/buildinfo/document/set/info[@id=$id]/type" />
            <xsl:element name="br"></xsl:element>
          </xsl:if>
          
          <!-- Size -->
          <xsl:if test="/buildinfo/document/set/info[@id=$id]/size != ''">
            <xsl:element name="strong">
              <xsl:call-template name="fsfe-gettext"><xsl:with-param name="id" select="'stw-size'" /></xsl:call-template>
              <xsl:text>: </xsl:text>
            </xsl:element>
            <xsl:value-of select="/buildinfo/document/set/info[@id=$id]/size" />
            <xsl:element name="br"></xsl:element>
          </xsl:if>
          
          <!-- Context (e.g Campaign) -->
          <xsl:if test="/buildinfo/document/set/info[@id=$id]/context != ''">
            <xsl:element name="strong">
              <xsl:call-template name="fsfe-gettext"><xsl:with-param name="id" select="'stw-context'" /></xsl:call-template>
              <xsl:text>: </xsl:text>
            </xsl:element>
            <xsl:value-of select="/buildinfo/document/set/info[@id=$id]/context" />
            <xsl:element name="br"></xsl:element>
          </xsl:if>
          
          <!-- Languages -->
          <xsl:if test="/buildinfo/document/set/info[@id=$id]/languages != ''">
            <xsl:element name="span">
              <!--<xsl:attribute name="style">font-size:0.8em</xsl:attribute>-->
              <xsl:element name="abbr"> <!-- mouseover info text -->
                <xsl:attribute name="title">
                  <xsl:call-template name="fsfe-gettext"><xsl:with-param name="id" select="'stw-languages-tooltip'" /></xsl:call-template>
                </xsl:attribute>
                <xsl:element name="strong"> <!-- Field name -->
                  <xsl:call-template name="fsfe-gettext"><xsl:with-param name="id" select="'stw-languages'" /></xsl:call-template>
                </xsl:element> <!-- /strong -->
              </xsl:element> <!-- /abbr -->
              <xsl:text>: </xsl:text>
              <xsl:element name="br"></xsl:element>
              <xsl:copy-of select="/buildinfo/document/set/info[@id=$id]/languages" /> <!-- Dynamic value of the field -->
            </xsl:element> <!-- /span -->
            <xsl:element name="br"></xsl:element>
          </xsl:if>
          
          <!-- License -->
          <xsl:if test="/buildinfo/document/set/info[@id=$id]/license != ''">
            <xsl:element name="strong">
              <xsl:call-template name="fsfe-gettext"><xsl:with-param name="id" select="'stw-license'" /></xsl:call-template>
              <xsl:text>: </xsl:text>
            </xsl:element>
            <xsl:value-of select="/buildinfo/document/set/info[@id=$id]/license" />
            <xsl:element name="br"></xsl:element>
          </xsl:if>
          
          <!-- Author -->
          <xsl:if test="/buildinfo/document/set/info[@id=$id]/author != ''">
            <xsl:element name="strong">
              <xsl:call-template name="fsfe-gettext"><xsl:with-param name="id" select="'stw-author'" /></xsl:call-template>
              <xsl:text>: </xsl:text>
            </xsl:element>
            <xsl:value-of select="/buildinfo/document/set/info[@id=$id]/author" />
            <xsl:element name="br"></xsl:element>
          </xsl:if>
          
          <!-- Year -->
          <xsl:if test="/buildinfo/document/set/info[@id=$id]/year != ''">
            <xsl:element name="strong">
              <xsl:call-template name="fsfe-gettext"><xsl:with-param name="id" select="'stw-year'" /></xsl:call-template>
              <xsl:text>: </xsl:text>
            </xsl:element>
            <xsl:value-of select="$year"/>
            <xsl:element name="br"></xsl:element>
          </xsl:if>
          
          
          <!-- SMALLER TEXT -->
          <!-- Source -->
          <xsl:if test="/buildinfo/document/set/info[@id=$id]/source != ''">
            <xsl:element name="span">
              <xsl:attribute name="style">font-size:0.8em</xsl:attribute>
              <xsl:element name="abbr"> <!-- mouseover info text -->
                <xsl:attribute name="title">
                  <xsl:call-template name="fsfe-gettext"><xsl:with-param name="id" select="'stw-source-tooltip'" /></xsl:call-template>
                </xsl:attribute>
                <xsl:element name="strong"> <!-- Field name -->
                  <xsl:call-template name="fsfe-gettext"><xsl:with-param name="id" select="'stw-source'" /></xsl:call-template>
                </xsl:element> <!-- /strong -->
              </xsl:element> <!-- /abbr -->
              <xsl:text>: </xsl:text>
              <xsl:element name="br"></xsl:element>
              <xsl:copy-of select="/buildinfo/document/set/info[@id=$id]/source" /> <!-- Dynamic value of the field -->
            </xsl:element> <!-- /span -->
            <xsl:element name="br"></xsl:element>
          </xsl:if>
          
          <!-- Printready -->
          <xsl:if test="/buildinfo/document/set/info[@id=$id]/printready != ''">
            <xsl:element name="span">
              <xsl:attribute name="style">font-size:0.8em</xsl:attribute>
              <xsl:element name="abbr"> <!-- mouseover info text -->
                <xsl:attribute name="title">
                  <xsl:call-template name="fsfe-gettext"><xsl:with-param name="id" select="'stw-printready-tooltip'" /></xsl:call-template>
                </xsl:attribute>
                <xsl:element name="strong"> <!-- Field name -->
                  <xsl:call-template name="fsfe-gettext"><xsl:with-param name="id" select="'stw-printready'" /></xsl:call-template>
                </xsl:element> <!-- /strong -->
              </xsl:element> <!-- /abbr -->
              <xsl:text>: </xsl:text>
              <xsl:element name="br"></xsl:element>
              <xsl:copy-of select="/buildinfo/document/set/info[@id=$id]/printready" /> <!-- Dynamic value of the field -->
            </xsl:element> <!-- /span -->
            <xsl:element name="br"></xsl:element>
          </xsl:if>
        
        </xsl:element>
        <!-- / Details -->
        
      </xsl:element>
      <!-- / Full Item -->
        
    </xsl:for-each>
    
  </xsl:template>

</xsl:stylesheet>