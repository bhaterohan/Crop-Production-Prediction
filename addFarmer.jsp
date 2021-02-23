<%-- 
    Document   : addBin
    Created on : Jan 19, 2018, 10:33:24 PM
    Author     : PTPL-02
--%>



<%@page import="connection.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Add Farmer Page</title>
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
                var name = document.form1.name.value;
                var mobile = document.form1.mobile.value;
                var village = document.form1.village.value;
                var area = document.form1.area.value;
                var family = document.form1.family.value;
                
                if (name == 0) {
                    alert("Please insert Farmer Name");
                    document.form1.name.focus();
                    return false;
                }
                if (mobile == 0) {
                    alert("Please insert Mobile Number");
                    document.form1.mobile.focus();
                    return false;
                }
                if (village == 0) {
                    alert("Please insert Village Name");
                    document.form1.village.focus();
                    return false;
                }
                if (area == 0) {
                    alert("Please insert Farming Area");
                    document.form1.area.focus();
                    return false;
                }
              
                  if (family == 0) {
                    alert("Please insert Family Members");
                    document.form1.family.focus();
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
            DBConnection db = new DBConnection();
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
                        <li class="breadcrumb-item"><a href="home.jsp">Home</a><i class="fa fa-angle-right"></i>Bins <i class="fa fa-angle-right"></i>Add new bin</li>
                    </ol>
                    <!--grid-->
                    <div class="validation-system">
                        <div class="validation-form">
                            <!---->
                            <form name="form1" id="form1" action="AddBin" method="post" onsubmit="return myValidation()">
                                <div class="vali-form">
                                    <div class="col-md-6 form-group1">
                                        <label class="control-label">Name</label>
                                        <input type="text" placeholder="name" name="name" id="name" required="Name">
                                    </div>
                                    <div class="col-md-6 form-group1 form-last">
                                        <label class="control-label">Mobile No</label>
                                        <input type="text" placeholder="Mobile No" name="mobile" id="mobile" required="Mobile No" >
                                    </div>
                                    <div class="clearfix"> </div>
                                </div> 
                                <div class="vali-form">
                                    <div class="col-md-6 form-group1">
                                        <label class="control-label">Village Name</label>
                                        <input type="text" placeholder="Village" name="village" id="village" required="Village Name">
                                    </div>
                                    <div class="col-md-6 form-group1 form-last">
                                        <label class="control-label">Farming Area</label>
                                        <input type="text" placeholder="Area" name="area" id="area" required="Farming Area">
                                    </div>
                                    <div class="clearfix"> </div>
                                </div> 
                                <div class="vali-form">
                                    <div class="col-md-6 form-group1">
                                        <label class="control-label">Family Members</label>
                                        <input type="text" placeholder="Family Members" name="family" id="family" required="Family Members">
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
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
        <!-- morris JavaScript -->	
        <script src="js/raphael-min.js"></script>
        <script src="js/morris.js"></script>

    </body>
</html>
