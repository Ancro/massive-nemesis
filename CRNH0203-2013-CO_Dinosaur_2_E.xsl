<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">

<xsl:strip-spaces/>

	<xsl:template match="/">
		<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<link rel="stylesheet" type="text/css" href="style.css"/>
			</head>
			<body>
				<h1>Dinosaur, Colorado</h1>
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="station">
		<h3 class="desc">
			<span class="key_desc">Stationsnummer:</span><span class="value_desc"><xsl:value-of select="wbanno"/>;</span>
			<span class="key_desc">LAT:</span><span class="value_desc"><xsl:value-of select="latitude"/>;</span>
			<span class="key_desc">LON:</span><span class="value_desc"><xsl:value-of select="longitude"/></span>
		</h3>
		<div class="graph">
			<svg xmlns="http://www.w3.org/2000/svg">
				<xsl:for-each select="set/rh">
					<rect x="{position() * 16}" y="{125 - .}" height="{.}" width="15" fill="#009DE0"/>
					<text x="{position() * 16 + 24}" y="118" class="desc">
						<xsl:value-of select="."/>
					</text>
				</xsl:for-each>
			</svg>
		</div>
		<div class="graph">
			<svg xmlns="http://www.w3.org/2000/svg">
				<xsl:for-each select="set/temp/hr">
					<rect x="{position() * 16}" y="{25 - .}" height="{. + 100}" width="15" fill="#FF7920"/>
					<text x="{position() * 16 + 24}" y="110" class="desc">
						<xsl:value-of select="."/>
					</text>
				</xsl:for-each>
			</svg>
		</div>
		<div id="caption">
			Legende:
			<span class="color" id="humidity">
				Luftfeuchtigkeit
			</span>
			<span class="color" id="temperature">
				Durchschnittstemperatur
			</span>
		</div>
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
