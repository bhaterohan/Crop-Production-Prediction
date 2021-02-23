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
import javax.servlet.http.HttpSession;

/**
 *
 * @author shri
 */
public class EditVehicle extends HttpServlet {

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
        try{
            HttpSession httpSession = request.getSession(false);
            String username = httpSession.getAttribute("username").toString();
            DBConnection db=new DBConnection();

            int id =Integer.parseInt(request.getParameter("vehicleid").toString());
            String num = request.getParameter("vnumber");
            String type = request.getParameter("type");
            
            String sql="Update tbl_vehicle set vehicle_no='"+num+"',type='"+type+"' where vehicle_id="+id+"";
            int result=db.Update(sql);
            if(result>0){
                httpSession.setAttribute("username", username);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Vehicle details Updated!');");
                out.println("location='showVehicle.jsp';");
                out.println("</script>");
                return;
            }else{
                httpSession.setAttribute("username", username);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Vehicle details cannot Updated!');");
                out.println("location='editVehicle.jsp?id="+id+"';");
                out.println("</script>");
                return;
            }
        }catch(Exception e){
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
