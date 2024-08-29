<%-- 
    Document   : index
    Created on : Mar 15, 2023, 3:52:17 PM
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
        if (email != null) {
            response.sendRedirect("profile.jsp");
        } else {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");

%>

<!DOCTYPE HTML>
<html>
    <head>
        <title>Matrimonial Website</title>
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
        <div class="navbar navbar-inverse-blue navbar">
            <!--<div class="navbar navbar-inverse-blue navbar-fixed-top">-->
            <div class="navbar-inner">
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
        <div class="banner">
            <div class="container">
                <div class="banner_info">
                    <h3>Millions of verified Members</h3>
                    <a href="signup.jsp" class="hvr-shutter-out-horizontal">Create your Profile</a>
                </div>
            </div>
            <div class="profile_search">
                <div class="container wrap_1">
                    <form action="login.jsp">
                        <div class="search_top">
                            <div class="inline-block">
                                <label class="gender_1">I am looking for :</label>
                                <div class="age_box1" style="max-width: 100%; display: inline-block;">
                                    <select>
                                        <option value="">* Select Gender</option>
                                        <option value="Male">Bride</option>
                                        <option value="Female">Groom</option>
                                    </select>
                                </div>
                            </div>
                            <div class="inline-block">
                                <label class="gender_1">Located In :</label>
                                <div class="age_box1" style="max-width: 100%; display: inline-block;">
                                    <select>
                                        <option value="">* Select State</option>
                                        <option value="Washington">Washington</option>
                                        <option value="Texas">Texas</option>
                                        <option value="Georgia">Georgia</option>
                                        <option value="Virginia">Virginia</option>
                                        <option value="Colorado">Colorado</option>
                                    </select>
                                </div>
                            </div>
                            <div class="inline-block">
                                <label class="gender_1">Interested In :</label>
                                <div class="age_box1" style="max-width: 100%; display: inline-block;">
                                    <select><option value="">* Select Interest</option>
                                        <option value="Sports &amp; Adventure">Sports &amp; Adventure</option>
                                        <option value="Movies &amp; Entertainment">Movies &amp; Entertainment</option>
                                        <option value="Arts &amp; Science">Arts &amp; Science</option>
                                        <option value="Technology">Technology</option>
                                        <option value="Fashion">Fashion</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="inline-block">
                            <div class="age_box2" style="max-width: 220px;">
                                <label class="gender_1">Age :</label>
                                <input class="transparent" placeholder="From:" style="width: 34%;" type="text" value="">&nbsp;-&nbsp;<input class="transparent" placeholder="To:" style="width: 34%;" type="text" value="">
                            </div>
                        </div>
                        <div class="inline-block">
                            <label class="gender_1">Status :</label>
                            <div class="age_box1" style="max-width: 100%; display: inline-block;">
                                <select>
                                    <option value="">* Select Status</option>
                                    <option value="Single">Single</option>
                                    <option value="Married">Married</option>
                                    <option value="In a Relationship">In a Relationship</option>
                                    <option value="It's Complicated">It's Complicated</option>
                                </select>
                            </div>
                        </div>
                        <div class="submit inline-block">
                            <input id="submit-btn" class="hvr-wobble-vertical" type="submit" value="Find Matches">
                        </div>
                    </form>
                </div>
            </div> 
        </div> 
        <div class="grid_1">
            <div class="container">
                <h1>Featured Profiles</h1>
                <div class="heart-divider">
                    <span class="grey-line"></span>
                    <i class="fa fa-heart pink-heart"></i>
                    <i class="fa fa-heart grey-heart"></i>
                    <span class="grey-line"></span>
                </div>
                <ul id="flexiselDemo3">
                    <%
                        int count = 0;
                        PreparedStatement psi = cn.prepareStatement("select * from details order by RAND()");
                        ResultSet rsi = psi.executeQuery();
                        while (rsi.next()) {
                    %>
                    <li><div class="col_1">
                            <a href="login.jsp">
                                <img src="upload/<%=rsi.getString("code")%>.jpg" alt="" style="width:150px;height:120px"class="hover-animation image-zoom-in img-responsive"/>

                                <h3><span class="m_3">Profile : <%=rsi.getString("fname")%> <%=rsi.getString("lname")%></span><br><%=rsi.getString("city")%>, <%=rsi.getString("state")%><br><%=rsi.getString("country")%></h3></a></div>
                    </li>
                    <%  count++;
                            if (count == 6) {
                                break;
                            }
                        }
                    %>
                </ul>
                <script type="text/javascript">
                    $(window).load(function() {
                        $("#flexiselDemo3").flexisel({
                            visibleItems: 6,
                            animationSpeed: 1000,
                            autoPlay: false,
                            autoPlaySpeed: 3000,
                            pauseOnHover: true,
                            enableResponsiveBreakpoints: true,
                            responsiveBreakpoints: {
                                portrait: {
                                    changePoint: 480,
                                    visibleItems: 1
                                },
                                landscape: {
                                    changePoint: 640,
                                    visibleItems: 2
                                },
                                tablet: {
                                    changePoint: 768,
                                    visibleItems: 3
                                }
                            }
                        });

                    });
                </script>
                <script type="text/javascript" src="js/jquery.flexisel.js"></script>
            </div>
        </div>
        <div class="grid_2">
            <div class="container">
                <h2>Success Stories</h2>
                <div class="heart-divider">
                    <span class="grey-line"></span>
                    <i class="fa fa-heart pink-heart"></i>
                    <i class="fa fa-heart grey-heart"></i>
                    <span class="grey-line"></span>
                </div>
                <div class="row_1">
                    <div class="col-md-6 suceess_story">
                        <ul> 
                            <%
                                int count1 = 0;
                                while (rsi.next()) {

                            %>

                            <li>
                                <div class="suceess_story-date">
                                    <span class="entry-1"><%=rsi.getString("birth")%></span>
                                </div>
                                <div class="suceess_story-content-container">
                                    <figure class="suceess_story-content-featured-image">
                                       <a href="login.jsp"> <img  width="100px" height="80px" src="upload/<%=rsi.getString("code")%>.jpg" class="img-responsive" alt=""/>	</a>			            
                                    </figure>
                                    <div class="suceess_story-content-info">
                                        <h4><a href="login.jsp"><%=rsi.getString("fname")%> <%=rsi.getString("lname")%></a></h4>				        	
                                        <h6><a href="login.jsp"><%=rsi.getString("email")%><br> <%=rsi.getString("caste")%></a></h6>				        	

                                    </div>
                                </div>
                            </li>
                            <%  count1++;
                                    if (count1 == 5) {
                                        break;
                                    }
                                }
                            %>
                        </ul>
                    </div>
                    <div class="col-md-6 suceess_story">
                        <ul> 
                            <%
                                int count2 = 0;
                                while (rsi.next()) {

                            %>

                            <li>
                                <div class="suceess_story-date">
                                    <span class="entry-1"><%=rsi.getString("birth")%></span>
                                </div>
                                <div class="suceess_story-content-container">
                                    <figure class="suceess_story-content-featured-image">
                                        <a href="login.jsp"><img width="100px" height="80px" src="upload/<%=rsi.getString("code")%>.jpg" class="img-responsive" alt=""/></a>				            
                                    </figure>
                                    <div class="suceess_story-content-info">
                                        <h4><a href="login.jsp"><%=rsi.getString("fname")%> <%=rsi.getString("lname")%></a></h4>				        	
                                        <h6><a href="login.jsp"><%=rsi.getString("email")%> <br><%=rsi.getString("caste")%></a></h6>				        	

                                    </div>
                                </div>
                            </li>
                            <%  count2++;
                                    if (count2 == 5) {
                                        break;
                                    }
                                }
                            %>
                        </ul>
                    </div>
                    <div class="clearfix"> </div>
                </div> 
            </div>
        </div>
        <div class="bg">
            <div class="container"> 
                <h3>Guest Messages</h3>
                <div class="heart-divider">
                    <span class="grey-line"></span>
                    <i class="fa fa-heart pink-heart"></i>
                    <i class="fa fa-heart grey-heart"></i>
                    <span class="grey-line"></span>
                </div>
                <div class="col-sm-6">
                    <div class="bg_left">
                        <h4>But I must explain</h4>
                        <h5>Friend of Bride</h5>
                        <p>"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
                        <ul class="team-socials">
                            <li><a href="#"><span class="icon-social "><i class="fa fa-facebook"></i></span></a></li>
                            <li><a href="#"><span class="icon-social "><i class="fa fa-twitter"></i></span></a></li>
                            <li><a href="#"><span class="icon-social"><i class="fa fa-google-plus"></i></span></a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="bg_left">
                        <h4>But I must explain</h4>
                        <h5>Friend of Groom</h5>
                        <p>"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
                        <ul class="team-socials">
                            <li><a href="#"><span class="icon-social "><i class="fa fa-facebook"></i></span></a></li>
                            <li><a href="#"><span class="icon-social "><i class="fa fa-twitter"></i></span></a></li>
                            <li><a href="#"><span class="icon-social"><i class="fa fa-google-plus"></i></span></a></li>
                        </ul>
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

<%        } catch (Exception er) {
                response.sendRedirect("index.jsp");
            }
        }
    } catch (Exception er) {
        response.sendRedirect("index.jsp");
    }
%>