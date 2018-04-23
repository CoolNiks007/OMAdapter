<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="OrderType"/>
	<xsl:param name="ActionReason"/>
	<xsl:param name="ActionSubReason"/>
	<xsl:param name="ActionType"/>
	<xsl:param name="ListOfApprovedMSISDN"/>
	<xsl:param name="ListOfAcctPayType"/>
	<xsl:template match="/">
		<SiebelMessage>
			<xsl:for-each select="/OSMOrder/XMLMessage/Order">
				<Order>
					<xsl:for-each select="./*">
						<xsl:choose>
							<xsl:when test="name(.) = 'ListOfRootItem'">
								<ListOfRootItem>
									<xsl:for-each select="./RootItem[contains($ListOfApprovedMSISDN,MSISDN) or (ComponentGroup=('CAMP PROMO','CAMP CONTAINER'))]">
										<RootItem>
											<xsl:for-each select="./*">
												<xsl:choose>
													<xsl:when test="name(.) = 'ActionReason' and string-length($ActionReason)>0">
														<ActionReason>
															<xsl:value-of select="$ActionReason"/>
														</ActionReason>
														<ActionSubReason>
															<xsl:value-of select="$ActionSubReason"/>
														</ActionSubReason>
													</xsl:when>
													<xsl:when test="name(.) = 'ActionSubReason'"/>
													<xsl:when test="name(.) = 'ActionType' and string-length($ActionType)>0">
														<ActionType>
															<xsl:value-of select="$ActionType"/>
														</ActionType>
													</xsl:when>
													<xsl:when test="name(.) = 'ListOfRootItemAttribute' and string-length($ListOfAcctPayType)>0 and contains($ListOfAcctPayType,../MSISDN)">
														<xsl:variable name="AcctPayTypeAux" select="concat($ListOfAcctPayType,'|')"/>
														<xsl:variable name="AcctPayType" select="substring-before(substring-after($AcctPayTypeAux, concat(../MSISDN,'-')),'|')"/>
														<ListOfRootItemAttribute>
															<xsl:for-each select="./RootItemAttribute">
																<xsl:copy-of select="."/>
															</xsl:for-each>
															<RootItemAttribute>
																<Name>PortINAcctPayType</Name>
																<Value>
																	<xsl:value-of select="$AcctPayType"/>
																</Value>
															</RootItemAttribute>
														</ListOfRootItemAttribute>
													</xsl:when>
													<xsl:otherwise>
														<xsl:copy-of select="."/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:for-each>
										</RootItem>
									</xsl:for-each>
								</ListOfRootItem>
							</xsl:when>
							<xsl:when test="name(.) = 'OrderType' and string-length($OrderType)>0">
								<OrderType>
									<xsl:value-of select="$OrderType"/>
								</OrderType>
							</xsl:when>
							<xsl:otherwise>
								<xsl:copy-of select="."/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</Order>
			</xsl:for-each>
		</SiebelMessage>
	</xsl:template>
</xsl:stylesheet>