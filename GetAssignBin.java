/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsonpackage;

import connection.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author shri
 */
public class GetAssignBin extends HttpServlet {

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
            double vehicleId = Double.parseDouble(request.getParameter("vehicleId"));

            JSONArray jsonArray = new JSONArray();
            JSONObject json = new JSONObject();
            JSONObject json1;
            DBConnection db = new DBConnection();
            String sql = "Select * from tbl_assign where vehicle_id='" + vehicleId + "'";
            ResultSet rs = db.Select(sql);
            while (rs.next()) {
                Double distance = Double.parseDouble(rs.getString("distance"));
                Double bin_id = Double.parseDouble(rs.getString("bin_id"));
                Double vehicle_id = Double.parseDouble(rs.getString("vehicle_id"));
                Double lat = Double.parseDouble(rs.getString("lat"));
                Double lon = Double.parseDouble(rs.getString("lon"));
                json1 = new JSONObject();
                json1.put("distance", distance);
                json1.put("bin_id", bin_id);
                json1.put("vehicle_id", vehicle_id);
                json1.put("lat", lat);
                json1.put("lng", lon);
                jsonArray.put(json1);
            }
            System.out.println("JsonArray"+jsonArray);
            json.put("GetAssignBin", jsonArray);
            json.put("success", 1);
            response.setContentType("application/json");
            response.getWriter().write(json.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
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
