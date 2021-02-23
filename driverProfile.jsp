<%-- 
    Document   : driverProfile
    Created on : 23 Jan, 2018, 3:17:37 PM
    Author     : shri
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="connection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <%
            HttpSession httpSession = request.getSession(false);
            try {
                if (httpSession.getAttribute("username") == null) {
                    response.sendRedirect("login.jsp?message='expired'");
                }
            } catch (Exception e) {
                response.sendRedirect("login.jsp?message='expired'");
            }
            String username = httpSession.getAttribute("username").toString();
            httpSession.setAttribute("username", username);

            String email = request.getParameter("email_id");

            try {
                DBConnection db = new DBConnection();
                String sql = "Select * from tbl_driver where email='" + email + "'";
                ResultSet rs = db.Select(sql);
                if (rs.next()) {
                    String imgPath = rs.getString("imgPath");
                    String output = "<div class='row'><div class='col-md-3 col-lg-3' align='center'> <img src='" + imgPath + "' alt='User Pic' class='img-circle img-responsive'> </div>";
                    output += "<div class=' col-md-9 col-lg-9 '> <table class='table table-user-information'>";
                    output += "<tbody><tr><td>Name:</td><td>" + rs.getString("fname") + "</td></tr><tr><td>Last Name</td><td>" + rs.getString("lname") + "</td></tr><tr>";
                    output += "<td>Contact Number</td><td>" + rs.getString("mobile") + "</td></tr><tr><td>Date of Birth</td><td>" + rs.getString("dob") + "</td></tr>";
                    output += "<tr><td>Adhar Number</td><td>" + rs.getString("adhar") + "</td></tr><tr><td>Address</td><td>" + rs.getString("address") + "</td>";
                    output += "</tr><tr><td>Email</td><td><a href='#'>" + email + "</a></td></tr><tr><td>License Number</td><td>" + rs.getString("license") + "</td></tr>";
                    output += "</tbody></table></div></div>";
                    out.println(output);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        %>

