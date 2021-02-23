<%-- 
    Document   : deleteDriver
    Created on : 21 Jan, 2018, 1:39:37 PM
    Author     : shri
--%>

<%@page import="connection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Driver</title>
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
            String sql = "Delete from tbl_driver where driver_id='" + id + "'";
            int result = db.Update(sql);
            if (result > 0) {
                httpSession.setAttribute("username", username);
                out.println("<script>");
                out.println("alert('Driver is removed');");
                out.println("location='showDriver.jsp'");
                out.println("</script>");
            } else {
                httpSession.setAttribute("username", username);
                out.println("<script>");
                out.println("alert('Bin cannot deleted');");
                out.println("location='showDriver.jsp'");
                out.println("</script>");
            }

        %>
    </body>
</html>
