<%-- 
    Document   : searched_id
    Created on : Jul 3, 2023, 2:03:44 PM
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
                String name = "";
                Statement sts = cn.createStatement();
                ResultSet rss = sts.executeQuery("select * from details where email='" + email + "'");
                if (rss.next()) {
                    name = rss.getString("fname")+" "+rss.getString("lname");
                }
%>


<!DOCTYPE HTML>
<html>
    <head>
        <title><%=name%></title>
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
                        <li class="current-page">Profiles Which is search by you</li>
                    </ul>
                </div>

                <div class="col-md-8 members_box2">
                    <div class="col_4">
                        <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
                            <div id="myTabContent" class="tab-content">
                                <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">

                                    <div class="clearfix"> </div>
                                    <%

                                        Statement st = cn.createStatement();
                                        ResultSet rs = st.executeQuery("select * from search where byuser='" + email + "' order by RAND()");
                                        while (rs.next()) {
                                            Statement st1 = cn.createStatement();
                                            ResultSet rs1 = st1.executeQuery("select * from details where code='" + rs.getString("searchuser") + "'");
                                            if (rs1.next()) {
                                    %>

                                    <div class="jobs-item with-thumb">
                                        <div class="thumb_top">
                                            <div class="thumb"><a href="view_profile.html"><img src="upload/<%=rs1.getString("code")%>.jpg" class="img-responsive" alt=""/></a></div>
                                            <div class="jobs_right">
                                                <table class="table_working_hours">
                                                    <tbody>
                                                        <tr class="opened_1">
                                                            <td class="day_label1">First Name :</td>
                                                            <td class="day_value"> <%=rs1.getString("fname")%> </td>
                                                        </tr>
                                                        <tr class="opened">
                                                            <td class="day_label1">Last Name :</td>
                                                            <td class="day_value"> <%=rs1.getString("lname")%></td>
                                                        </tr>
                                                        <tr class="opened">
                                                            <td class="day_label1">Email :</td>
                                                            <td class="day_value"> <%=rs1.getString("email")%></td>
                                                        </tr>



                                                    </tbody>
                                                </table>
                                                <br>
                                                <a href="view_profile.jsp?id=<%=rs1.getString("code")%>"><div class="vertical">View Profile</div></a>

                                            </div>
                                            <div class="clearfix"> </div>
                                        </div>

                                    </div>

                                    <%
                                            } else {
                                                response.sendRedirect("profile.jsp?no_msg=1");
                                            }
                                        }
                                    %>

                                </div>




                            </div> 
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 profile_right">
                    <div class="newsletter">
                        <form method="post" ACTION="search_user.jsp">
                            <input type="text" name="search" size="30" required="" placeholder="Search by Name and Code:">
                            <input type="submit" value="Go">
                        </form>
                    </div>
                    <div class="view_profile">
                        <h3>Profiles For You</h3>
                        <%
                            Statement st1 = cn.createStatement();
                            ResultSet rs1 = st1.executeQuery("select * from details where email='" + email + "'");
                            while (rs1.next()) {
                                int count1 = 0;
                                PreparedStatement psp = cn.prepareStatement("select * from details where gender<>? AND caste=? order by RAND()");
                                psp.setString(1, rs1.getString("gender"));
                                psp.setString(2, rs1.getString("caste"));
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
                            psv.setString(1, rs1.getString("code"));
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

                                    }
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
        <div class="map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d3150859.767904157!2d-96.62081048651531!3d39.536794757966845!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1408111832978"> </iframe>
        </div>
         <%@include file="footer.jsp" %>
    </body>
</html>


<%
            } catch (Exception er) {
                out.println(er.getMessage());
            }
        }
    } catch (Exception e) {
        out.println(e.getMessage());
    }

%>
%>