<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" version="1.0" indent="yes"/>

	<xsl:template match="//event[contains(./title,'Workaholics')]">
		<infos>
			<title><xsl:value-of select="title"/></title>
			<begindate>
				<day><xsl:value-of select="substring(dtstart,7,2)"/></day>
				<month><xsl:value-of select="substring(dtstart,5,2)"/></month>
				<year><xsl:value-of select="substring(dtstart,1,4)"/></year>
				<hour><xsl:value-of select="substring(dtstart,10,2)"/></hour>
				<minute><xsl:value-of select="substring(dtstart,12,2)"/></minute>
			</begindate>
			<enddate>
				<day></day>
				<month></month>
				<year></year>
				<hour><xsl:value-of select="substring(dtend,10,2)"/></hour>
				<minute><xsl:value-of select="substring(dtend,12,2)"/></minute>
			</enddate>
			<summary>
				<xsl:value-of select="summary"/>
			</summary>
			<url><xsl:value-of select='url'/></url>
			<description>
				<xsl:value-of select="description"/>
			</description>
		</infos>
	</xsl:template>
	
	<xsl:template match="/">
	<event>
		<xsl:apply-templates  select="//event[contains(./title,'Workaholics')]"/>
	</event>
	</xsl:template>
	
</xsl:stylesheet>
