<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
	  
	<xsl:strip-spaces/>

	<xsl:template match="/">
		<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
		<html xmlns="http://www.w3.org/1999/xhtml">
			<body>
				<h1 style="text-align:center">Dinosaur, Colorado</h1>
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="station">
		<h3 style="text-align:center">
			Stationsnummer:<xsl:value-of select="wbanno"/>|
			LON:<xsl:value-of select="longitude"/>|
			LAT<xsl:value-of select="latitude"/>
		</h3>
		<svg width="200" height="250" xmlns="http://www.w3.org/2000/svg">		
			<g id="block1" transform="translate(0,200)">
				<xsl:for-each select="set/rh">
					<rect x="{position()*25}" y="-{.*1.5}" height="{.*1.5}" width="15" fill="#009DE0"/>
					<text x="{position()*25 + 7.5}" y="20" style="font-family:arial;text-anchor:middle;baseline-shift:-15;">
						<xsl:value-of select="."/> <!--Text funktioniert nocht nicht, dehalb 0 als dummy-->
					</text>
				</xsl:for-each>
			</g>
		</svg>
		<svg width="200" height="250" xmlns="http://www.w3.org/2000/svg">		
			<g id="block2" transform="translate(-200,450)">
				<xsl:for-each select="set/temp/hr">
					<rect x="{position()*25}" y="-{.*1.5 + 100}" height="{.*1.5 + 100}" width="15" fill="#FF7920"/>
					<text x="{position()*25 + 7.5}" y="20" style="font-family:arial;text-anchor:middle;baseline-shift:-15;">
						<xsl:value-of select="."/> <!--Text funktioniert nocht nicht, deshalb 0 als dummy-->
					</text>
				</xsl:for-each>
			</g>
		</svg>
			<svg width="200" height="250" xmlns="http://www.w3.org/2000/svg">		
			<g id="block3" transform="translate(-400,600)">
					<text x="{position()*25 - 10}" y="-70" style="font-family:arial;text-anchor:middle;baseline-shift:-15;">
						Legende:
					</text>
					<rect x="{position()*25}" y="-60" height="25" width="25" fill="#009DE0"/>
					<rect x="{position()*25}" y="-20" height="25" width="25" fill="#FF7920"/>
					<text x="{position()*25 + 30}" y="-40" style="font-family:arial;baseline-shift:-15;">
						Luftfeuchtigkeit
					</text>
					<text x="{position()*25 + 30}" y="0" style="font-family:arial;baseline-shift:-15;">
						Durchschnittstemperatur
					</text>
			</g>
		</svg>
	</xsl:template>
	
	<xsl:template match="wbanno">
	</xsl:template>
	
	<xsl:template match="longitude">
	</xsl:template>
	
	<xsl:template match="latitude">
	</xsl:template>
	
	<xsl:template match="set">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="utc_d">
	</xsl:template>
	
	<xsl:template match="utc_t">
	</xsl:template>
	
	<xsl:template match="dl_vn">
	</xsl:template>
	
	<xsl:template match="temp">
	</xsl:template>
	
	<xsl:template match="solar">
	</xsl:template>
	
	<xsl:template match="sur">
	</xsl:template>
	
	<xsl:template match="soil">
	</xsl:template>
	
	<xsl:template match="rh">
	</xsl:template>

</xsl:stylesheet>
