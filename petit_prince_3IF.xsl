<?xml version="1.0" encoding="UTF-8"?>

<!-- New document created with EditiX at Mon May 12 15:09:37 CEST 2014 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html"/>

	<xsl:template match="lien"/>

	<xsl:template match="titre">
		<h1 style="text-align:center; color:blue;">
			<xsl:apply-templates/>
		</h1>
	</xsl:template>
	
	<xsl:template match="auteur">
		<!--<br/>
-->
		<h2 style="text-align:center; font-style: italic;">
			<xsl:apply-templates/>
		</h2>
		<!--<br/>-->		
	</xsl:template>
	
	<xsl:template match="info_traitements">
		<blockquote style="color:darkgreen;" >
			But du TP de <xsl:value-of select="//date"/>
 : <xsl:value-of select="//but"/>
<br/>
			Auteurs : <xsl:value-of select="//unCreateur[1]"/>
 et <xsl:value-of select="//unCreateur[2]"/><br/>
			Email du responsable : <xsl:value-of select="//email"/>
		</blockquote>
	</xsl:template>
	
	<xsl:template match="image">
		<div align="center">
			<img>
				<xsl:attribute name="src">
					<xsl:value-of select="@chemin"/>
				</xsl:attribute>
			</img>
		</div>
	</xsl:template>
	
	<xsl:template match="phrase[@langue='hongrois']" name="hongrois">
		<span style="color:brown;font-style:italic;" >
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	
	<xsl:template match="phrase[contains(text(),'mouton') or contains(text(),'bárány')]">
		<span style="font-weight:bold;font-size:1.5em;" >
			<xsl:choose>
				<xsl:when test="@langue = 'hongrois'">
					<xsl:call-template name="hongrois"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates/>
				</xsl:otherwise>
			</xsl:choose>
		</span>
		<img src="images/moutonDessin.png" alt="Un mouton"/>
	</xsl:template>
	
	<xsl:template match="paragraphe">
		<p>
			<xsl:apply-templates/>
		</p>	
	</xsl:template> 
	
	<xsl:template match="phrase">
		<xsl:apply-templates/>
		<xsl:if test="@langue = 'francais' and following-sibling::*[1]/@langue='hongrois' ">
			<br/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="paragraphe[@type='dialogue']">
	<div style="width:90%;margin:auto;" >
		<table border="3" width="600" align="left">
		<xsl:for-each select="phrase[@langue='francais']">
			<tr>
				<td>
					<img src="images/{@locuteur}.png"/>
				</td>
				<td>
					<xsl:apply-templates select="current()"/>
				</td>
			</tr>
		</xsl:for-each>
		</table>
		<table border="3" width="600" align="right">
		<xsl:for-each select="phrase[@langue='hongrois']">
			<tr>
				<td>
					<img src="images/{@locuteur}.png"/>
				</td>
				<td>
					<xsl:apply-templates select="current()"/>
				</td>
			</tr>
		</xsl:for-each>
		</table>
		<div style="clear:both;" ></div>
	</div>
	</xsl:template>
	
	<xsl:template match="en-tete">
		<div style="width:70%;margin:auto;" >
			<div style="float:left;" >
				<img src="images/prince.png" alt="Prince"/>
			</div>
			<div style="float:right">
				<xsl:apply-templates/>
			</div>
			<div style="clear:both;" ></div>
		</div>
		<hr/>
	</xsl:template>
	
	
<xsl:template match="corps">
	
	<h2>Début du texte :</h2>
	<xsl:apply-templates/>
	<h2>Fin du texte.</h2>
	<hr/>
	
</xsl:template>

	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:value-of select="//titre"/>
					<xsl:text> de </xsl:text>
					<xsl:value-of select="//auteur"/>
				</title>
			</head>
			<body style="background-color:white;">
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template> 

</xsl:stylesheet>


