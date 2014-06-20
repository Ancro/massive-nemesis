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
            String[] updateData = new String[33];

            while ((line = reader.readLine()) != null) {
                if (numberOfUpdates < 1) {
                    wbanno = line.substring(0, 5);
                    longitude = line.substring(41, 48);
                    latitude = line.substring(49, 56);
                }
                updateData[0] = line.substring(0, 5);       // WBANNO
                updateData[1] = line.substring(6, 14);      // UTC_Date
                updateData[2] = line.substring(15, 19);     // UTC_Time
                updateData[3] = line.substring(34, 40);     // CRX_VN
                updateData[4] = line.substring(41, 48);     // LONGITUDE
                updateData[5] = line.substring(49, 56);     // LATITUDE
                updateData[6] = line.substring(57, 64);     // T_CALC
                updateData[7] = line.substring(65, 72);     // T_HR_AVG
                updateData[8] = line.substring(73, 80);     // T_MAX
                updateData[9] = line.substring(81, 88);     // T_MIN
                updateData[10] = line.substring(89, 96);    // P_CALC
                updateData[11] = line.substring(97, 103);   // SOLARAD
                updateData[12] = line.substring(104, 105);  // SOLARAD_FLAG
                updateData[13] = line.substring(106, 112);  // SOLARAD_MAX
                updateData[14] = line.substring(113, 114);  // SOLARAD_MAX_FLAG
                updateData[15] = line.substring(115, 121);  // SOLARAD_MIN
                updateData[16] = line.substring(122, 123);  // SOLARAD_MIN_FLAG
                updateData[17] = line.substring(124, 125);  // SUR_TEMP_TYPE
                updateData[18] = line.substring(126, 133);  // SUR_TEMP
                updateData[19] = line.substring(134, 135);  // SUR_TEMP_FLAG
                updateData[20] = line.substring(136, 143);  // SUR_TEMP_MAX
                updateData[21] = line.substring(144, 145);  // SUR_TEMP_MAX_FLAG
                updateData[22] = line.substring(146, 153);  // SUR_TEMP_MIN
                updateData[23] = line.substring(154, 155);  // SUR_TEMP_MIN_FLAG
                updateData[24] = line.substring(156, 161);  // RH_HR_AVG
                updateData[25] = line.substring(162, 163);  // RH_HR_AVG_FLAG
                updateData[26] = line.substring(188, 195);  // SOIL_MOISTURE_50
                updateData[27] = line.substring(196, 203);  // SOIL_MOISTURE_100
                updateData[28] = line.substring(204, 211);  // SOIL_TEMP_5
                updateData[29] = line.substring(212, 219);  // SOIL_TEMP_10
                updateData[30] = line.substring(220, 227);  // SOIL_TEMP_20
                updateData[31] = line.substring(228, 235);  // SOIL_TEMP_50
                updateData[32] = line.substring(236, 243);  // SOIL_TEMP_100

                numberOfUpdates++;
            }
        } catch (FileNotFoundException ex) {
            Logger.getLogger(XMLParser.class.getName()).log(Level.SEVERE, null, ex);
            System.err.println("File not found.");
            System.exit(1);
        } catch (IOException ex) {
            Logger.getLogger(XMLParser.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
