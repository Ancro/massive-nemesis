<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
	<xsl:strip-spaces/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<h1 style="text-align:center">Dinosaur, Colorado</h1>
				<xsl:apply-templates/>
			</head>
		</html>
	</xsl:template>
	<xsl:template match="station">
		<h3 style="text-align:center">
			Stationsnummer:<xsl:value-of select="wbanno"/>|
			LON:<xsl:value-of select="longitude"/>|
			LAT<xsl:value-of select="latitude"/>
		</h3>
		<xsl:apply-templates/>
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
		<xsl:variable name="temperature" select="hr"/>
		<svg xmlns="http://www.w3.org/2000/svg" width="3" height="{$temperature + 273.25}">
			<rect width="3" height="{$temperature + 273.25}" style="fill: #FF7920; stroke-width: 1; stroke: #000" />			
		</svg>		
	</xsl:template>
	<xsl:template match="solar">
	</xsl:template>
	<xsl:template match="sur">
	</xsl:template>
	<xsl:template match="soil">
	</xsl:template>
	<xsl:template match="rh">
		<xsl:variable name="humidity" select="."/>
		<svg xmlns="http://www.w3.org/2000/svg" width="3" height="{$humidity * 5}">
			<rect width="3" height="{$humidity * 5}" style="fill: #009DE0; stroke-width: 1; stroke: #000" />					
		</svg>
	</xsl:template>
</xsl:stylesheet>
