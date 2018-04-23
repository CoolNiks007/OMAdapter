<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="no"/>

<xsl:template match="/|comment()|processing-instruction()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
</xsl:template>

<xsl:template match="ListOfOrderItemAttributes">
 <xsl:element name="OrderEntry-ChildLineItem">
                           <xsl:element name="ProductType">BlockService</xsl:element>
                           <xsl:element name="Product">BlockService</xsl:element>
                           <xsl:element name="XAClassName">Blocker</xsl:element>
              </xsl:element>
 <xsl:element name="OrderEntry-ChildLineItem">
                           <xsl:element name="ProductType">BlockAccount</xsl:element>
                           <xsl:element name="Product">BlockAccount</xsl:element>
                           <xsl:element name="XAClassName">Blocker</xsl:element>
              </xsl:element>
<xsl:element name="ListOfOrderItemAttributes">
        <xsl:apply-templates select="@*|node()"/>
              </xsl:element>
</xsl:template>

<xsl:template match="*">
    <xsl:element name="{local-name()}">
      <xsl:apply-templates select="@*|node()"/>
    </xsl:element>
</xsl:template>

<xsl:template match="@*">
    <xsl:attribute name="{local-name()}">
      <xsl:value-of select="."/>
    </xsl:attribute>
</xsl:template>
</xsl:stylesheet>


