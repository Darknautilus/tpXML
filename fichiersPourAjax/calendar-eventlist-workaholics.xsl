<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" version="1.0" indent="yes"/>

	<xsl:template match="//event[contains(./title,'Workaholics')]">
		<ul class="media-list">
			  <li class="media">
			  	<a class="pull-left" id="event-image" href="#">
			  	</a>
				    <div class="media-body"  id="event-infos">
				     	<h3><xsl:value-of select="title"/></h3>
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
		</ul>
	</xsl:template>
	
	<xsl:template match="/">
	<body>
		<xsl:apply-templates  select="//event[contains(./title,'Workaholics')]"/>
	</body>
	</xsl:template>
	
</xsl:stylesheet>
