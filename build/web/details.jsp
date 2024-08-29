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

                        <h2>Profile Id: <%=rs.getString("code")%></h2>
                        <div class="col_3">
                            <div class="col-sm-12 row_1">
                                <form method=post action='userdetails.jsp'>
                                    <%
                                    PreparedStatement user = cn.prepareStatement("select * from userdetails where email=?");
                                    user.setString(1,email);
                                    ResultSet user1 = user.executeQuery();
                                    if (user1.next()) {
                                %>
                                    <label>Education: </label><input class='form-control' type='text' name='Education' value='<%=user1.getString("Education")%>'><br>
                                    <label>Annual Income In Year : </label><input class='form-control' value='<%=user1.getString("income")%>'  type='text' name='income'><br>
                                    <label>Father's Occupation : </label><input class='form-control'  value='<%=user1.getString("Father")%>' type='text' name='father'><br>
                                    <label>Mother's Occupation : </label><input class='form-control'  value='<%=user1.getString("Mother")%>' type='text' name='mother'><br>
                                    <label>No. Of Brothers : </label><input class='form-control'  value='<%=user1.getInt("Brother")%>'  type='text' name='brother'><br>
                                    <label>No. Of Sister's : </label><input class='form-control'  value='<%=user1.getInt("Sister")%>' type='text' name='sister'><br>
                                    <label>Height : </label><input class='form-control'  type='text' value='<%=user1.getString("height")%>' name='height'><br>
                                    <label>Weight : </label><input class='form-control'  type='text'  value='<%=user1.getString("weight")%>' name='weight' ><br>
                                    <%
                                    }
                                    %>
                                    <div><label><button type="text" class="btn btn-danger" style='float :right'>Update</button></lable></div>
                                </form>

                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        
                    </div>
                    <div class="col-md-4 profile_right">
                        <div class="newsletter">
                            <form method="post" ACTION="search_user.jsp">
                                <input type="text" name="search" size="30" required="" placeholder="Search by Name and Code :">
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