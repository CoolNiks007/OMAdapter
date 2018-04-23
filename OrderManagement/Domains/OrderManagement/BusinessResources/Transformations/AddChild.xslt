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
			<xsl:if test="not(ChildItem)">
			<ChildItem>
					<xsl:Copy-of select="../Action" />
					<xsl:copy-of select="../ActivationSMS" />
					<xsl:copy-of select="../AdapterNumber" />
					<xsl:copy-of select="../AssociatedMemberStatus" />
					<xsl:copy-of select="../BarDate" />
					<xsl:copy-of select="../BarReason" />
					<xsl:copy-of select="../BillAcctCode" />
					<xsl:copy-of select="../BillAcctId" />
					<xsl:copy-of select="../BillingFlg" />
					<xsl:copy-of select="../CancelFlag" />
					<xsl:copy-of select="../CancellationReason" />
					<xsl:copy-of select="../CollectableId" />
					<xsl:copy-of select="../ComponentGroup" />
					<xsl:copy-of select="../ComponentSubType" />
					<xsl:copy-of select="../ComponentType" />
					<xsl:copy-of select="../CoupledICCD" />
					<xsl:copy-of select="../CustAcctCode" />
					<xsl:copy-of select="../CustAcctId" />
					<xsl:copy-of select="../CustomerRepSMS" />
					<xsl:copy-of select="../DataBundlePartNumML" />
					<xsl:copy-of select="../DataFlag" />
					<xsl:copy-of select="../DueDate" />
					<xsl:copy-of select="../DunningSMSFlag" />
					<xsl:copy-of select="../DeactivationSMS" />
					<xsl:copy-of select="../EndDate" />
					<xsl:copy-of select="../IMEI" />
					<xsl:copy-of select="../IMEIList" />
					<xsl:copy-of select="../IntegrationId" />
					<xsl:copy-of select="../ItemId" />
					<xsl:copy-of select="../LineNumber" />
					<xsl:copy-of select="../MSISDNML" />
					<xsl:copy-of select="../ModifyDate" />
					<xsl:copy-of select="../OriginalIntegrationId" />
					<xsl:copy-of select="../OriginalStartDate" />
					<xsl:copy-of select="../ParentIntegrationId" />
					<xsl:copy-of select="../ParentItemId" />
					<xsl:copy-of select="../ParentProductId" />
					<xsl:copy-of select="../PreviousLineItemId" />
					<xsl:copy-of select="../PreviousServiceId" />
					<xsl:copy-of select="../ProductCatalogId" />
					<xsl:copy-of select="../ProductId" />
					<xsl:copy-of select="../ProductName" />
					<xsl:copy-of select="../ProductType" />
					<xsl:copy-of select="../ProvisioningFlg" />
					<xsl:copy-of select="../RoamDataFlag" />
					<xsl:copy-of select="../RootIntegrationId" />
					<xsl:copy-of select="../RootItemId" />
					<xsl:copy-of select="../SMSFlag" />
					<xsl:copy-of select="../SalesForceId" />
					<xsl:copy-of select="../ServiceId" />
					<xsl:copy-of select="../ServiceType" />
					<xsl:copy-of select="../SkipPenalty" />
					<xsl:copy-of select="../StartDate" />
					<xsl:copy-of select="../Status" />
					<xsl:copy-of select="../TariffFlag" />
					<xsl:copy-of select="../TerminationReason" />
					<xsl:copy-of select="../UnitPrice" />
					<xsl:copy-of select="../UnitPriceDisplay" />
					<xsl:copy-of select="../VoiceFlag" />
			</ChildItem>
			</xsl:if>
			
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
