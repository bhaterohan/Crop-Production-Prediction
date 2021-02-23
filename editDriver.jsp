<%-- 
    Document   : editDriver
    Created on : 21 Jan, 2018, 1:21:39 PM
    Author     : shri
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="connection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Edit Driver Page</title>
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
                var id = document.form1.driverid.value;
                var email = document.form1.email.value;
                var fname = document.form1.fname.value;
                var lname = document.form1.lname.value;
                var mobile = document.form1.mobile.value;
                var address = document.form1.address.value;
                var adhar = document.form1.adhar.value;
                var license = document.form1.license.value;
                var dob = document.form1.dob.value;
                var file = document.form1.file.value;
                if (id == 0) {
                    alert("Please insert bin ID");
                    document.form1.driverid.focus();
                    return false;
                }
                if (email == 0) {
                    alert("Please insert email");
                    document.form1.email.focus();
                    return false;
                }
                if (fname == 0) {
                    alert("Please insert First name");
                    document.form1.fname.focus();
                    return false;
                }
                if (lname == 0) {
                    alert("Please insert Last Name");
                    document.form1.lanme.focus();
                    return false;
                }
                if (mobile == 0) {
                    alert("Please insert mobile number");
                    document.form1.mobile.focus();
                    return false;
                }
                if (address == 0) {
                    alert("Please insert Address");
                    document.form1.addres.focus();
                    return false;
                }
                if (adhar == 0) {
                    alert("Please insert Adhar Number");
                    document.form1.adhar.focus();
                    return false;
                }
                if (license == 0) {
                    alert("Please insert Latitude Point");
                    document.form1.license.focus();
                    return false;
                }
                if (dob == 0) {
                    alert("Please insert Date of Birth");
                    document.form1.dob.focus();
                    return false;
                }
                if (file == 0) {
                    alert("Please insert Profile image");
                    document.form1.file.focus();
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
                        <li class="breadcrumb-item"><a href="home.jsp">Home</a><i class="fa fa-angle-right"></i>Driver<i class="fa fa-angle-right"></i>Add new driver</li>
                    </ol>
                    <!--grid-->
                    <div class="validation-system">
                        <div class="validation-form">
                            <!---->
                            <form name="form1" id="form1" action="EditDriver" method="post" enctype="multipart/form-data" onsubmit="return myValidation()">
                                <%
                                    DBConnection db = new DBConnection();
                                    String sql = "Select * from tbl_driver where driver_id='" + id + "'";
                                    ResultSet rs = db.Select(sql);
                                    while (rs.next()) {
                                %>
                                <div class="vali-form">
                                    <div class="col-md-6 form-group1">
                                        <label class="control-label">Driver ID</label>
                                        <input type="text" value="<%=rs.getString("driver_id")%>" name="driverid" id="driverid" required="Driver ID">
                                    </div>
                                    <div class="col-md-6 form-group1 form-last">
                                        <label class="control-label">Email ID</label>
                                        <input type="text" value="<%=rs.getString("email")%>" name="email" id="email" required="Email ID" >
                                    </div>
                                    <div class="clearfix"> </div>
                                </div> 
                                <div class="vali-form">
                                    <div class="col-md-6 form-group1">
                                        <label class="control-label">First Name</label>
                                        <input type="text" value="<%=rs.getString("fname")%>" name="fname" id="fname" required="First Name">
                                    </div>
                                    <div class="col-md-6 form-group1 form-last">
                                        <label class="control-label">Last Name</label>
                                        <input type="text" value="<%=rs.getString("lname")%>" name="lname" id="lname" required="Last Name">
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                                <div class="vali-form">
                                    <div class="col-md-6 form-group1">
                                        <label class="control-label">Mobile</label>
                                        <input type="text" value="<%=rs.getString("mobile")%>" name="mobile" id="mobile" required="Mobile Number">
                                    </div>
                                    <div class="col-md-6 form-group1 form-last">
                                        <label class="control-label">Address</label>
                                        <input type="text" value="<%=rs.getString("address")%>" name="address" id="address" required="Address">
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                                <div class="vali-form">
                                    <div class="col-md-6 form-group1">
                                        <label class="control-label">Adhar Number</label>
                                        <input type="text" value="<%=rs.getString("adhar")%>" name="adhar" id="adhar" required="Adhar Number">
                                    </div>
                                    <div class="col-md-6 form-group1 form-last">
                                        <label class="control-label">License Number </label>
                                        <input type="text" value="<%=rs.getString("license")%>" name="license" id="license" required="License Number">
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                                <div class="vali-form">
                                    <div class="col-md-6 form-group1">
                                        <label class="control-label">Date of Birth</label>
                                        <input type="date" value="<%=rs.getString("dob")%>" name="dob" id="dob" required="Date of Birth">
                                    </div>
                                    <div class="col-md-6 form-group1 form-last">
                                        <label class="control-label">Profile Photo </label>
                                        <input type="file"  name="file" id="file" required="File required">
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                                <%}%>
                                <div class="col-md-12 form-group">
                                    <input type="submit" class="btn btn-primary" value="Save">
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

