<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" version="1.0" indent="yes"/>

	<xsl:template match="//calendar">
		<ul class="media-list">
		<xsl:for-each select="//event">
			  <li class="media event">
				    <div class="media-body"  class="event-infos">
				     	<h3 class="event-title" ><xsl:value-of select="title"/></h3>
				     	<p>
						le <xsl:value-of select="substring(dtstart,7,2)"/>-<xsl:value-of select="substring(dtstart,5,2)"/>-<xsl:value-of select="substring(dtstart,1,4)"/> de <xsl:value-of select="substring(dtstart,10,2)"/>H<xsl:value-of select="substring(dtstart,12,2)"/> à <xsl:value-of select="substring(dtend,10,2)"/>H<xsl:value-of select="substring(dtend,12,2)"/><br/>
						<xsl:value-of select="summary"/><br/>
						<a>
							<xsl:attribute name="href">
								<xsl:value-of select='url'/>
							</xsl:attribute>
							<xsl:value-of select="url"/>
						</a><br/>
						<xsl:value-of select="description"/>
					</p>
				    </div>
			  </li>
		</xsl:for-each>
		</ul>
	</xsl:template>
	
	<xsl:template match="/">
	<events>
		<xsl:apply-templates  select="//calendar"/>
	</events>
	</xsl:template>
	
</xsl:stylesheet>
