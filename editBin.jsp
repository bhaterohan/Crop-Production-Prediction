<%-- 
    Document   : editBin
    Created on : 21 Jan, 2018, 1:25:13 AM
    Author     : shri
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="connection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Add Bin Page</title>
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
        <link href='//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'/>
        <link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <!-- lined-icons -->
        <link rel="stylesheet" href="css/icon-font.min.css" type='text/css' />
        <!-- //lined-icons -->
        <script>
            function myValidation() {
                var id = document.form1.binid.value;
                var area = document.form1.area.value;
                var lat = document.form1.lat.value;
                var lon = document.form1.lon.value;
                if (id == 0) {
                    alert("Please insert bin ID");
                    document.form1.binid.focus();
                    return false;
                }
                if (area == 0) {
                    alert("Please insert area name");
                    document.form1.area.focus();
                    return false;
                }
                if (lat == 0) {
                    alert("Please insert Latitude Point");
                    document.form1.lat.focus();
                    return false;
                }
                if (lon == 0) {
                    alert("Please insert Latitude Point");
                    document.form1.lon.focus();
                    return false;
                }
                return true;
            }
        </script>
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
            String id = request.getParameter("id");
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
                        <li class="breadcrumb-item"><a href="home.jsp">Home</a><i class="fa fa-angle-right"></i>Bins <i class="fa fa-angle-right"></i>Edit bin</li>
                    </ol>
                    <!--grid-->
                    <div class="validation-system">
                        <div class="validation-form">
                            <!---->

                            <form name="form1" id="form1" action="EditBin" method="post" onsubmit="return myValidation()">
                                <%
                                    DBConnection db = new DBConnection();
                                    String sql = "Select * from tbl_bins where bin_id='" + id + "'";
                                    ResultSet rs = db.Select(sql);
                                    while (rs.next()) {
                                %>
                                <div class="vali-form">
                                    <div class="col-md-6 form-group1">
                                        <label class="control-label">Bin ID</label>
                                        <input type="text" value="<%=rs.getString("bin_id")%>" name="binid" id="binid" required="Bin ID">
                                    </div>
                                    <div class="col-md-6 form-group1 form-last">
                                        <label class="control-label">Area</label>
                                        <input type="text" value="<%=rs.getString("area")%>" name="area" id="area" required="Area/Location" >
                                    </div>
                                    <div class="clearfix"> </div>
                                </div> 
                                <div class="vali-form">
                                    <div class="col-md-6 form-group1">
                                        <label class="control-label">Latitude Point</label>
                                        <input type="text" value="<%=rs.getString("latitude")%>" name="lat" id="lat" required="Latitude Point">
                                    </div>
                                    <div class="col-md-6 form-group1 form-last">
                                        <label class="control-label">Longitude Point</label>
                                        <input type="text" value="<%=rs.getString("longitude")%>" name="lon" id="lon" required="Longitude Point">
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                                <%}%>
                                <div class="col-md-12 form-group">
                                    <input type="submit" class="btn btn-primary" value="Update">
                                    <button type="reset" class="btn btn-default">Reset</button>
                                </div>
                                <div class="clearfix"> </div>
                            </form>

                            <!---->
                        </div>

                    </div>
                    <!--//grid-->

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

                        <li id="menu-academico" ><a href="#"><i class="fa fa-list-ul" aria-hidden="true"></i><span> Bins</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
                            <ul id="menu-academico-sub" >
                                <li id="menu-academico-avaliacoes" ><a href="addBin.jsp">Add Bins</a></li>
                                <li id="menu-academico-avaliacoes" ><a href="showBins.jsp">Show Bins</a></li>
                            </ul>
                        </li>
                        <li id="menu-academico" ><a href="#"><i class="fa fa-users" aria-hidden="true"></i><span> Driver</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
                            <ul id="menu-academico-sub" >
                                <li id="menu-academico-avaliacoes" ><a href="addDriver.jsp">Add Driver</a></li>
                                <li id="menu-academico-avaliacoes" ><a href="showDriver.jsp">Show Details</a></li>
                            </ul>
                        </li>
                        <li id="menu-academico" ><a href="#"><i class="fa fa-truck" aria-hidden="true"></i><span>Vehicle</span> <span class="fa fa-angle-right" style="float: right"></span><div class="clearfix"></div></a>
                            <ul id="menu-academico-sub" >
                                <li id="menu-academico-avaliacoes" ><a href="addVehicle.jsp">Add Vehicle</a></li>
                                <li id="menu-academico-avaliacoes" ><a href="showVehicle.jsp">Show Details</a></li>
                            </ul>
                        </li>
                        <li><a href="assign.jsp"><i class="fa fa-tachometer"></i> <span>Assign Vehicle</span><div class="clearfix"></div></a></li>
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
        <!-- morris JavaScript -->	
        <script src="js/raphael-min.js"></script>
        <script src="js/morris.js"></script>

    </body>
</html>
