<%-- 
    Document   : showBin
    Created on : Jan 20, 2018, 2:09:40 AM
    Author     : PTPL-02
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Show Farmer Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Pooled Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
        <!-- Custom CSS -->
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <link rel="stylesheet" href="css/morris.css" type="text/css"/>
        <!-- Graph CSS -->
        <link href="css/font-awesome.css" rel="stylesheet"> 
        <!-- jQuery -->
        <script src="js/jquery-2.1.4.min.js"></script>
        <!-- //jQuery -->
        <!-- tables -->
        <link rel="stylesheet" type="text/css" href="css/table-style.css" />
        <link rel="stylesheet" type="text/css" href="css/basictable.css" />
        <script type="text/javascript" src="js/jquery.basictable.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#table').basictable();

                $('#table-breakpoint').basictable({
                    breakpoint: 768
                });

                $('#table-swap-axis').basictable({
                    swapAxis: true
                });

                $('#table-force-off').basictable({
                    forceResponsive: false
                });

                $('#table-no-resize').basictable({
                    noResize: true
                });

                $('#table-two-axis').basictable();

                $('#table-max-height').basictable({
                    tableWrapper: true
                });
            });
        </script>
        <!-- //tables -->
        <link href='//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'/>
        <link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <!-- lined-icons -->
        <link rel="stylesheet" href="css/icon-font.min.css" type='text/css' />
        <!-- //lined-icons -->
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
            httpSession.setAttribute("username", username);
        %>

    </head> 
    <body>
        <div class="page-container">
            <!--/content-inner-->
            <div class="left-content">
                <div class="mother-grid-inner">
                    <!--header start here-->

                    <!--heder end here-->
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="home.jsp">Home</a><i class="fa fa-angle-right"></i>Bins <i class="fa fa-angle-right"></i>Show bins</li>
                    </ol>
                    <div class="agile-grids">	
                        <!-- tables -->
                        <%
                            DBConnection db = new DBConnection();
                            String sql = "Select * from tbl_farmer";
                            ResultSet rs = null;
                            rs = db.Select(sql);
                        %>
                        <div class="agile-tables">
                            <div class="w3l-table-info">
                                <h2>Farmers Information</h2><button class="btn-secondary"><a href="./DistanceCalculate1">Scheduling</a></button>
                                <table id="table">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Mobile</th>
                                            <th>Village</th>
                                            <th>Area</th>
                                            <th>Family</th>
                                            <th>Edit</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% while (rs.next()) {%>
                                        <tr>
                                            <td><%=rs.getString("name")%></td>
                                            <td><%=rs.getString("mobile")%></td>
                                            <td><%=rs.getString("village")%></td>
                                            <td><%=rs.getString("area")%></td>
                                            <td><%=rs.getString("family")%></td>
                                            <td><a href="editBin.jsp?id=<%=rs.getString("id")%>"> <i class="fa fa-edit"></i></a></td>
                                            <td><a href="deleteBin.jsp?id=<%=rs.getString("id")%>" onclick="if (!confirm('Are you sure?')) {
                                                        return false
                                                    }"> <i class="fa fa-remove"></i></a></td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>                           
                        </div>
                        <!-- //tables -->
                    </div>
                    <!-- script-for sticky-nav -->
                    <script>
                        $(document).ready(function () {
                            var navoffeset = $(".header-main").offset().top;
                            $(window).scroll(function () {
                                var scrollpos = $(window).scrollTop();
                                if (scrollpos >= navoffeset) {
                                    $(".header-main").addClass("fixed");
                                } else {
                                    $(".header-main").removeClass("fixed");
                                }
                            });

                        });
                    </script>
                    <!-- /script-for sticky-nav -->
                    <!--inner block start here-->
                    <div class="inner-block">

                    </div>
                    <!--inner block end here-->
                    <!--copy rights start here-->

                    <!--copy rights start here-->
                    <div class="copyrights">
                        <p>© 2016 Pooled. All Rights Reserved | Design by  <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
                    </div>	
                    <!--COPY rights end here-->
                </div>
            </div>
            <!--//content-inner-->
            <!--/sidebar-menu-->
            <div class="sidebar-menu">
                <header class="logo1">
                    <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> 
                </header>
                <div style="border-top:1px ridge rgba(255, 255, 255, 0.15)"></div>
                <div class="menu">
                    <ul id="menu" >
                        <li><a href="home.jsp"><i class="fa fa-tachometer"></i> <span>Dashboard</span><div class="clearfix"></div></a></li>

                        <li id="menu-academico" ><a href="#"><i class="fa fa-list-ul" aria-hidden="true"></i><span> Farmers</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
                            <ul id="menu-academico-sub" >
                                <li id="menu-academico-avaliacoes" ><a href="addFarmer.jsp">Add Farmers</a></li>
                                <li id="menu-academico-avaliacoes" ><a href="showFarmers.jsp">Show Farmers</a></li>
                            </ul>
                        </li>
                        <li id="menu-academico" ><a href="#"><i class="fa fa-users" aria-hidden="true"></i><span> Experts</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
                            <ul id="menu-academico-sub" >
                                <li id="menu-academico-avaliacoes" ><a href="addExpert.jsp">Add Expert</a></li>
                                <li id="menu-academico-avaliacoes" ><a href="showExpert.jsp">Show Expert</a></li>
                            </ul>
                        </li>
                        
                        
                        <li><a href="logout.jsp"><i class="fa fa-sign-out"></i> <span>Logout</span><div class="clearfix"></div></a></li>

                    </ul>
                </div>
            </div>
            <div class="clearfix"></div>		
        </div>
        <script>
            var toggle = true;

            $(".sidebar-icon").click(function () {
                if (toggle)
                {
                    $(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
                    $("#menu span").css({"position": "absolute"});
                } else
                {
                    $(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
                    setTimeout(function () {
                        $("#menu span").css({"position": "relative"});
                    }, 400);
                }

                toggle = !toggle;
            });
        </script>
        <!--js -->
        <script src="js/jquery.nicescroll.js"></script>
        <script src="js/scripts.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>
        <!-- /Bootstrap Core JavaScript -->	   

    </body>
</html>
