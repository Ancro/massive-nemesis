<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
	<xsl:strip-spaces/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
		<html xmlns="http://www.w3.org/1999/xhtml">
			<body>
				<h1 style="text-align:center">Luftfeuchtigkeit pro Stunde in Dinosaur</h1>
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="station">
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
		<strong style="margin-right: 0.5em">Tag:</strong>
		<xsl:apply-templates/>
		<br/>
	</xsl:template>
	<xsl:template match="utc_t">
		<strong style="margin-right: 0.5em">Zeit:</strong>
		<xsl:apply-templates/>
		<br/>
	</xsl:template>
	<xsl:template match="dl_vn">
	</xsl:template>
	<xsl:template match="temp">
		<xsl:variable name="temperature" select="hr"/>
		<div style="display: none; float: left; width: 50px;">
			<xsl:apply-templates select="hr"/>
		</div>
		<svg xmlns="http://www.w3.org/2000/svg" width="12" height="{$temperature + 273.25}">
			<rect width="12" height="{$temperature + 273.25}" style="fill: #FF7920; stroke-width: 1; stroke: #000" />			
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
		<div style="display: none; float: left; width: 50px;">
			<xsl:apply-templates/>
		</div>
		<svg xmlns="http://www.w3.org/2000/svg" width="12" height="{$humidity * 5}">
			<rect width="12" height="{$humidity * 5}" style="fill: #009DE0; stroke-width: 1; stroke: #000" />			
		</svg>
		<br/>
	</xsl:template>
</xsl:stylesheet>
