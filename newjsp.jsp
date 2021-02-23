<%-- 
    Document   : newjsp
    Created on : 26 Feb, 2018, 12:30:59 PM
    Author     : shri
--%>

<%@page import="org.json.JSONArray"%>
<%@page import="connection.DBConnection"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession httpSession = request.getSession(false);
            try {
                if (httpSession.getAttribute("username") == null) {
                    response.sendRedirect("login.html?message='expired'");
                }
            } catch (Exception e) {
                response.sendRedirect("login.html?message='expired'");
            }
            try {

                String username = httpSession.getAttribute("username").toString();
                httpSession.setAttribute("username", username);
                JSONArray jsonArray = new JSONArray();
                JSONArray jsonArray1 = new JSONArray();
                JSONObject json = new JSONObject();
                JSONObject json1;
                DBConnection db = new DBConnection();
                DBConnection db1 = new DBConnection();
                String sql = "Select * from tbl_bins";
                ResultSet rs = db.Select(sql);
                while (rs.next()) {
                    if (rs.getString("status").equals("2") || rs.getString("status").equals("1")) {
                        json1 = new JSONObject();
                        double lat = Double.parseDouble(rs.getString("latitude"));
                        double lon = Double.parseDouble(rs.getString("longitude"));
                        json1.put("lat", lat);
                        json1.put("lng", lon);
                        jsonArray.put(json1);
                    }
                }
                System.out.println(jsonArray);
                String sql1 = "Select * from tbl_vehicle";
                ResultSet r = db1.Select(sql1);
                while (r.next()) {
                    json1 = new JSONObject();
                    double lat1 = Double.parseDouble(r.getString("latitude"));
                    double lon1 = Double.parseDouble(r.getString("longitude"));
                    json1.put("lat", lat1);
                    json1.put("lng", lon1);
                    jsonArray1.put(json1);
                }
                System.out.println(jsonArray1);

                for (int i = 0; i < jsonArray.length(); i++) {
                    JSONObject jsonObject1 = jsonArray.getJSONObject(i);
                    double lat = jsonObject1.getDouble("lat");
                    double lon = jsonObject1.getDouble("lon");
                    for (int j = 0; j < jsonArray1.length(); j++) {
                        JSONObject jsonObject2 = jsonArray.getJSONObject(j);
                        double lat1 = jsonObject2.getDouble("lat");
                        double lon1 = jsonObject2.getDouble("lon");
                        Double dist=
                    }
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

        %>

    </body>
</html>
