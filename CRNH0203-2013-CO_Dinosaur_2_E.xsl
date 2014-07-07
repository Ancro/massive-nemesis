<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
	<xsl:template match="/">
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
		<strong>Tag:&#160;</strong>
		<xsl:apply-templates/>
		<div></div>
	</xsl:template>
	<xsl:template match="utc_t">
		<strong>Zeit:&#160;</strong>
		<xsl:apply-templates/>
		<div></div>
	</xsl:template>
	<xsl:template match="dl_vn">
	</xsl:template>
	<xsl:template match="temp">
		<xsl:variable name="temperature" select="hr"/>
		<xsl:apply-templates select="hr"/>&#160;
		<svg width="{$temperature * 5}" height="12">
			<rect width="{$temperature * 5}" height="12" style="fill:#FF7920;stroke-width:1;stroke:rgb(0,0,0)" />			
		</svg>
		<div></div>
	</xsl:template>
	<xsl:template match="solar">
	</xsl:template>
	<xsl:template match="sur">
	</xsl:template>
	<xsl:template match="soil">
	</xsl:template>
	<xsl:template match="rh">
		<xsl:variable name="humidity" select="."/>
			<xsl:apply-templates/>&#160;&#160;&#160;&#160;
			<svg width="{$humidity * 5}" height="12">
				<rect width="{$humidity * 5}" height="12" style="fill:#009DE0;stroke-width:1;stroke:rgb(0,0,0)" />			
			</svg>
			<div></div>
	</xsl:template>
</xsl:stylesheet>
