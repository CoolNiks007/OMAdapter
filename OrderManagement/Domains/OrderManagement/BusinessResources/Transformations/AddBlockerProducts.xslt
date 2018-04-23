<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="no" encoding="UTF-8"/>
	<xsl:template match="/|comment()|processing-instruction()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="ListOfChildItem">
		<xsl:element name="{local-name()}">
			<xsl:apply-templates select="@*|node()"/>
			<!--- <xsl:element name="ChildItem">
				<xsl:element name="ProductName">BlockService</xsl:element>
				<xsl:element name="ProductType">Blocker</xsl:element>
				<xsl:element name="RootItemId"><xsl:value-of select="../ItemId"/></xsl:element>
			</xsl:element>
			<xsl:element name="ChildItem">
				<xsl:element name="ProductName">BlockAccount</xsl:element>
				<xsl:element name="ProductType">Blocker</xsl:element>
				<xsl:element name="RootItemId"><xsl:value-of select="../ItemId"/></xsl:element>
			</xsl:element> -->
		</xsl:element>
	</xsl:template>
	<xsl:template match="*">
		<xsl:element name="{local-name()}">
			<xsl:apply-templates select="@*|node()"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="@*">
		<xsl:attribute name="{local-name()}"><xsl:value-of select="."/></xsl:attribute>
	</xsl:template>
</xsl:stylesheet>
