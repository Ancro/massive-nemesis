## Projekt Dokumentbeschreibungssprachen
### Darstellung der XML-Struktur für Nichtinformatiker
#### 1. Erläuterung der XML-Struktur
Die XML-Struktur gibt Auskunft über die ganzjährig bestehende Messung einer Wetterstation.
Die Struktur ist zweigeteilt in konstante und variable Informationen. Unter den konstanten Informationen befindet sich die Nummer der Wetterstation sowie die geografische Lage. Variable Informationen werden stündlich aktualisiert. Zum einen enthalten sie allgemeine Auskunft über das Datum, die Zeit und die Version der Software, womit die Daten analysiert werden und zum anderen wetterabhängige Informationen. Diese unterteilen sich in Lufttemperatur, Sonneneinstrahlung, relative Luftfeuchtigkeit und Bodentemperatur über und unter der Oberfläche.
#### 2. Erklärung der Begriffe
##### `<station>`
- beinhaltet alle Informationen der Wetterstation

##### `<wbanno>`
- Nummer der Wetterstation

##### `<longitude>`
- Längengrad der Wetterstation

##### `<latitude>`
- Breitengrad der Wetterstation

##### `<set>`
- beinhaltet alle stündlichen Updates einer Wetterstation

##### `<utc_d>`
- Datum nach UTC (koordinierte Weltzeit)

##### `<utc_t>`
- Zeit nach UTC (koordinierte Weltzeit)

##### `<crx_vn>`
- Versionsnummer des Aufzeichnungsprogramms

##### `<temp><t_calc>`
- Durchschnittslufttemperatur der letzten 5 Minuten in Grad Celsius

##### `<temp><t_hr>`
- Durchschnittslufttemperatur der gesamten Stunde

##### `<temp><t_max>`
- Höchste Lufttemperatur

##### `<temp><t_min>`
- Niedrigste Lufttemperatur

##### `<solar><avg>`
- durchschnittliche Sonneneinstrahlung gemessen in W/m²

##### `<solar><max>`
- Höchste Sonneneinstrahlung

##### `<solar><min>`
- Niedrigste Sonneneinstrahlung

##### `<sur [@type]>`
- Typisierung der Temperaturmessung am Boden
	- R — raw (unbearbeitet)
	- C — corrected (korrigiert)
	- U — unknown (unbekannt)

##### `<sur><t>`
- Durchschnittsbodentemperatur der gesamten Stunde in Grad Celsius

##### `<sur><t_max>`
- Höchste Bodentemperatur

##### `<sur><t_min>`
- Niedrigste Bodentemperatur

##### `<rh_hr>`
- Durchschnitt der relativen Luftfeuchtigkeit

##### `<soil><moist_50>`
- durchschnittliche Bodenfeuchtigkeit 50 cm unterhalb der Oberfläche

##### `<soil><moist_100>`
- durchschnittliche Bodenfeuchtigkeit 100 cm unterhalb der Oberfläche

##### `<soil><t_5>`
- durchschnittliche Bodentemperatur 5 cm unterhalb der Oberfläche

##### `<soil><t_10>`
- durchschnittliche Bodentemperatur 10 cm unterhalb der Oberfläche

##### `<soil><t_20>`
- durchschnittliche Bodentemperatur 20 cm unterhalb der Oberfläche

##### `<soil><t_50>`
- durchschnittliche Bodentemperatur 50 cm unterhalb der Oberfläche

##### `<soil><t_100>`
- durchschnittliche Bodentemperatur 100 cm unterhalb der Oberfläche

