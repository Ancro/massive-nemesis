/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package xmlparser;

import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lucas
 */
public class XMLParser {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            BufferedReader reader = new BufferedReader(new FileReader("CRNH0203-2013-CO_Dinosaur_2_E.txt"));

            String line, wbanno, longitude, latitude;
            int numberOfUpdates = 0;
            String[] updateData = new String[29];

            File xml = new File("CRNH0203-2013-CO_Dinosaur_2_E.xml");
            FileWriter writer = new FileWriter(xml);

            while ((line = reader.readLine()) != null) {
                if (numberOfUpdates < 1) {
                    wbanno = line.substring(0, 5).trim();
                    longitude = line.substring(41, 48).trim();
                    latitude = line.substring(49, 56).trim();

                    writer.write(
                            "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
                            + "<!--\n"
                            + "---- Documentation for arbitrary element names\n"
                            + "---- =========================================\n"
                            + "---- <utc_d>         -> UTC_Date\n"
                            + "---- <utc_t>         -> UTC_Time\n"
                            + "---- <temp><t_hr>    -> T_HR_AVG\n"
                            + "---- <solar><avg>    -> SOLARAD\n"
                            + "---- <solar><max>    -> SOLARAD_MAX\n"
                            + "---- <solar><min>    -> SOLARAD_MIN\n"
                            + "---- <sur [@type]>   -> SUR_TEMP_TYPE\n"
                            + "---- <sur><t>        -> SUR_TEMP\n"
                            + "---- <sur><t_max>    -> SUR_TEMP_MAX\n"
                            + "---- <sur><t_min>    -> SUR_TEMP_MIN\n"
                            + "---- <rh_hr>         -> RH_HR_AVG\n"
                            + "---- <soil><moist_*> -> SOIL_MOISTURE_*\n"
                            + "---- <soil><t_*>     -> SOIL_TEMP_*\n"
                            + "---->\n"
                            + "<station>\n"
                            + "\t<wbanno>\n"
                            + "\t\t" + wbanno + "\n"
                            + "\t</wbanno>\n"
                            + "\t<longitude>\n"
                            + "\t\t" + longitude + "\n"
                            + "\t</longitude>\n"
                            + "\t<latitude>\n"
                            + "\t\t" + latitude + "\n"
                            + "\t</latitude>\n");

                    writer.flush();
                }

                // Read one line
                updateData[0] = line.substring(6, 14).trim();      // UTC_Date
                updateData[1] = line.substring(15, 19).trim();     // UTC_Time
                updateData[2] = line.substring(34, 40).trim();     // CRX_VN
                updateData[3] = line.substring(57, 64).trim();     // T_CALC
                updateData[4] = line.substring(65, 72).trim();     // T_HR_AVG
                updateData[5] = line.substring(73, 80).trim();     // T_MAX
                updateData[6] = line.substring(81, 88).trim();     // T_MIN
                updateData[7] = line.substring(97, 103).trim();    // SOLARAD
                updateData[8] = line.substring(104, 105).trim();   // SOLARAD_FLAG
                updateData[9] = line.substring(106, 112).trim();  // SOLARAD_MAX
                updateData[10] = line.substring(113, 114).trim();  // SOLARAD_MAX_FLAG
                updateData[11] = line.substring(115, 121).trim();  // SOLARAD_MIN
                updateData[12] = line.substring(122, 123).trim();  // SOLARAD_MIN_FLAG
                updateData[13] = line.substring(124, 125).trim();  // SUR_TEMP_TYPE
                updateData[14] = line.substring(126, 133).trim();  // SUR_TEMP
                updateData[15] = line.substring(134, 135).trim();  // SUR_TEMP_FLAG
                updateData[16] = line.substring(136, 143).trim();  // SUR_TEMP_MAX
                updateData[17] = line.substring(144, 145).trim();  // SUR_TEMP_MAX_FLAG
                updateData[18] = line.substring(146, 153).trim();  // SUR_TEMP_MIN
                updateData[19] = line.substring(154, 155).trim();  // SUR_TEMP_MIN_FLAG
                updateData[20] = line.substring(156, 161).trim();  // RH_HR_AVG
                updateData[21] = line.substring(162, 163).trim();  // RH_HR_AVG_FLAG
                updateData[22] = line.substring(188, 195).trim();  // SOIL_MOISTURE_50
                updateData[23] = line.substring(196, 203).trim();  // SOIL_MOISTURE_100
                updateData[24] = line.substring(204, 211).trim();  // SOIL_TEMP_5
                updateData[25] = line.substring(212, 219).trim();  // SOIL_TEMP_10
                updateData[26] = line.substring(220, 227).trim();  // SOIL_TEMP_20
                updateData[27] = line.substring(228, 235).trim();  // SOIL_TEMP_50
                updateData[28] = line.substring(236, 243).trim();  // SOIL_TEMP_100

                // Write XML update
                writer.write("\t<set>\n"
                             + "\t\t<utc_d>\n"
                             + "\t\t\t" + updateData[0] + "\n"
                             + "\t\t</utc_d>\n"
                             + "\t\t<utc_t>\n"
                             + "\t\t\t" + updateData[1] + "\n"
                             + "\t\t</utc_t>\n"
                             + "\t\t<crx_vn>\n"
                             + "\t\t\t" + updateData[2] + "\n"
                             + "\t\t</crx_vn>\n"
                             + "\t\t<temp>\n"
                             + "\t\t\t<t_calc>\n"
                             + "\t\t\t\t" + updateData[3] + "\n"
                             + "\t\t\t</t_calc>\n"
                             + "\t\t\t<t_hr>\n"
                             + "\t\t\t\t" + updateData[4] + "\n"
                             + "\t\t\t</t_hr>\n"
                             + "\t\t\t<t_max>\n"
                             + "\t\t\t\t" + updateData[5] + "\n"
                             + "\t\t\t</t_max>\n"
                             + "\t\t\t<t_min>\n"
                             + "\t\t\t\t" + updateData[6] + "\n"
                             + "\t\t\t</t_min>\n"
                             + "\t\t</temp>\n"
                             + "\t\t<solar>\n"
                             + "\t\t\t<avg flag=\"" + updateData[8] + "\">\n"
                             + "\t\t\t\t" + updateData[7] + "\n"
                             + "\t\t\t</avg>\n"
                             + "\t\t\t<max flag=\"" + updateData[10] + "\">\n"
                             + "\t\t\t\t" + updateData[9] + "\n"
                             + "\t\t\t</max>\n"
                             + "\t\t\t<min flag=\"" + updateData[12] + "\">\n"
                             + "\t\t\t\t" + updateData[11] + "\n"
                             + "\t\t\t</min>\n"
                             + "\t\t</solar>\n"
                             + "\t\t<sur type=\"" + updateData[13] + "\">\n"
                             + "\t\t\t<t flag=\"" + updateData[15] + "\">\n"
                             + "\t\t\t\t" + updateData[14] + "\n"
                             + "\t\t\t</t>\n"
                             + "\t\t\t<t_max flag=\"" + updateData[17] + "\">\n"
                             + "\t\t\t\t" + updateData[16] + "\n"
                             + "\t\t\t</t_max>\n"
                             + "\t\t\t<t_min flag=\"" + updateData[19] + "\">\n"
                             + "\t\t\t\t" + updateData[18] + "\n"
                             + "\t\t\t</t_min>\n"
                             + "\t\t</sur>\n"
                             + "\t\t<rh_hr flag=\"" + updateData[21] + "\">\n"
                             + "\t\t\t" + updateData[20] + "\n"
                             + "\t\t</rh_hr>\n"
                             + "\t\t<soil>\n"
                             + "\t\t\t<moist_50>\n"
                             + "\t\t\t\t" + updateData[22] + "\n"
                             + "\t\t\t</moist_50>\n"
                             + "\t\t\t<moist_100>\n"
                             + "\t\t\t\t" + updateData[23] + "\n"
                             + "\t\t\t</moist_100>\n"
                             + "\t\t\t<t_5>\n"
                             + "\t\t\t\t" + updateData[24] + "\n"
                             + "\t\t\t</t_5>\n"
                             + "\t\t\t<t_10>\n"
                             + "\t\t\t\t" + updateData[25] + "\n"
                             + "\t\t\t</t_10>\n"
                             + "\t\t\t<t_20>\n"
                             + "\t\t\t\t" + updateData[26] + "\n"
                             + "\t\t\t</t_20>\n"
                             + "\t\t\t<t_50>\n"
                             + "\t\t\t\t" + updateData[27] + "\n"
                             + "\t\t\t</t_50>\n"
                             + "\t\t\t<t_100>\n"
                             + "\t\t\t\t" + updateData[28] + "\n"
                             + "\t\t\t</t_100>\n"
                             + "\t\t</soil>\n"
                             + "\t</set>\n");
                writer.flush();

                numberOfUpdates++;
            }

            writer.write("</station>\n");
            writer.flush();

            writer.close();
            reader.close();
        } catch (FileNotFoundException ex) {
            Logger.getLogger(XMLParser.class.getName()).log(Level.SEVERE, null, ex);
            System.err.println("File not found.");
            System.exit(1);
        } catch (IOException ex) {
            Logger.getLogger(XMLParser.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
