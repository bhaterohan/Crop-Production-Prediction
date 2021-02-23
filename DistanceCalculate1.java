/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import connection.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author shri
 */
public class DistanceCalculate1 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            HttpSession httpSession = request.getSession(false);
            String username = httpSession.getAttribute("username").toString();
            httpSession.setAttribute("username", username);
            JSONArray jsonArray = new JSONArray();
            JSONArray jsonArray1 = new JSONArray();
            JSONArray jsonArray2 = new JSONArray();
            JSONArray sortedJsonArray = new JSONArray();

            JSONObject json = new JSONObject();
            JSONObject json1;
            DBConnection db = new DBConnection();
            DBConnection db1 = new DBConnection();
            String sql = "Select * from tbl_bins";
            ResultSet rs = db.Select(sql);
            while (rs.next()) {
                if (rs.getString("status").equals("2") || rs.getString("status").equals("1")) {
                    json1 = new JSONObject();
                    int bin_id = Integer.parseInt(rs.getString("bin_id"));
                    double lat = Double.parseDouble(rs.getString("latitude"));
                    double lon = Double.parseDouble(rs.getString("longitude"));
                    json1.put("bin_id", bin_id);
                    json1.put("lat", lat);
                    json1.put("lng", lon);
                    jsonArray.put(json1);
                }
            }

            String sql1 = "Select * from tbl_vehicle";
            ResultSet r = db1.Select(sql1);
            while (r.next()) {
                json1 = new JSONObject();
                int id1 = Integer.parseInt(r.getString("vehicle_id"));
                double lat1 = Double.parseDouble(r.getString("latitude"));
                double lon1 = Double.parseDouble(r.getString("longitude"));
                json1.put("id", id1);
                json1.put("lat", lat1);
                json1.put("lng", lon1);
                jsonArray1.put(json1);
            }

            ///Distance calculate bin and vehicles
            ArrayList list1 = new ArrayList();
            for (int i = 0; i < jsonArray.length(); i++) {
                JSONObject jsonObject1 = jsonArray.getJSONObject(i);
                int bin_id = jsonObject1.getInt("bin_id");
                double lat = jsonObject1.getDouble("lat");
                double lon = jsonObject1.getDouble("lng");
                for (int j = 0; j < jsonArray1.length(); j++) {
                    JSONObject jsonObject2 = jsonArray1.getJSONObject(j);
                    int id1 = jsonObject2.getInt("id");
                    double lat1 = jsonObject2.getDouble("lat");
                    double lon1 = jsonObject2.getDouble("lng");
                    Double dist = distFrom(lat, lon, lat1, lon1);
                    json1 = new JSONObject();
                    json1.put("bin_id", bin_id);
                    json1.put("distance", dist);
                    json1.put("vehicle_id", id1);
                    json1.put("lat", lat);
                    json1.put("lng", lon);
                    list1.add(dist);
                    jsonArray2.put(json1);
                }
            }
            ///Json Array sorting small distance find out the bin and vehicle///
            Collections.sort(list1);
            for (int i = 0; i < list1.size(); i++) {
                Double dist1 = (Double) list1.get(i);
                for (int j = 0; j < jsonArray2.length(); j++) {
                    JSONObject jsonObject2 = jsonArray2.getJSONObject(j);
                    double dist = jsonObject2.getDouble("distance");
                    double bin_id = jsonObject2.getDouble("bin_id");
                    double vehicle_id = jsonObject2.getDouble("vehicle_id");
                    double lat = jsonObject2.getDouble("lat");
                    double lon = jsonObject2.getDouble("lng");
                    if (dist1 == dist) {
                        json1 = new JSONObject();
                        json1.put("bin_id", bin_id);
                        json1.put("distance", dist);
                        json1.put("vehicle_id", vehicle_id);
                        json1.put("lat", lat);
                        json1.put("lng", lon);
                        sortedJsonArray.put(json1);
                    }
                }
            }
            ///Assign bin to driver table Insert
            System.out.println("Sorted Array::" + sortedJsonArray);
            /* for (int i = 0; i < sortedJsonArray.length(); i++) {
                JSONObject jsonObject2 = jsonArray2.getJSONObject(i);
                double dist = jsonObject2.getDouble("distance");
                double bin_id = jsonObject2.getDouble("bin_id");
                double vehicle_id = jsonObject2.getDouble("vehicle_id");
                double lat = jsonObject2.getDouble("lat");
                double lon = jsonObject2.getDouble("lng");
                String qry = "Insert into tbl_assign(distance,bin_id,vehicle_id,lat,lon)values('" + dist + "','" + bin_id + "','" + vehicle_id + "','" + lat + "','" + lon + "')";
                int r1 = db1.Insert(qry);
            }*/
            for (int i = 0; i < sortedJsonArray.length(); i++) {
                JSONObject jsonObject = sortedJsonArray.getJSONObject(i);
                double dist = jsonObject.getDouble("distance");
                double bin_id = jsonObject.getDouble("bin_id");
                double vehicle_id = jsonObject.getDouble("vehicle_id");
                for (int j = 0; j < jsonArray2.length(); j++) {
                    JSONObject jsonObject2 = sortedJsonArray.getJSONObject(j);
                    double dist1 = jsonObject2.getDouble("distance");
                    double vehicle_id1 = jsonObject2.getDouble("vehicle_id");
                    double bin_id1 = jsonObject2.getDouble("bin_id");
                    if (dist < dist1 && vehicle_id != vehicle_id1 && bin_id == bin_id1) {
                        double lat = jsonObject.getDouble("lat");
                        double lon = jsonObject.getDouble("lng");
                        String qry = "Insert into tbl_assign(distance,bin_id,vehicle_id,lat,lon)values('" + dist + "','" + bin_id + "','" + vehicle_id + "','" + lat + "','" + lon + "')";
                        int r1 = db1.Insert(qry);
                    }

                }
            }

            httpSession.setAttribute("username", username);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Assign bin!');");
            out.println("location='showBins.jsp';");
            out.println("</script>");
            return;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static double distFrom(double lat1, double lng1, double lat2, double lng2) {
        double earthRadius = 6371; //Kilometers
        double dLat = Math.toRadians(lat2 - lat1);
        double dLng = Math.toRadians(lng2 - lng1);
        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
                + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2))
                * Math.sin(dLng / 2) * Math.sin(dLng / 2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        double dist = (double) (earthRadius * c);
        return dist;

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
