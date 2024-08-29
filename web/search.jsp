<%-- 
    Document   : search
    Created on : Mar 20, 2023, 1:16:35 PM
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
                        <li class="current-page">Regular Search</li>
                    </ul>
                </div>
                <!--<script type="text/javascript">
                 $(function () {
                  $('#btnRadio').click(function () {
                       var checkedradio = $('[name="gr"]:radio:checked').val();
                       $("#sel").html("Selected Value: " + checkedradio);
                   });
                 });
                </script>-->
                <div class="col-md-8 search_left">
                    <form method="post" action="search_record.jsp">	
                        <div class="form_but1">
                            <label class="col-sm-5 control-lable1" for="gender">Gender : </label>
                            <div class="col-sm-7 form_radios">
                                <input type="radio" class="radio_1" name="gender" value="Male" checked="checked"/ > Male &nbsp;&nbsp;
                                <input type="radio" class="radio_1" name="gender" value="Female" /> Female
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form_but1">
                            <label class="col-sm-5 control-lable1" for="caste" required>Caste : </label>
                            <div class="col-sm-7 form_radios">
                                <div class="select-block1">
                                    <select name="caste" class="form-control">
                                        <option value='Sharma'>Sharma</option>
                                        <option value='Agarwal'>Agarwal</option>
                                        <option value='Rajput'>Rajput</option>
                                        <option value='Jat'>Jat</option>
                                        <option value='Patel'>Patel</option>
                                        <option value='Saini'>Saini</option>
                                        <option value='Mehra'>Mehra</option>
                                        <option value='Singh'>Singh</option>
                                    </select>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="form_but1">
                            <label class="col-sm-5 control-lable1" for="religion" required>Religion : </label>
                            <div class="col-sm-7 form_radios">
                                <div class="select-block1">
                                    <select name="religion" class="form-control">
                                        <option value='Hindu'>Hindu</option>
                                        <option value='Jain'>Jain</option>
                                        <option value='Muslim'>Muslim</option>
                                        <option value='Krishachan'>Krishchan</option>
                                        <option value='Sikh'>Sikh</option>
                                        <option value='Punjabi'>Punjabi</option>
                                    </select>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <input type="submit" Value="Search" class="btn btn-danger" style="float:right">  
                    </form>
                    <div class="paid_people">
                        <h1>Your Profile Viewed BY</h1>
                        
                            <%
                                int count2=0;
                                PreparedStatement psv = cn.prepareStatement("select * from viewed where viewuser=? order by RAND()");
                                psv.setString(1, rs.getString("code"));
                                ResultSet rsv = psv.executeQuery();
                                while (rsv.next()) {
                                    PreparedStatement pspp = cn.prepareStatement("select * from details where email=?");
                                    pspp.setString(1, rsv.getString("byuser"));
                                    ResultSet rspp = pspp.executeQuery();
                                    while (rspp.next()) {
                            %>
                            <div class="col-sm-6">
                                <ul class="profile_item">
                                    <li class="profile_item-img">
                                        <img src="upload/<%=rspp.getString("code")%>.jpg" class="img-responsive" style="width:150px;height: 100px">
                                    </li>
                                    <li class="profile_item-desc">
                                        <h4><%=rspp.getString("fname")%> <%=rspp.getString("lname")%></h4>
                                        <p><%=rspp.getString("email")%></p><br>
                                        <a href="view_profile.jsp?id=<%=rspp.getString("code")%>"><div class="vertical">View Profile</div></a>
                                    </li>
                                    <div class="clearfix"> </div>

                                </ul>
                            </div>
                            <%
                                    }
                                    count2++;
                                    if(count2==6){
                                        break;
                                    }
                                }
                            %>


                        

                        <div class="clearfix"> </div>



                    </div>
                </div>
                <div class="col-md-4 match_right">
                    <div class="profile_search1">
                        <form method="post" action="search_user.jsp">
                            <input type="text" class="m_1" name="search" size="30" required="" placeholder="Search by Name and Code:">
                            <input type="submit" value="Go">
                        </form>
                    </div>

                    <div class="view_profile view_profile2">
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
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <div class="map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d3150859.767904157!2d-96.62081048651531!3d39.536794757966845!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1408111832978"> </iframe>
        </div>
        <%@include file="footer.jsp" %>
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

<%                } else {
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