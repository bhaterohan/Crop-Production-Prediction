/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import connection.DBConnection;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


/**
 *
 * @author shri
 */
public class AddDriver extends HttpServlet {

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

            String fname =request.getParameter("fname");
            String lname =request.getParameter("lname");
            String mobile = request.getParameter("mobile");
            String address = request.getParameter("address");
            String education = request.getParameter("education");
           
            DBConnection db = new DBConnection();
//            String sql = "Select * from tbl_bins where bin_id=" + id + " and area='" + area + "'";
//            ResultSet rs = db.Select(sql);
//            if (rs.next()) {
//                httpSession.setAttribute("username", username);
//                out.println("<script type=\"text/javascript\">");
//                out.println("alert('Bin is already exixted!');");
//                out.println("location='addBin.jsp';");
//                out.println("</script>");
//                return;
//            } else {
                String query = "Insert into tbl_expert(fname,lname,mobile,address,education)values('"+fname+"','" + lname + "','" + mobile + "','" + address + "','" + education + "')";
                int result = db.Insert(query);
                if (result > 0) {
                    httpSession.setAttribute("username", username);
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Expert is added successfully!');");
                    out.println("location='showExpert.jsp';");
                    out.println("</script>");
                    return;
                }else{
                    httpSession.setAttribute("username", username);
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Something went wrong!');");
                    out.println("location='addExpert.jsp';");
                    out.println("</script>");
                    return;
                
            }
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
