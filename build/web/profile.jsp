<%-- 
    Document   : view_profile
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
                            if (request.getParameter("update") != null) {
                                out.println("<div class='alert alert-success' style='width:100%' align='center'>Record Update</div>");
                            } else if (request.getParameter("error") != null) {
                                out.println("<div class='alert alert-danger' style='width:100%' align='center'>Record Not Update</div>");
                            } else if (request.getParameter("again") != null) {
                                out.println("<div class='alert alert-danger' style='width:100%' align='center'>Again Change Password</div>");
                            }

                        %>
                        <h2>Profile : <%=rs.getString("code")%></h2>
                        <div class="col_3">
                            <div class="col-sm-4 row_2">
                                <div class="flexslider">
                                    <ul class="slides">
                                        <li data-thumb="upload/<%=rs.getString("code")%>.jpg">
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
                                <table class="table_working_hours table table-responsive">
                                    <tbody>
                                        <tr><td style='width:25%'>First Name :  </td><td><%=rs.getString("fname")%></td></tr>
                                        <tr><td>Last Name : </td><td><%=rs.getString("lname")%></td></tr>
                                        <tr><td>Gender  : </td><td><%=rs.getString("gender")%></td></tr>
                                        <tr><td>Caste  : </td><td><%=rs.getString("caste")%></td></tr>
                                        <tr><td>Religion :  </td><td><%=rs.getString("religion")%></td></tr>
                                        <tr><td>Occuapation :  </td><td><%=rs.getString("occupation")%></td></tr>
                                        <tr><td>Date Of Birth : </td><td><%=rs.getString("birth")%></td></tr>
                                        <tr><td>City  : </td><td><%=rs.getString("city")%></td></tr>
                                        <tr><td>State  : </td><td><%=rs.getString("state")%></td></tr>
                                        <tr><td>Country  : </td><td><%=rs.getString("country")%></td></tr>
                                    </tbody>
                                </table>

                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="col_4">
                            <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
                                <ul id="myTab" class="nav nav-tabs nav-tabs1" role="tablist">
                                    <li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">About Myself</a></li>
                                    <li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile">Family Details</a></li>
                                    <li role="presentation"><a href="#profile1" role="tab" id="profile-tab1" data-toggle="tab" aria-controls="profile1">Partner Preference</a></li>
                                </ul>
                                <%
                                    PreparedStatement user = cn.prepareStatement("select * from userdetails where email=?");
                                    user.setString(1,email);
                                    ResultSet user1 = user.executeQuery();
                                    if (user1.next()) {
                                %>
                                <div id="myTabContent" class="tab-content">
                                    <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">

                                        <div class="basic_1">

                                            <div class="clearfix"> </div>
                                        </div>
                                        <div class="basic_1">
                                            <h3>Religious / Social & Astro Background</h3>
                                            <div class="col-md-6 basic_1-left">
                                                <table class="table_working_hours">
                                                    <tbody>
                                                        <tr class="opened">
                                                            <td class="day_label">Caste :</td>
                                                            <td class="day_value"><%=rs.getString("caste")%></td>
                                                        </tr>
                                                        <tr class="opened">
                                                            <td class="day_label">Date of Birth :</td>
                                                            <td class="day_value closed"><span><%=rs.getString("birth")%></span></td>
                                                        </tr>
                                                        <tr class="opened">
                                                            <td class="day_label">Place of Birth :</td>
                                                            <td class="day_value closed"><span><%=rs.getString("state")%></span></td>
                                                        </tr>
                                                        <tr class="opened">
                                                            <td class="day_label">Height :</td>
                                                            <td class="day_value closed"><span><%=user1.getString("height")%></span></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="col-md-6 basic_1-left">
                                                <table class="table_working_hours">
                                                    <tbody>
                                                        <tr class="opened_1">
                                                            <td class="day_label">Religion :</td>
                                                            <td class="day_value"><%=rs.getString("religion")%></td>
                                                        </tr>
                                                        <tr class="opened">
                                                            <td class="day_label">Country</td>
                                                            <td class="day_value"><%=rs.getString("country")%></td>
                                                        </tr>
                                                        <tr class="opened">
                                                            <td class="day_label">Weight</td>
                                                            <td class="day_value"><%=user1.getString("weight")%></td>
                                                        </tr>

                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="clearfix"> </div>
                                        </div>
                                        <div class="basic_1 basic_2">
                                            <h3>Education & Career</h3>
                                            <div class="basic_1-left">
                                                <table class="table_working_hours">
                                                    <tbody>
                                                        <tr class="opened">
                                                            <td class="day_label">Education   :</td>
                                                            <td class="day_value"><%=user1.getString("Education")%></td>
                                                        </tr>
                                                        <tr class="opened">
                                                            <td class="day_label">Annual Income :</td>
                                                            <td class="day_value closed"><span><%=user1.getString("income")%></span></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="clearfix"> </div>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
                                        <div class="basic_3">
                                            <h4>Family Details</h4>
                                            <div class="basic_1 basic_2">
                                                <h3>Basics</h3>
                                                <div class="col-md-6 basic_1-left">
                                                    <table class="table_working_hours">
                                                        <tbody>
                                                            <tr class="opened">
                                                                <td class="day_label">Father's Occupation :</td>
                                                                <td class="day_value"><%=user1.getString("Father")%></td>
                                                            </tr>
                                                            <tr class="opened">
                                                                <td class="day_label">Mother's Occupation :</td>
                                                                <td class="day_value"><%=user1.getString("Mother")%></td>
                                                            </tr>
                                                            <tr class="opened">
                                                                <td class="day_label">No. of Brothers :</td>
                                                                <td class="day_value closed"><span><%=user1.getString("Brother")%></span></td>
                                                            </tr>
                                                            <tr class="opened">
                                                                <td class="day_label">No. of Sisters :</td>
                                                                <td class="day_value closed"><span><%=user1.getString("Sister")%></span></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="profile1" aria-labelledby="profile-tab1">
                                        <div class="basic_1 basic_2">
                                            <div class="paid_people">
                                                 <%
                                                    int count3 = 0;
                                                    PreparedStatement psv1 = cn.prepareStatement("select * from viewed where byuser=? order by RAND()");
                                                    psv1.setString(1, rs.getString("email"));
                                                    ResultSet rsv1 = psv1.executeQuery();
                                                    while (rsv1.next()) {
                                                        PreparedStatement pspp = cn.prepareStatement("select * from details where code=? AND gender<>?");
                                                        pspp.setString(1, rsv1.getString("viewuser"));
                                                        pspp.setString(2, rs.getString("gender"));
                                                        ResultSet rspp1 = pspp.executeQuery();
                                                        while (rspp1.next()) {
                                                %>
                                                <div class="col-sm-6">
                                                    <ul class="profile_item">
                                                        <li class="profile_item-img">
                                                            <img src="upload/<%=rspp1.getString("code")%>.jpg" class="img-responsive" style="width:150px;height: 100px">
                                                        </li>
                                                        <li class="profile_item-desc">
                                                            <h4><%=rspp1.getString("fname")%> <%=rspp1.getString("lname")%></h4>
                                                            <p><%=rspp1.getString("email")%></p><br>
                                                            <a href="view_profile.jsp?id=<%=rspp1.getString("code")%>"><div class="vertical">View Profile</div></a>
                                                        </li>
                                                        <div class="clearfix"> </div>

                                                    </ul>
                                                </div>
                                                <%
                                                        }
                                                        count3++;
                                                        if (count3 == 11) {
                                                            break;
                                                        }
                                                    }
                                                %>
                                                <div class="clearfix"> </div>
                                           </div>
                                        </div>
                                    </div>
                                </div>
                                                <%
                                        
                                    }
                                    %>
                            </div>
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
                            <h3>Profiles For You</h3>
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
                    }  else {
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