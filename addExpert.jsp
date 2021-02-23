<%-- 
    Document   : addDriver
    Created on : 21 Jan, 2018, 10:35:44 AM
    Author     : shri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Add Expert Page</title>
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
              
                var fname = document.form1.fname.value;
                var lname = document.form1.lname.value;
                var mobile = document.form1.mobile.value;
                var address = document.form1.address.value;
               var education = document.form1.education.value;
                
                
                
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
                if (education == 0) {
                    alert("Please insert Education");
                    document.form1.education.focus();
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
                            <form name="form1" id="form1" action="AddDriver" method="post"  onsubmit="return myValidation()">
                                   
                                </div> 
                                <div class="vali-form">
                                    <div class="col-md-6 form-group1">
                                        <label class="control-label">First Name</label>
                                        <input type="text" placeholder="First Name" name="fname" id="fname" required="First Name">
                                    </div>
                                    <div class="col-md-6 form-group1 form-last">
                                        <label class="control-label">Last Name</label>
                                        <input type="text" placeholder="Last Name" name="lname" id="lname" required="Last Name">
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                                <div class="vali-form">
                                    <div class="col-md-6 form-group1">
                                        <label class="control-label">Mobile</label>
                                        <input type="text" placeholder="Mobile Number" name="mobile" id="mobile" required="Mobile Number">
                                    </div>
                                    <div class="col-md-6 form-group1 form-last">
                                        <label class="control-label">Address</label>
                                        <input type="text" placeholder="Address" name="address" id="address" required="Address">
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                              <div class="vali-form">
                                    <div class="col-md-6 form-group1">
                                        <label class="control-label">Education</label>
                                        <input type="text" placeholder="Education" name="education" id="education" required="Education">
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

