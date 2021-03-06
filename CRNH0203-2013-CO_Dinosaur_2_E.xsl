<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">

	<xsl:output method="xml" doctype-system="about:legacy-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes"/>

	<!-- Grundlegende HTML-Struktur -->
	<xsl:template match="/">
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

	<!-- Bestandteile des Body-Elements -->
	<xsl:template match="station">
		<!-- Kopfzeile -->
		<h3 class="desc">
			<span class="key_desc">Stationsnummer:</span><span class="value_desc"><xsl:value-of select="normalize-space(wbanno)"/>;</span>
			<span class="key_desc">LAT:</span><span class="value_desc"><xsl:value-of select="normalize-space(latitude)"/>;</span>
			<span class="key_desc">LON:</span><span class="value_desc"><xsl:value-of select="normalize-space(longitude)"/></span>
		</h3>

		<!-- SVG-Elemente -->
		<div id="graphs">

			<!-- Monat, Tag und volle Stunde der Messung -->
			<svg class="time" width="{count(//set) * 16 + 1}" xmlns="http://www.w3.org/2000/svg">
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

			<!-- Durchschnittslufttemperatur -->
			<svg class="graph" width="{count(//set) * 16 + 1}" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
				<xsl:for-each select="set/temp/hr">
					<xsl:choose>
						<!-- Valide Daten anzeigen -->
						<xsl:when test=". > -9999">
							<xsl:variable name="temp"><xsl:value-of select="normalize-space(.)"/></xsl:variable>
							<rect x="{position() * 16 - 15}" y="{100 - $temp}" height="{$temp + 50}" width="15" class="temperature"/>
							<text x="{position() * 16 - 8}" y="146" class="desc">
								<xsl:value-of select="floor($temp)"/>
							</text>
						</xsl:when>
						<!-- Invalide Daten ausblenden (durch Dinosaurier ersetzen) -->
						<xsl:otherwise>
							<image x="{position() * 16 - 15}" y="141" width="15" height="10" xlink:href="https://upload.wikimedia.org/wikipedia/commons/1/10/Sauroposeidon_dinosaur.svg"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<!-- 0-Grad-Linie -->
				<text x="5" y="95" class="freezing_point">Nullpunkt</text>
				<line x1="0" y1="100" x2="{count(//set) * 16 + 1}" y2="100" class="freezing_point"/>
			</svg>

			<!-- Durchschnittsbodentemperatur -->
			<svg class="graph" width="{count(//set) * 16 + 1}" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
				<xsl:for-each select="set/sur/avg">
					<xsl:choose>
						<!-- Valide Daten anzeigen -->
						<xsl:when test=". > -9999">
							<xsl:variable name="sur_temp"><xsl:value-of select="normalize-space(.)"/></xsl:variable>
							<rect x="{position() * 16 - 15}" y="{100 - $sur_temp}" height="{$sur_temp + 50}" width="15" class="surface"/>
							<text x="{position() * 16 - 8}" y="146" class="desc">
								<xsl:value-of select="floor($sur_temp)"/>
							</text>
						</xsl:when>
						<!-- Invalide Daten ausblenden (durch Dinosaurier ersetzen) -->
						<xsl:otherwise>
							<image x="{position() * 16 - 15}" y="141" width="15" height="10" xlink:href="https://upload.wikimedia.org/wikipedia/commons/1/10/Sauroposeidon_dinosaur.svg"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
				<text x="5" y="95" class="freezing_point">Nullpunkt</text>
				<line x1="0" y1="100" x2="{count(//set) * 16 + 1}" y2="100" class="freezing_point"/>
			</svg>
			<svg class="graph" width="{count(//set) * 16 + 1}" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
				<xsl:for-each select="set/rh">
					<xsl:choose>
						<!-- Valide Daten anzeigen -->
						<xsl:when test=". > -9999">
							<xsl:variable name="humid"><xsl:value-of select="normalize-space(.)"/></xsl:variable>
							<!-- "height" wird um 10 erhöht, damit die Zahlenwerte immer sichtbar bleiben -->
							<rect x="{position() * 16 - 15}" y="{140 - $humid}" height="{$humid + 10}" width="15" class="humidity"/>
							<text x="{position() * 16 - 8}" y="146" class="desc">
								<xsl:value-of select="$humid"/>
							</text>
						</xsl:when>
						<!-- Invalide Daten ausblenden (durch Dinosaurier ersetzen) -->
						<xsl:otherwise>
							<image x="{position() * 16 - 15}" y="141" width="15" height="10" xlink:href="https://upload.wikimedia.org/wikipedia/commons/1/10/Sauroposeidon_dinosaur.svg"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</svg>
		</div>
		<!-- Legende -->
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
				Durchschnittslufttemperatur&#160;in&#160;°C
			</span>
			<span class="color surface">
				Durchschnittsbodentemperatur&#160;in&#160;°C
			</span>
			<span class="color humidity">
				Luftfeuchtigkeit&#160;in&#160;%
			</span>
			<span class="color DINOSAUR">
				Fehlerhafter&#160;Datensatz
			</span>
			<span id="numberOfUpdates">
				Datensätze:&#160;<xsl:value-of select="count(//set)"/>
			</span>
		</div>
	</xsl:template>

	<!-- Ungenutzte Templates werden ausgeblendet -->

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
