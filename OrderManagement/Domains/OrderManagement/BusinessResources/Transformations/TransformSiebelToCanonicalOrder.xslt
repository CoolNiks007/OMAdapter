<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes" encoding="UTF-8"/>
	
	<xsl:param name="DueDate"/>
	<xsl:param name="CreatedBy"/>
	<xsl:param name="OrderValidation"/>
	<xsl:param name="FutureOrder"/>
	<xsl:param name="CategoryAction"/>
	<xsl:param name="BGIndicator"/>
	<xsl:param name="CreatedBySystem"/>
	<xsl:param name="SourceSystem"/>
	<xsl:param name="MasterOrderId"/>
	<xsl:template match="/">
	<xsl:choose>
		<xsl:when test="$OrderValidation = 'Y'">
			<_root>
				<decomposeMessage>
					<OSMOrder>
						<DueDate><xsl:value-of select="$DueDate"/></DueDate>
						<CreatedBy><xsl:value-of select ="$CreatedBy"/></CreatedBy>
						<OrderValidation><xsl:value-of select="$OrderValidation"/></OrderValidation>
						<FutureOrder><xsl:value-of select="$FutureOrder"/></FutureOrder>
						<CategoryAction><xsl:value-of select="$CategoryAction"/></CategoryAction>
						<BGIndicator><xsl:value-of select="$BGIndicator"/></BGIndicator>
						<CreatedBySystem><xsl:value-of select="$CreatedBySystem"/></CreatedBySystem>
						<SourceSystem><xsl:value-of select="$SourceSystem"/></SourceSystem>
						<XMLMessage>
							<xsl:apply-templates select="@*|node()"/>
						</XMLMessage>
					</OSMOrder>
				</decomposeMessage>
			</_root>
		</xsl:when>
		<xsl:otherwise>
			<OSMOrder>
				<DueDate><xsl:value-of select="$DueDate"/></DueDate>
				<CreatedBy><xsl:value-of select ="$CreatedBy"/></CreatedBy>
				<OrderValidation><xsl:value-of select="$OrderValidation"/></OrderValidation>
				<FutureOrder><xsl:value-of select="$FutureOrder"/></FutureOrder>
				<CategoryAction><xsl:value-of select="$CategoryAction"/></CategoryAction>
				<BGIndicator><xsl:value-of select="$BGIndicator"/></BGIndicator>
				<CreatedBySystem><xsl:value-of select="$CreatedBySystem"/></CreatedBySystem>
				<SourceSystem><xsl:value-of select="$SourceSystem"/></SourceSystem>
				<xsl:choose>
					<xsl:when test="string-length($MasterOrderId)>0">
							<MasterOrderId><xsl:value-of select="$MasterOrderId"/></MasterOrderId>
					</xsl:when>
					<xsl:otherwise/>
				</xsl:choose>
				<XMLMessage>
					<xsl:apply-templates select="@*|node()"/>
				</XMLMessage>
			</OSMOrder>
		</xsl:otherwise>
	</xsl:choose>
	</xsl:template>
	<xsl:template match="comment()|processing-instruction()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="*">
		<xsl:choose>
			<xsl:when test="local-name() = 'SiebelMessage'">
				<xsl:apply-templates select="@*|node()"/>
			</xsl:when>
			<xsl:when test="local-name() != 'SiebelMessage' and .!='' ">
				<xsl:element name="{local-name()}">
					<xsl:apply-templates select="@*|node()"/>
				</xsl:element>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="@*">
		<xsl:attribute name="{local-name()}"><xsl:value-of select="."/></xsl:attribute>
	</xsl:template>
	<xsl:template match="text()">
    <xsl:value-of select="normalize-space()" />
</xsl:template>
</xsl:stylesheet>
