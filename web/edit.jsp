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

                        <h2>Profile : <%=rs.getString("code")%> </h2>
                        <div class="col_3">
                            <div class="col-sm-4 row_2">
                                <div class="flexslider">
                                    <ul class="slides">
                                        <li data-thumb="upload/<%=rs.getString("code")%>.jpg" style="widht:50%;height: 50%" class="img">
                                            <img src="upload/<%=rs.getString("code")%>.jpg" />
                                        </li>
                                        

                                    </ul>

                                </div>
                                <form method="post" ACTION="upload_image_edit.jsp?id=<%=rs.getString("code")%>" name="uploadForm" ENCTYPE='multipart/form-data' class="form">
                                    <input type='file' name='uploadFile' class="table table-borderless" required="">
                                    <button class="btn btn-danger">Upload</button>
                                </form>
                            </div>
                            <div class="col-sm-8 row_1">
                                <form method=post action='update.jsp?id=<%=email%>'>

                                    <label>First Name: </label><input class='form-control' type='text' name='fname' value='<%=rs.getString("fname")%>'><br>
                                    <label>Last Name: </label><input class='form-control'  type='text' name='lname' value='<%=rs.getString("lname")%>'><br>
                                    <label>Gender : </label><select  class='form-control' name='gender'><option value='<%=rs.getString("gender")%>'><%=rs.getString("gender")%></option>
                                        <option value='Male'>Male</option>
                                        <option value='Female'>Female</option></select><br>
                                    <label>Caste : </label><select class='form-control'  name='caste'><option value='<%=rs.getString("caste")%>'><%=rs.getString("caste")%></option>
                                        <option value='Sharma'>Sharma</option>
                                        <option value='Agarwal'>Agarwal</option>
                                        <option value='Rajput'>Rajput</option>
                                        <option value='Jat'>Jat</option>
                                        <option value='Patel'>Patel</option>
                                        <option value='Saini'>Saini</option>
                                        <option value='Mehra'>Mehra</option>
                                        <option value='Singh'>Singh</option>
                                    </select><br>
                                    <label>Religion : </label><select class='form-control'  name='religion'><option value='<%=rs.getString("religion")%>'><%=rs.getString("religion")%></option>
                                        <option value='Hindu'>Hindu</option>
                                        <option value='Jain'>Jain</option>
                                        <option value='Muslim'>Muslim</option>
                                        <option value='Krishachan'>Krishchan</option>
                                        <option value='Sikh'>Sikh</option>
                                        <option value='Punjabi'>Punjabi</option>
                                    </select><br>    
                                    <label>Occupation : </label><select  class='form-control' name='occupation'><option value='<%=rs.getString("occupation")%>'><%=rs.getString("occupation")%></option>
                                        <option value='Doctor'>Doctor</option>
                                        <option value='Dentist'>Dentist</option>
                                        <option value='Engineer'>Engineer</option>
                                        <option value='Shopkeeper'>shopkeeper</option>
                                        <option value='Lectutarar'>Lectutarar</option>
                                        <option value='Teacher'>Teacher</option>
                                    </select><br>
                                    <label>Date Of Birth : </label><input type='date'  class='form-control' name='birth' value='<%=rs.getString("birth")%>' required><br>
                                    <label>City : </label><select  class='form-control' name='city'><option value='<%=rs.getString("city")%>'><%=rs.getString("city")%></option>
                                        <option value='Alwar'>Alwar</option>
                                        <option value='Bikaner'>Bikaner</option>
                                        <option value='Dausa'>Dausa</option>
                                        <option value='Kota'>Kota</option>
                                        <option value='Jaipur'>Jaipur</option>
                                        <option value='Bundi'>Bundi</option>
                                    </select><br>
                                    <label>State : </label><select  class='form-control' name='state'><option value='<%=rs.getString("state")%>'><%=rs.getString("state")%></option>
                                        <option value='Rajasthan'>Rajasthan</option>
                                        <option value='Gujrat'>Gujrat</option>
                                        <option value='Punjab'>Punjab</option>
                                        <option value='Keral'>Keral</option>
                                        <option value='Delhi'>Delhi</option>
                                        <option value='Hariyana'>Hariyana</option>
                                    </select><br>
                                    <label>Country : </label><select class='form-control'  name='country'><option value='<%=rs.getString("country")%>'><%=rs.getString("country")%></option>
                                        <option value='India'>India</option>
                                        <option value='China'>China</option>
                                        <option value='USA'>USA</option>
                                        <option value='Shri Lanka'>Shri Lanka</option>
                                        <option value='Afganisthan'>Afganisthan</option>
                                        <option value='Ingland'>Ingland</option>
                                    </select><br>

                                    <div><label><button type="text" class="btn btn-danger">Update</button></lable></div>
                                </form>

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
                                        
                                    }
                                    count2++;
                                        if (count2 == 4) {
                                            break;
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