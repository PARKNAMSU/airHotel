package kg.air.cnc.common;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

@Component
public class I_mportGetPaymentInfo {

    public String getInfo(HttpServletRequest request, HttpServletResponse response, String accessToken, String requestURL) throws Exception{
        String paymentData = "";
        try {
            String requestString = "";
            URL url = new URL(requestURL);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setDoOutput(true);
            connection.setInstanceFollowRedirects(false);
            connection.setRequestMethod("GET");
            connection.setRequestProperty( "Authorization", accessToken);
            OutputStream os = connection.getOutputStream();
            connection.connect();
            StringBuilder sb = new StringBuilder();
            if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
                BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
                String line = null;
                while ((line = br.readLine()) != null) {
                    sb.append(line + "\n");
                }
                br.close();
                requestString = sb.toString();
            }
            os.flush();
            connection.disconnect();
            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObj = (JSONObject) jsonParser.parse(requestString);
            if ((Long) jsonObj.get("code") == 0) {
                JSONObject getPaymentData = (JSONObject) jsonObj.get("response");
                System.out.println("paymentData==>>" + getPaymentData.get("access_token"));
                paymentData = (String) getPaymentData.get("access_token");
            }
        } catch (Exception e) {
            e.printStackTrace();
            paymentData = "";
        }
        return paymentData;
    }
}
