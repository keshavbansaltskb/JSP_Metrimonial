<%-- 
    Document   : login.jsp
    Created on : Mar 15, 2023, 3:56:54 PM
    Author     : keshav bansal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    try {
        Cookie c[] = request.getCookies();
        String email = null;
        for (int i = 0; i < c.length; i++) {
            if (c[i].getName().equals("login")) {
                email = c[i].getValue();
                break;
            }
        }
        if (email != null) {
            response.sendRedirect("profile.jsp");
        } else {
            
            
%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Matrimonial Website</title>
         <link rel="icon" type="image/x-icon" href="img/icon.png">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset =utf-8" />
        <meta name="keywords" content="Marital Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <link href="css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css' />
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- Custom Theme files -->
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <link href='//fonts.googleapis.com/css?family=Oswald:300,400,700' rel='stylesheet' type='text/css'>
        <link href='//fonts.googleapis.com/css?family=Ubuntu:300,400,500,700' rel='stylesheet' type='text/css'>
        <!----font-Awesome----->
        <link href="css/font-awesome.css" rel="stylesheet"> 
        <!----font-Awesome----->
        <script>
            $(document).ready(function() {
                $(".dropdown").hover(
                        function() {
                            $('.dropdown-menu', this).stop(true, true).slideDown("fast");
                            $(this).toggleClass('open');
                        },
                        function() {
                            $('.dropdown-menu', this).stop(true, true).slideUp("fast");
                            $(this).toggleClass('open');
                        }
                );
            });
        </script>
    </head>
    <body>
        <!-- ============================  Navigation Start =========================== -->
        <div class="navbar navbar-inverse-blue navbar">
            <!--<div class="navbar navbar-inverse-blue navbar-fixed-top">-->
            <div class="navbar-inner navbar-inner_1">
                <div class="container">
                    <div class="navigation">
                        <nav id="colorNav">
                            <ul>
                                <li class="green">
                                    <a href="#" class="icon-home"></a>
                                    <ul>
                                        <li><a href="login.jsp">Login</a></li>
                                        <li><a href="signup.jsp">Register</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <a class="brand" href="index.jsp"><img src="images/logo.png" alt="logo"></a>
                    <div class="pull-right">
                        <nav class="navbar nav_bottom" role="navigation">

                            <!-- Brand and toggle get grouped for better mobile display -->
                            <div class="navbar-header nav_2">
                                <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">Menu
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand" href="#"></a>
                            </div> 
                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
                                
                            </div><!-- /.navbar-collapse -->
                        </nav>
                    </div> <!-- end pull-right -->
                    <div class="clearfix"> </div>
                </div> <!-- end container -->
            </div> <!-- end navbar-inner -->
        </div> <!-- end navbar-inverse-blue -->
        <!-- ============================  Navigation End ============================ -->
        <div class="grid_3">
            <div class="container">
                
                <div class="services">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">
                        <div class="breadcrumb1">
                    <ul>
                        <a href="index.html"><i class="fa fa-home home_1"></i></a>
                        <span class="divider">&nbsp;|&nbsp;</span>
                        <li class="current-page">Login</li>
                    </ul>
                </div>
                         <%
                            if (request.getParameter("invalid") != null) {
                                out.println("<div class='alert alert-danger' style='width:100%' align='center'>Email Not Found</div>");
                            } else if (request.getParameter("invalid_pass") != null) {
                                out.println("<div class='alert alert-danger' style='width:100%' align='center'>Password Is Incorrect</div>");
                            } 

                        %>
                        <form method="post" action="check.jsp">
                            <div class="form-item form-type-textfield form-item-name">
                                <label for="edit-name">Email <span class="form-required" title="This field is required.">*</span></label>
                                <input type="text" id="edit-name" name="email" class="form-text required">
                            </div>
                            <div class="form-item form-type-password form-item-pass">
                                <label for="edit-pass">Password <span class="form-required" title="This field is required.">*</span></label>
                                <input type="password" id="edit-pass" name="pass" size="60" maxlength="128" class="form-text required">
                            </div>
                            <div class="form-actions">
                                <input type="submit" id="edit-submit" name="op" value="Log in" class="btn_1 submit">
                            </div>
                        </form>
                    </div>
                        <div class="col-sm-3"></div>
                    
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <div class="map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d3150859.767904157!2d-96.62081048651531!3d39.536794757966845!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1408111832978"> </iframe>
        </div>
       <%@include file="footer.jsp" %>
    </body>
</html>

<%

            
        }
    } catch (Exception er) {
        response.sendRedirect("index.jsp");
    }
%>