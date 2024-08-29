<%-- 
    Document   : gallary
    Created on : Jul 3, 2023, 8:45:31 AM
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="jquery-3.6.0.min.js"></script>
        <style>
            #imgshow{
                cursor: pointer;
                width:300px;
                margin-top: 50px;
                position:fixed;
                z-index:1000;
                border: 1px solid #ddd;
                border-radius: 10px;
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }
            #imgshow:hover {
                box-shadow: 0 0 3px 3px red;
            }
            #imgdiv:hover{
                cursor:pointer;
                transform: scale(0.9);
                transition: transform 0.5s;
            }
        </style>
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
            $(document).on("click", ".fa.fa-trash", function() {
                var id = $(this).attr("id");
                $.post(
                        "deleteimg.jsp", {id: id}, function(data) {
                    data = data.trim();
                    if (data == "success") {
                        $("#" + id).fadeOut();
                    }
                });

            });
            $(document).on("click", "#imgdiv", function() {
                var id = $(this).attr("someid");
                var user = $(this).attr("rel");
                $(".record").html("<img id='imgshow' style=\"\" src=\"upload/" + user + "/" + id + ".jpg\">");
                $(".container").css("opacity", "0.5");
                $(".container").css("transition", "1s");
                $(".record").css("transition", "1s");
            });
            $(document).click(function() {
                if (!$(event.target).closest("img").length) {
                    $(".record").html("");
                    $(".container").css("opacity", "1");
                    $(".container").css("transition", "1s");
                }
                ;
            });
            $(document).click(function() {
                if (!$(event.target).closest("#imgdiv").length) {
                    $(".record").html("");
                    $(".container").css("opacity", "1");
                    $(".container").css("transition", "1s");
                }
                ;
            });
        </script>
    </head>
    <body>
        <!-- ============================  Navigation Start =========================== -->
        <%@include file="nav.jsp" %>
        <!-- ============================  Navigation End ============================ -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-6">
                    <div class="record"></div>
                </div>
                <div class="col-sm-2"></div>
            </div>

        </div>

        <div class="grid_3">
            <div class="container">
                <div class="row">
                    <div class="col-sm-9">
                        <label><i class="fa fa-home home_1"></i></label> &nbsp; |&nbsp;<label>Your Photos</label>
                    </div>
                    <div class="col-sm-3">
                        <form method="post" ACTION="upload_user_image.jsp?id=<%=rs.getString("code")%>" name="uploadForm" ENCTYPE='multipart/form-data' class="form">
                            <input type='file' name='uploadFile' class="table table-borderless" required="">
                            <button class="btn btn-danger">Upload</button>
                        </form>
                    </div>
                </div>
                <br>
                <div class="row">

                    <%
                        PreparedStatement psi = cn.prepareStatement("select * from userdata where usercode=? order by RAND()");
                        psi.setString(1, rs.getString("code"));
                        ResultSet rsi = psi.executeQuery();
                        while (rsi.next()) {
                    %>
                    <div class="col-sm-2" id="<%=rsi.getString("code")%>" style="margin-top:20px">
                        <img id="imgdiv" src="upload/<%=rsi.getString("usercode")%>/<%=rsi.getString("code")%>.jpg" class="img-responsive" style="margin-top:20px;" someid="<%=rsi.getString("code")%>" rel="<%=rsi.getString("usercode")%>">   
                        <i class="fa fa-trash" style="float: right;cursor: pointer" id="<%=rsi.getString("code")%>"></i>
                    </div>
                    <%                        }
                    %>

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