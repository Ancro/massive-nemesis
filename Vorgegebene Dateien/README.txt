                        USCRN/USRCRN FTP HOURLY02 STREAM

NCDC provides ftp access to data from the U.S. Climate Reference Network / U.S.
Regional Climate Reference Network (USCRN/USRCRN) via anonymous ftp at the address

        ftp://ftp.ncdc.noaa.gov/pub/data/uscrn/products/hourly02

That directory contains a separate subdirectory for each year that the ftp data
are available.  Each subdirectory contains a collection of ASCII files named
according to the following convention:

            CRNH02TT-YYYY-${name}.txt

where
       TT = 2-character file format number (currently 03)
     YYYY = 4-digit year
  ${name} = Unique station name (state location vector) with spaces replaced by
            underscores (e.g. AZ_Tucson_11_W)

The 'snapshots' directory contains POR snapshots which have been previously
produced. Each archived zip file contains the entire period of record of USCRN/USRCRN
hourly02 data. Snapshots are created and uploaded at regular intervals, and are named
according to the following convention:

            CRNH02TT-YYYYMMDDHHmm.zip

where
       TT = 2-character file format number (currently 03)
     YYYY = 4-digit year files generated
       MM = 2-digit month files generated (01=Jan, ..., 12=Dec)
       DD = 2-digit day of month files generated
       HH = 2-digit hour of day files generated
       mm = 2-digit minute files generated

Additionally, the 'updates' directory contains a separate subdirectory for each
year that the hourly02 ftp data have been available, starting with 2008.  Each such
subdirectory contains a collection of ASCII files named according to the following
convention:

            CRNFFH02TT-YYYYMMDDHHmm.txt

where
       FF = 2-digit file frequency, in minutes (currently always 60)
       TT = 2-character file format number (currently 03)
     YYYY = 4-digit year
       MM = 2-digit month (01=Jan, ..., 12=Dec)
       DD = 2-digit day of month
       HH = 2-digit hour of day
       mm = 2-digit minute

Each hourly update file contains USCRN/USRCRN data that were loaded into the
USCRN/USRCRN database during the period of time lasting FF minutes and ending at UTC time
YYYYMMDDHHmm.  The 2-character sequence TT indicates the file format number.  If at some point
in the future for format for USCRN/USRCRN hourly02 ftp data changes, this number
will be changed.

Each of the files described above contains fixed-column formatted lines, each of
which represents one hour's observation data from one station.  The format of each
line is as follows:

    cols 1 -- 5 [5 chars] WBANNO
        The station WBAN number.

    cols 7 -- 14 [8 chars] UTC_DATE
        The UTC date of the observation.

    cols 16 -- 19 [4 chars] UTC_TIME
        The UTC time of the observation. Time is the end of the observed 
        hour, so the 00 hour belongs with the previous day's observation, 
        since it contains observations between 11 PM and midnight of that 
        day.

    cols 21 -- 28 [8 chars] LST_DATE
        The Local Standard Time (LST) date of the observation.

    cols 30 -- 33 [4 chars] LST_TIME
        The Local Standard Time (LST) time of the observation. Time is the 
        end of the observed hour.

    cols 35 -- 40 [6 chars] CRX_VN
        The version number of the station datalogger program that was in 
        effect at the time of the observation. Note: should be treated as 
        a string.

    cols 42 -- 48 [7 chars] LONGITUDE
        Station longitude, using WGS-84.

    cols 50 -- 56 [7 chars] LATITUDE
        Station latitude, using WGS-84.

    cols 58 -- 64 [7 chars] T_CALC
        Average temperature, in degrees C, during the last 5 minutes of the 
        hour. Note: USCRN/USRCRN stations have multiple co-located temperature 
        sensors that record independent measurements. This value is a single 
        temperature number that is calculated from the multiple independent 
        measurements.

    cols 66 -- 72 [7 chars] T_HR_AVG
        Average temperature, in degrees C, during the entire hour. Note: 
        USCRN/USRCRN stations have multiple co-located temperature sensors 
        that record independent measurements. This value is a single temperature 
        number that is calculated from the multiple independent measurements.

    cols 74 -- 80 [7 chars] T_MAX
        Maximum temperature, in degrees C, during the hour.  Note: USCRN/USRCRN 
        stations have multiple co-located temperature sensors that record 
        independent measurements.  This value is a single temperature number 
        that is calculated from the multiple independent measurements. The 
        independent measurements are the maximum for each sensor of 5-minute 
        average temperatures measured every 10 seconds during the hour.

    cols 82 -- 88 [7 chars] T_MIN
        Minimum temperature, in degrees C, during the hour.  Note: USCRN/USRCRN 
        stations have multiple co-located temperature sensors that record 
        independent measurements.  This value is a single temperature number 
        that is calculated from the multiple independent measurements. The 
        independent measurements are the mminimum for each sensor of 5-minute 
        average temperatures measured every 10 seconds during the hour.

    cols 90 -- 96 [7 chars] P_CALC
        Total amount of precipitation, in mm, recorded during the hour. Note: 
        USCRN/USRCRN stations have multiple independent measures of precipitation; 
        this P_CALC value is a single precipitation number that is calculated 
        from the multiple independent measurements.

    cols 98 -- 103 [6 chars] SOLARAD
        Average global solar radiation, in watts/meter^2, for the hour.

    cols 105 -- 105 [1 chars] SOLARAD_FLAG
        QC flag for average global solar radiation.  0 means good, 3 means 
        erroneous.

    cols 107 -- 112 [6 chars] SOLARAD_MAX
        Maximum global solar radiation, in watts/meter^2, for the hour.

    cols 114 -- 114 [1 chars] SOLARAD_MAX_FLAG
        QC flag for maximum global solar radiation.  0 means good, 3 means 
        erroneous.

    cols 116 -- 121 [6 chars] SOLARAD_MIN
        Minimum global solar radiation, in watts/meter^2, for the hour.

    cols 123 -- 123 [1 chars] SOLARAD_MIN_FLAG
        QC flag for minimum global solar radiation.  0 means good, 3 means 
        erroneous.

    cols 125 -- 125 [1 chars] SUR_TEMP_TYPE
        Type of surface tempearture measurement.  'R' to denote raw surface 
        temperature measurements, 'C' to denote corrected surface temperature 
        measurements, and 'U' when unknown.

    cols 127 -- 133 [7 chars] SUR_TEMP
        Average surface temperature, in degrees C, for the hour.

    cols 135 -- 135 [1 chars] SUR_TEMP_FLAG
        QC flag for surface temperature.  0 means good, 3 means erroneous.

    cols 137 -- 143 [7 chars] SUR_TEMP_MAX
        Maximum surface temperature, in degrees C, for the hour.

    cols 145 -- 145 [1 chars] SUR_TEMP_MAX_FLAG
        QC flag for surface temperature maximum.  0 means good, 3 means erroneous.

    cols 147 -- 153 [7 chars] SUR_TEMP_MIN
        Minimum surface temperature, in degrees C, for the hour.

    cols 155 -- 155 [1 chars] SUR_TEMP_MIN_FLAG
        QC flag for surface temperature minimum.  0 means good, 3 means erroneous.

    cols 157 -- 161 [5 chars] RH_HR_AVG
        RH average for hour

    cols 163 -- 163 [1 chars] RH_HR_AVG_FLAG
        QC flag for RH average.  0 means good, 3 means erroneous.

    cols 165 -- 171 [7 chars] SOIL_MOISTURE_5
        Average soil moisture (volumetric water content) during the entire 
        hour at 5 cm below the surface, the ratio of water volume over sample 
        volume. Note: USCRN/USRCRN stations have multiple co-located moisture 
        sensors that record independent measurements. This value is a single 
        moisture number that is calculated from the multiple independent 
        measurements. 

    cols 173 -- 179 [7 chars] SOIL_MOISTURE_10
        Average soil moisture (volumetric water content) during the entire 
        hour at 10 cm below the surface, the ratio of water volume over sample 
        volume. Note: USCRN/USRCRN stations have multiple co-located moisture 
        sensors that record independent measurements. This value is a single 
        moisture number that is calculated from the multiple independent 
        measurements. 

    cols 181 -- 187 [7 chars] SOIL_MOISTURE_20
        Average soil moisture (volumetric water content) during the entire 
        hour at 20 cm below the surface, the ratio of water volume over sample 
        volume. Note: USCRN/USRCRN stations have multiple co-located moisture 
        sensors that record independent measurements. This value is a single 
        moisture number that is calculated from the multiple independent 
        measurements. 

    cols 189 -- 195 [7 chars] SOIL_MOISTURE_50
        Average soil moisture (volumetric water content) during the entire 
        hour at 50 cm below the surface, the ratio of water volume over sample 
        volume. Note: USCRN/USRCRN stations have multiple co-located moisture 
        sensors that record independent measurements. This value is a single 
        moisture number that is calculated from the multiple independent 
        measurements. 

    cols 197 -- 203 [7 chars] SOIL_MOISTURE_100
        Average soil moisture (volumetric water content) during the entire 
        hour at 100 cm below the surface, the ratio of water volume over 
        sample volume. Note: USCRN/USRCRN stations have multiple co-located 
        moisture sensors that record independent measurements. This value 
        is a single moisture number that is calculated from the multiple 
        independent measurements. 

    cols 205 -- 211 [7 chars] SOIL_TEMP_5
        Average soil temperature during the entire hour at 5 cm below the 
        surface, in degrees C. Note: USCRN/USRCRN stations have multiple 
        co-located temperature sensors that record independent measurements. 
        This value is a single temperature number that is calculated from 
        the multiple independent measurements. 

    cols 213 -- 219 [7 chars] SOIL_TEMP_10
        Average soil temperature during the entire hour at 10 cm below the 
        surface, in degrees C. Note: USCRN/USRCRN stations have multiple 
        co-located temperature sensors that record independent measurements. 
        This value is a single temperature number that is calculated from 
        the multiple independent measurements. 

    cols 221 -- 227 [7 chars] SOIL_TEMP_20
        Average soil temperature during the entire hour at 20 cm below the 
        surface, in degrees C. Note: USCRN/USRCRN stations have multiple 
        co-located temperature sensors that record independent measurements. 
        This value is a single temperature number that is calculated from 
        the multiple independent measurements. 

    cols 229 -- 235 [7 chars] SOIL_TEMP_50
        Average soil temperature during the entire hour at 50 cm below the 
        surface, in degrees C. Note: USCRN/USRCRN stations have multiple 
        co-located temperature sensors that record independent measurements. 
        This value is a single temperature number that is calculated from 
        the multiple independent measurements. 

    cols 237 -- 243 [7 chars] SOIL_TEMP_100
        Average soil temperature during the entire hour at 100 cm below the 
        surface, in degrees C. Note: USCRN/USRCRN stations have multiple 
        co-located temperature sensors that record independent measurements. 
        This value is a single temperature number that is calculated from 
        the multiple independent measurements. 

FORMAT CHANGES:

 1. [Transition from format '01' to '02']
    As of March 22, 2011 15:00 UTC the format of the Hourly product was
    changed by removing the COOPNO (Cooperative Observer Program Number)
    column from the format.  This was the second column in the format,
    starting at character 7 and ending at character 12.  With the removal
    of this column, all following columns were shifted to the left by
    7 characters.  The contents of the shifted columns remained the same.

 2. [Transition from format '02' to '03']
    As of January 7, 2013 15:00 UTC the format of the Hourly product was
    changed by adding the SUR_TEMP_TYPE column to the format.  This is
    now the 20th column in the format, starting and ending at character 125.
    With the addition of this column, all following columns were shifted
    to the right by 2 characters.  The contents of the shifted columns
    remained the same.

IMPORTANT NOTES:

 1. All fields are separated from adjacent fields by at least one space.

 2. Leading zeros are omitted.

 3. Missing data are indicated by the lowest possible integer for a given column
    format.  Such as -9999.0 for 7-character fields with one decimal place or -99.000
    for 7-character fields with three decimal places.

 4. Fields which do not have QC flags associated with them, such as T_CALC, P_CALC,
    are values that are derived from the raw data (which is not included in these
    files).  When the raw data is flagged as erroneous, these derived values are not
    calculated --- they are reported as missing instead.  So these fields may be assumed to
    always be good (unflagged) data, except when they are reported as missing.

 5. The update files are named according to WHEN THE DATA WERE LOADED INTO THE
    USCRN/USRCRN DATABASE AT NCDC, not according to observation times. Data from USCRN/USRCRN
    stations generally arrives at NCDC and is loaded into the USCRN/USRCRN database
    steadily throughout the hour, but sometimes an observation shows up several hours
    later, if there was a temporary problem with its transmission.  In some cases, if
    there is a more long-term problem with data transmissions from a USCRN/USRCRN
    station, data from that station will be transferred manually via PDA, which can
    happen months after the data were collected.  No matter how the data arrives at
    NCDC, it will show up in an ftp file that is named according to the time at which
    it was loaded into the USCRN/USRCRN database, as long as the date of
    observation was within the past five days. This five day restriction is in place to
    avoid overloading users with thousands of records when a PDA arrives.

    This means that in general each .txt file will contain one hour's worth of
    data, most of it for the previous hour.  There will occasionally be observations
    in a file that are from more than one hour in the past, however.  There are
    also sometimes hours during which no data is loaded at all (for example when the
    USCRN/USRCRN database is down for maintenance for several hours on Sunday nights), which
    means that the .txt files for this period will be empty.  This is normal.  These
    periods will be followed by one or more hours in which the .txt files will be larger
    than average because the system is loading data that that came in over more than
    a one-hour period.

 6. This product supercedes the hourly01 ftp product. It contains all of the
    variables from the earlier product, plus additional ones. We encourage hourly01 users
    to transition to the hourly02 product, as hourly01 will be discontinued some
    time in 2009.