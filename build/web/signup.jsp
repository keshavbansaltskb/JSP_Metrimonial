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
        <script>
            $(document).on("keyup", "#email", function() {
                var id = $("#email").val();
                var email = id.split("@");
                if(email[1]=="gmail.com"){
                    $.post(
                            "email_check.jsp",{id:email[0]},function(data){
                                data = data.trim();
                                if(data=="success"){
                                    $(".emailshow").show();
                                }
                                if(data=="error"){
                                    $(".emailshow").hide();
                                }
                            }
                    );
                }
            });
        </script>
        <style>
            .emailshow{
                margin-bottom:-10px;
                color:red;
                font-family: serif;
                font-size:15px;
                padding:5px;
            }
        </style>
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
                        <li class="current-page">Sign Up</li>
                    </ul>
                </div>
                        <form method='post' action='record.jsp'>

                            <label>First Name : </label><input  type='text' name='fname' required class='form-control'><br>
                            <label>Last Name : </label><input  type='text' name='lname' required class='form-control'><br>
                            <label>Email : </label><input  type='email' name='email' id="email" required class='form-control'>
                            <label class="emailshow" style="display:none">This email is already exist</label><br>
                            <label>Password : </label><input  type='password' name='pass' required class='form-control'><br>
                            <label>Gender: </label><select   name='gender' required class='form-control'>
                                <option value='Male'>Male</option>
                                <option value='Female'>Female</option></select><br>
                            <label>Caste : </label><select   name='caste' required class='form-control'>
                                <option value='Sharma'>Sharma</option>
                                <option value='Agarwal'>Agarwal</option>
                                <option value='Rajput'>Rajput</option>
                                <option value='Jat'>Jat</option>
                                <option value='Patel'>Patel</option>
                                <option value='Saini'>Saini</option>
                                <option value='Mehra'>Mehra</option>
                                <option value='Singh'>Singh</option>
                            </select><br>
                            <label>Religion: </label><select   name='religion' required class='form-control'>
                                <option value='Hindu'>Hindu</option>
                                <option value='Jain'>Jain</option>
                                <option value='Muslim'>Muslim</option>
                                <option value='Krishachan'>Krishchan</option>
                                <option value='Sikh'>Sikh</option>
                                <option value='Punjabi'>Punjabi</option>
                            </select><br>
                            <label>Occupation : </label><select   name='occupation' required class='form-control'>
                                <option value='Student'>Student</option>
                                <option value='Doctor'>Doctor</option>
                                <option value='Dentist'>Dentist</option>
                                <option value='Engineer'>Engineer</option>
                                <option value='Shopkeeper'>shopkeeper</option>
                                <option value='Teacher'>Teacher</option>
                            </select><br>
                            <label>Date of Birth : </label><input  type='date' name='birth' required class='form-control'><br>
                            <label>City: </label><select   name='city' required class='form-control'>
                                <option value='Alwar'>Alwar</option>
                                <option value='Bikaner'>Bikaner</option>
                                <option value='Dausa'>Dausa</option>
                                <option value='Kota'>Kota</option>
                                <option value='Jaipur'>Jaipur</option>
                                <option value='Bundi'>Bundi</option>
                            </select><br>
                            <label>State: </label><select   name='state' required class='form-control'>
                                <option value='Rajasthan'>Rajasthan</option>
                                <option value='Haryana'>Haryana</option>
                                <option value='Punjab'>Punjab</option>
                                <option value='Delhi'>Delhi</option>
                                <option value='Keral'>Keral</option>
                                <option value='UP'>UP</option>
                            </select><br>
                            <label>Country : </label><select   name='country' required class='form-control'>
                                <option value='India'>India</option>
                                <option value='USA'>USA</option>
                                <option value='China'>China</option>
                                <option value='Afganisthan'>Afganisthan</option>
                                <option value='Shri Lanka'>Shri Lanka</option>
                                <option value='Japan'>Japan</option>
                            </select><br>
                            <div class='ff'><label><button type="text" class="btn btn-danger">Submit</button></lable></div>
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

<%        }
    } catch (Exception er) {
        response.sendRedirect("index.jsp");
    }
%>