<%-- 
    Document   : search_user
    Created on : Jul 3, 2023, 1:42:08 PM
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
            String search = request.getParameter("search");
            try {

                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");

                
%> 


<!DOCTYPE HTML>
<html>
    <head>
        <title>Matrimonial Website</title>
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
        </script>
    </head>
    <body>
        <!-- ============================  Navigation Start =========================== -->
        <%@include file="nav.jsp" %>
        <!-- ============================  Navigation End ============================ -->
        <div class="grid_3">
            <div class="container">
                <%
                        PreparedStatement pss = cn.prepareStatement("select * from details where fname LIKE '%" + search + "%' OR lname LIKE '%" + search + "%' OR  code ='" + search + "'   ");
                        ResultSet rss= pss.executeQuery();
                        if(rss.next()) {

                    %>
                <div class="breadcrumb1">
                    <ul>
                        <a href="index.html"><i class="fa fa-home home_1"></i></a>
                        <span class="divider">&nbsp;|&nbsp;</span>
                        <li class="current-page">Profile</li>
                    </ul>
                </div>
                <div class="col-md-9 profile_left1">
                    <h1>Profiles By Your Search</h1>
                    
                    <%
                        PreparedStatement ps = cn.prepareStatement("select * from details where fname LIKE '%" + search + "%' OR lname LIKE '%" + search + "%' OR  code ='" + search + "'  AND email<>? ");
                        ps.setString(1,email);
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {

                    %>



                    <div class="profile_top">


                        <div class="col-sm-4 profile_left-top">
                            <img src="upload/<%=rs.getString("code")%>.jpg" class="img-responsive" alt=""/>
                        </div>

                        <div class="col-sm-8">
                            <table class="table_working_hours">
                                <tbody>
                                    <tr class="opened_1">
                                        <td class="day_label1">First Name :</td>
                                        <td class="day_value"> <%=rs.getString("fname")%> </td>
                                    </tr>
                                    <tr class="opened">
                                        <td class="day_label1">Last Name :</td>
                                        <td class="day_value"> <%=rs.getString("lname")%></td>
                                    </tr>
                                    <tr class="opened">
                                        <td class="day_label1">Email :</td>
                                        <td class="day_value"> <%=rs.getString("email")%></td>
                                    </tr>
                                    <tr class="opened">
                                        <td class="day_label1"> Gender :</td>
                                        <td class="day_value"> <%=rs.getString("gender")%></td>
                                    </tr>

                                </tbody>
                            </table>
                            <div class="buttons">
                                <a href="view_profile.jsp?id=<%=rs.getString("code")%>&search=<%=rs.getString("code")%>"><div class="vertical">View Profile</div></a>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <%
                        }
                    %>
                </div>
                <div class="col-md-3 match_right">
                    <div class="profile_search1">
                        <form method="post" ACTION="search_user.jsp">
                                <input type="text" name="search" size="30" required="" placeholder="Search by Name and Code:">
                                <input type="submit" value="Go">
                            </form>
                    </div>
                    
                    <div class="view_profile view_profile2">
                        <h3>Profiles For You</h3>
                        <%
                        Statement st = cn.createStatement();
                ResultSet rse = st.executeQuery("select * from details where email='" + email + "'");
                if (rse.next()) {
                            int count1 = 0;
                            PreparedStatement psp = cn.prepareStatement("select * from details where gender<>? AND caste=? order by RAND()");
                            psp.setString(1, rse.getString("gender"));
                            psp.setString(2, rse.getString("caste"));
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
                }
                        %>
                    </div>
                </div>
                <div class="clearfix"> </div>
                <%
                        }
                        else{
                        %>
                        
                        <label>No Data Found, Try Another Name...</label>
                        
                        <%
                        }
                        
                        %>
            </div>
        </div>
        <div class="map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d3150859.767904157!2d-96.62081048651531!3d39.536794757966845!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1408111832978"> </iframe>
        </div>
        <div class="footer">
            <div class="container">
                <div class="col-md-4 col_2">
                    <h4>About Us</h4>
                    <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris."</p>
                </div>
                <div class="col-md-2 col_2">
                    <h4>Help & Support</h4>
                    <ul class="footer_links">
                        <li><a href="#">24x7 Live help</a></li>
                        <li><a href="contact.html">Contact us</a></li>
                        <li><a href="#">Feedback</a></li>
                        <li><a href="faq.html">FAQs</a></li>
                    </ul>
                </div>
                <div class="col-md-2 col_2">
                    <h4>Quick Links</h4>
                    <ul class="footer_links">
                        <li><a href="privacy.html">Privacy Policy</a></li>
                        <li><a href="terms.html">Terms and Conditions</a></li>
                        <li><a href="services.html">Services</a></li>
                    </ul>
                </div>
                <div class="col-md-2 col_2">
                    <h4>Social</h4>
                    <ul class="footer_social">
                        <li><a href="#"><i class="fa fa-facebook fa1"> </i></a></li>
                        <li><a href="#"><i class="fa fa-twitter fa1"> </i></a></li>
                        <li><a href="#"><i class="fa fa-google-plus fa1"> </i></a></li>
                        <li><a href="#"><i class="fa fa-youtube fa1"> </i></a></li>
                    </ul>
                </div>
                <div class="clearfix"> </div>
                <div class="copy">
                    <p>Copyright © 2015 Marital . All Rights Reserved  | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
                </div>
            </div>
        </div>
        <!-- FlexSlider -->
        <link href="css/flexslider.css" rel='stylesheet' type='text/css' />
        <script defer src="js/jquery.flexslider.js"></script>
        <script type="text/javascript">
            $(function() {
                SyntaxHighlighter.all();
            });
            $(window).load(function() {
                $('.flexslider').flexslider({
                    animation: "slide",
                    start: function(slider) {
                        $('body').removeClass('loading');
                    }
                });
            });
        </script>
        <!-- FlexSlider -->
    </body>
</html>	


<%

            } catch (Exception e) {
                out.println(e.getMessage());
            }
        }
    } catch (Exception er) {
        response.sendRedirect("index.jsp");
    }
%>