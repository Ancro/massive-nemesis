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
		<div id="graphs">
			<div class="time">
				<svg width="{count(//set) * 16 + 1}" xmlns="http://www.w3.org/2000/svg">
					<xsl:for-each select="set">
						<xsl:variable name="date"><xsl:value-of select="utc_d"/></xsl:variable>
						<circle cx="{position() * 16 - 8}" cy="7" r="6" class="month"/>
						<text x="{position() * 16 - 8}" y="10" class="time">
							<xsl:value-of select="floor(($date mod 10000) * 0.01)"/>
						</text>
						<circle cx="{position() * 16 - 8}" cy="20" r="6" class="day"/>
						<text x="{position() * 16 - 8}" y="23" class="time">
							<xsl:value-of select="($date mod 10000) mod 100"/>
						</text>
						<xsl:variable name="time"><xsl:value-of select="utc_t"/></xsl:variable>
						<circle cx="{position() * 16 - 8}" cy="33" r="6" class="hour"/>
						<text x="{position() * 16 - 8}" y="36" class="time">
							<xsl:value-of select="floor($time * 0.01)"/>
						</text>
					</xsl:for-each>
				</svg>
			</div>
			<div class="graph">
				<svg width="{count(//set) * 16 + 1}" xmlns="http://www.w3.org/2000/svg">
					<xsl:for-each select="set/temp/hr">
						<xsl:if test=". > -9999">
							<rect x="{position() * 16 - 15}" y="{50 - .}" height="{. + 100}" width="15" fill="#FF7920"/>
							<text x="{position() * 16 - 8}" y="146" class="desc">
								<xsl:value-of select="."/>
							</text>
						</xsl:if>
					</xsl:for-each>
				</svg>
			</div>
			<div class="graph">
				<svg width="{count(//set) * 16 + 1}" xmlns="http://www.w3.org/2000/svg">
					<xsl:for-each select="set/rh">
						<xsl:if test=". > -9999">
							<rect x="{position() * 16 - 15}" y="{150 - .}" height="{.}" width="15" fill="#009DE0"/>
							<text x="{position() * 16 - 8}" y="146" class="desc">
								<xsl:value-of select="."/>
							</text>
						</xsl:if>
					</xsl:for-each>
				</svg>
			</div>
		</div>
		<div id="caption">
			Legende:
			<span class="color month">
				Monat
			</span>
			<span class="color day">
				Tag
			</span>
			<span class="color hour">
				Stunde
			</span>
			<span class="color temperature">
				Durchschnittstemperatur
			</span>
			<span class="color humidity">
				Luftfeuchtigkeit
			</span>
			<span id="numberOfUpdates">
				Datensätze: <xsl:value-of select="count(//set)"/>
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
