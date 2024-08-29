<%-- 
    Document   : change_pass
    Created on : Mar 15, 2023, 4:08:50 PM
    Author     : keshav bansal
--%>

<%@page contentType="text/html" import='javax.servlet.http.Cookie,java.sql.*' pageEncoding="UTF-8"%>

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
        if (email == null) {
            response.sendRedirect("index.jsp");
        } else {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery("select * from details where email='" + email + "'");
                if (rs.next()) {
%>  
<!DOCTYPE HTML>
<html>
    <head>
        <title><%=rs.getString("fname")+" "+rs.getString("lname")%></title>
        <link rel="icon" type="image/x-icon" href="img/icon.png">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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

            $(document).on("click",".btn.btn-danger",function(){
                var cep = $("#cep").val();
                var nep = $("#nep").val();
                var rep = $("#rep").val();
                if(rep != nep){
                   $("#umsg").html("");
                   $("#umsg").css("background-color","white");
                   $("#main").html("New And Retype Password Not Match...");
                }
                else{
                    $.post(
                        "changepass.jsp", {cp:cep ,np: nep , rp:rep}, function(data) {
                            data = data.trim();
                            if( data == "success"){
                                $("#main").html("");
                                $("#umsg").html("Password Update");
                                $("#umsg").css("background-color","#e6ffe6");
                                $("#umsg").css("color","black");
                                $("#umsg").css("padding","10px");
                                $("#umsg").css("width","100%");
                                $("#umsg").css("margin-bottom","10px");
                                $("#umsg").css("font-family","serif");
                                $("#umsg").css("text-align","center");
                            }
                            if( data == "invalid"){
                                $("#main").html("");
                                $("#umsg").html("Current Password Is Incorrect");
                                $("#umsg").css("background-color","#f8b9c6");
                                $("#umsg").css("color","black");
                                $("#umsg").css("width","100%");
                                 $("#umsg").css("padding","10px");
                                 $("#umsg").css("margin-bottom","10px");
                                $("#umsg").css("font-family","serif");
                                $("#umsg").css("text-align","center");
                            }
                            
                        }
                        );
                }
                     
                     
                });
                
            
        </script>
    </head>
    <body>
        <!-- ============================  Navigation Start =========================== -->
        <%@include file="nav.jsp" %>
        <!-- ============================  Navigation End ============================ -->
        <div class="grid_3">
            <div class="container">
                <div class="breadcrumb1">
                    <ul>
                        <a href="index.html"><i class="fa fa-home home_1"></i></a>
                        <span class="divider">&nbsp;|&nbsp;</span>
                        <li class="current-page">View Profile</li>
                    </ul>
                </div>
                <div class="profile">
                    <div class="col-md-8 profile_left">
                        <%
                            if (request.getParameter("empty") != null) {
                                out.println("<div class='alert alert-danger' style='width:100%' align='center'>All Field Required</div>");
                            } else if (request.getParameter("mismatch") != null) {
                                out.println("<div class='alert alert-danger' style='width:100%' align='center'>New And Current Password Not Match</div>");
                            } else if (request.getParameter("invalid_pass") != null) {
                                out.println("<div class='alert alert-danger' style='width:100%' align='center'>Current Password Is Incorrect</div>");
                            }

                        %> 
                        <h2>Profile : <%=rs.getString("code")%></h2>
                        <div class="col_3">
                            <div class="col-sm-4 row_2">
                                <div class="flexslider">
                                    <ul class="slides">
                                        <li data-thumb="upload/<%=rs.getString("code")%>.jpg" style="widht:50%;height: 50%" class="img">
                                            <img src="upload/<%=rs.getString("code")%>.jpg" />
                                        </li>
                                        <%
                                            int count = 0;
                                            PreparedStatement psi = cn.prepareStatement("select * from userdata where usercode=? order by RAND()");
                                            psi.setString(1, rs.getString("code"));
                                            ResultSet rsi = psi.executeQuery();
                                            while (rsi.next()) {
                                        %>
                                        <li data-thumb="upload/<%=rsi.getString("usercode")%>/<%=rsi.getString("code")%>.jpg">
                                            <img src="upload/<%=rsi.getString("usercode")%>/<%=rsi.getString("code")%>.jpg">   
                                        </li>
                                        <%
                                                count++;
                                                if (count == 3) {
                                                    break;
                                                }
                                            }
                                        %>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-sm-8 row_1">
                                    <div id="umsg"></div>
                                    <label>Current Password:</label> <input id="cep" type="password" name='cp' required class='form-control'><br>
                                    <label>New Password: </label><input id="nep" type="password" name='np' required class='form-control'><br>
                                    <label>Retype Password: </label><input id="rep" type="password" name='rp' required class='form-control'><br>
                                    <div id="main" style="color:red;font-family: serif;font-size: 15px;margin-left: 10px;margin-top: -15px"></div>
                                    <div><lable><button type="text" class="btn btn-danger">Submit</button></lable></div>
                                

                            </div>
                            <div class="clearfix"> </div>
                        </div>

                    </div>
                    <div class="col-md-4 profile_right">
                        <div class="newsletter">
                            <form method="post" ACTION="search_user.jsp">
                                <input type="text" name="search" size="30" required="" placeholder="Search by Name and Code:">
                                <input type="submit" value="Go">
                            </form>
                        </div>
                        <div class="view_profile">
                            <h3>View Similar Profiles</h3>
                            <%
                                int count1 = 0;
                                PreparedStatement psp = cn.prepareStatement("select * from details where gender<>? AND caste=? order by RAND()");
                                psp.setString(1, rs.getString("gender"));
                                psp.setString(2, rs.getString("caste"));
                                ResultSet rsp = psp.executeQuery();
                                while (rsp.next()) {
                            %>
                            <ul class="profile_item">

                                <li class="profile_item-img">
                                    <img src="upload/<%=rsp.getString("code")%>.jpg" class="img-responsive" style="width:100px;height: 100px">
                                </li>
                                <li class="profile_item-desc">
                                    <h4><%=rsp.getString("fname")%> <%=rsp.getString("lname")%></h4>
                                    <p><%=rsp.getString("email")%></p><br>
                                    <a href="view_profile.jsp?id=<%=rsp.getString("code")%>"><div class="vertical">View Profile</div></a>
                                </li>
                                <div class="clearfix"> </div>

                            </ul>

                            <%
                                    count1++;
                                    if (count1 == 4) {
                                        break;
                                    }
                                }
                            %>
                        </div>
                        <div class="view_profile view_profile1">
                            <h3>Members who viewed this profile also viewed</h3>
                            <%
                                int count2 = 0;
                                PreparedStatement psv = cn.prepareStatement("select * from viewed where viewuser=? order by RAND()");
                                psv.setString(1, rs.getString("code"));
                                ResultSet rsv = psv.executeQuery();
                                while (rsv.next()) {
                                    PreparedStatement pspp = cn.prepareStatement("select * from details where email=?");
                                    pspp.setString(1, rsv.getString("byuser"));
                                    ResultSet rspp = pspp.executeQuery();
                                    while (rspp.next()) {
                            %>
                            <ul class="profile_item">
                                <li class="profile_item-img">
                                    <img src="upload/<%=rspp.getString("code")%>.jpg" class="img-responsive" style="width:100px;height: 100px">
                                </li>
                                <li class="profile_item-desc">
                                    <h4><%=rspp.getString("fname")%> <%=rspp.getString("lname")%></h4>
                                    <p><%=rspp.getString("email")%></p><br>
                                    <a href="view_profile.jsp?id=<%=rspp.getString("code")%>"><div class="vertical">View Profile</div></a>
                                </li>
                                <div class="clearfix"> </div>

                            </ul>
                            <%
                                        count2++;
                                        if (count2 == 4) {
                                            break;
                                        }
                                    }
                                }
                            %>

                        </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <div class="map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d3150859.767904157!2d-96.62081048651531!3d39.536794757966845!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1408111832978"> </iframe>
        </div>
        <%@include file="footer.jsp" %>
        <!-- FlexSlider -->
        <script defer src="js/jquery.flexslider.js"></script>
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
        <script>
            // Can also be used with $(document).ready()
            $(window).load(function() {
            $('.flexslider').flexslider({
            animation: "slide",
            controlNav: "thumbnails"
            });
            });
        </script>   
    </body>
</html>	

<%
                } else {
                    response.sendRedirect("index.jsp?invalid=1");
                }

            } catch (Exception er) {
                out.println(er.getMessage());
            }
        }
    } catch (Exception er) {
        response.sendRedirect("index.jsp");
    }
%>