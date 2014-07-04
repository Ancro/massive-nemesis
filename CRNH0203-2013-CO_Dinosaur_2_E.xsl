<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
	<xsl:template match="/">
		<html xmlns="http://www.w3.org/1999/xhtml">
			<body>
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
		<xsl:variable name="humidity" select="."/>
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="-100 -100 200 200" width="200" height="200">
				<circle r="{$humidity}" fill="#B03"/>
			</svg>
	</xsl:template>
</xsl:stylesheet>
