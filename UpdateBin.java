/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import connection.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dinesh
 */
public class UpdateBin extends HttpServlet {

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
        try {
            /* TODO output your page here. You may use following sample code. */
            PrintWriter out = response.getWriter();

            int bin1 = Integer.parseInt(request.getParameter("field1"));
            int bin2 = Integer.parseInt(request.getParameter("field2"));
            int bin3 = Integer.parseInt(request.getParameter("field3"));

            DBConnection db = new DBConnection();

            String sql = "";
            //update bin1 id 
            if (bin1 < 4) {
                sql = "update tbl_bins set status='2' where bin_id=112";
            } else if (bin1 >= 4 && bin1 < 6) {
                sql = "update tbl_bins set status='1' where bin_id=112";
            } else {
                sql = "update tbl_bins set status='0' where bin_id=112";
            }
            int i = db.Insert(sql);

            //update bin2
            if (bin2 < 3) {
                sql = "update tbl_bins set status='2' where bin_id=113";
            } else if (bin2 >= 3 && bin2 < 5) {
                sql = "update tbl_bins set status='1' where bin_id=113";
            } else {
                sql = "update tbl_bins set status='0' where bin_id=113";
            }
            i = db.Insert(sql);
            //update bin3
            if (bin3 < 3) {
                sql = "update tbl_bins set status='2' where bin_id=114";
            } else if (bin3 >= 3 && bin3 < 5) {
                sql = "update tbl_bins set status='1' where bin_id=114";
            } else {
                sql = "update tbl_bins set status='0' where bin_id=114";
            }
            i = db.Insert(sql);
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
