<%-- 
    Document   : deleteVehicle
    Created on : 23 Jan, 2018, 12:24:10 PM
    Author     : shri
--%>

<%@page import="connection.DBConnection"%>
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
            String username = httpSession.getAttribute("username").toString();

            String id = request.getParameter("id");
            DBConnection db = new DBConnection();
            String sql = "Delete from tbl_vehicle where vehicle_id='" + id + "'";
            int result = db.Update(sql);
            if (result > 0) {
                httpSession.setAttribute("username", username);
                out.println("<script>");
                out.println("alert('Vehicle is removed');");
                out.println("location='showVehicle.jsp'");
                out.println("</script>");
            } else {
                httpSession.setAttribute("username", username);
                out.println("<script>");
                out.println("alert('Vehicle cannot deleted');");
                out.println("location='showVehicle.jsp'");
                out.println("</script>");
            }

        %>
    </body>
</html>
