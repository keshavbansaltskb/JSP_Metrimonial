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

            int viewstatus = 0;
            int searchstatus = 0;
            String logincode = "";
            String code = request.getParameter("id");
            String search = request.getParameter("search");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");


                Statement stem = cn.createStatement();
                ResultSet rsem = stem.executeQuery("select * from details where email='" + email + "'");
                if (rsem.next()) {
                    logincode = rsem.getString("code");
                }

                PreparedStatement psvi = cn.prepareStatement("select * from viewed where viewuser='" + code + "' AND byuser='" + email + "'  ");
                ResultSet rsvi = psvi.executeQuery();
                if (rsvi.next()) {
                    viewstatus = rsvi.getInt("status");

                }
                if (viewstatus == 0) {
                    if (!logincode.equals(code)) {

                        Statement st1 = cn.createStatement();
                        ResultSet rst = st1.executeQuery("select Max(sn) from viewed");
                        int sn = 0;
                        if (rst.next()) {
                            sn = rst.getInt(1);
                        }
                        sn++;
                        PreparedStatement ps12 = cn.prepareStatement("insert into viewed values (?,?,?,?)");
                        ps12.setInt(1, sn);
                        ps12.setString(2, code);
                        ps12.setString(3, email);
                        ps12.setInt(4, 1);
                        ps12.executeUpdate();
                    }
                }

                PreparedStatement pssi = cn.prepareStatement("select * from search where searchuser='" + code + "' AND byuser='" + email + "'  ");
                ResultSet rssi = pssi.executeQuery();
                if (rssi.next()) {
                    searchstatus = rssi.getInt("status");

                }
                if (!logincode.equals(code)) {
                    if (searchstatus == 0) {
                        if (search != null) {
                            Statement st2 = cn.createStatement();
                            ResultSet rs2 = st2.executeQuery("select Max(sn) from search");
                            int sn1 = 0;
                            if (rs2.next()) {
                                sn1 = rs2.getInt(1);
                            }
                            sn1++;
                            PreparedStatement ps11 = cn.prepareStatement("insert into search values (?,?,?,?)");
                            ps11.setInt(1, sn1);
                            ps11.setString(2, search);
                            ps11.setString(3, email);
                            ps11.setInt(4, 1);
                            ps11.executeUpdate();

                        }
                    }
                }
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery("select * from details where code='" + code + "'");
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
        <style>
            input{
                height: 40px;
                margin-top: 5px;
                width:70%;
                font-family: serif;
                margin-left: 60px;
            }
            #showmsg{
                font-size:15px;
                font-family:serif;
                border-radius: 5px;
                padding: 8px;
                cursor: text;
            }
            .fa.fa-paper-plane:hover,.fa.fa-trash:hover{
                cursor: pointer;
            }
            .panel-body{
                height: 300px;
                overflow: auto;
            }
            img:hover{
                cursor: pointer;
            }
        </style>
        <script>
            $(document).on("click",".fa-trash",function(){
               var code = $(this).attr("id");
               myFunction();
               function myFunction() {
                    var text = "Are You Sure For Delete this message !\n\nEither OK or Cancel.";
                    if (confirm(text) == true) {
                        
                        $.post(
                            "msgdelete.jsp",{id:code},function(data){
                            data = data.trim();
                            if(data == "success"){
                                $("#msgdel-"+code).hide(1000);
                            }
                            else{
                                alert("Try Again")
                            }
                      });
                    
                      
                    } else {

                    }
                }
            });
            $(document).on("click", ".fa.fa-paper-plane", function() {
                var id = $("#message").val();
                var code = "<%=code%>";
                var logincode = "<%=logincode%>";
                $("#message").val("");
                if (id != 0) {
                    $.post(
                            "msg.jsp", {id: code, msg: id}, function(data) {
                        data = data.trim();
                        $("#panelmsg").append(data);
                        scrollToBottom();  
                    });
                }
            });
            function scrollToBottom() {
                var chatPanel = document.getElementById("chatPanel");
                chatPanel.scrollTop = chatPanel.scrollHeight;
            }
            window.onload = scrollToBottom;


            function fetchAndUpdateMessages() {
                var code = "<%=code%>";
                $.post(
                        "showmessage.jsp",{code:code},function(data){
                        data = data.trim();
                        $(".panel-body").html(data);
                 });
            }
            setInterval(fetchAndUpdateMessages,5000);
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
                <div class="breadcrumb1">
                    <ul>
                        <a href="index.html"><i class="fa fa-home home_1"></i></a>
                        <span class="divider">&nbsp;|&nbsp;</span>
                        <li class="current-page">View Profile</li>
                    </ul>
                </div>
                <div class="profile">
                    <div class="col-md-8 profile_left">


                        <div class="col_3">
                            <div class="col-sm-4 row_2">
                                <div class="flexslider">
                                    <ul class="slides">
                                        <li data-thumb="upload/<%=rs.getString("code")%>.jpg" style="widht:50%;height: 50%" class="img">
                                            <img src="upload/<%=rs.getString("code")%>.jpg">
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
                                <%
                                    if (request.getParameter("success") != null) {
                                        out.println("<div class='alert alert-success' style='width:100%' align='center'>Message Sent</div>");
                                    }
                                %>
                                <table class="table_working_hours table table-responsive">
                                    <tbody>
                                        <tr><td style='width:25%'>First Name </td><td><%=rs.getString("fname")%></td></tr>
                                        <tr><td>Last Name </td><td><%=rs.getString("lname")%></td></tr>
                                        <tr><td>Gender </td><td><%=rs.getString("gender")%></td></tr>
                                        <tr><td>Caste </td><td><%=rs.getString("caste")%></td></tr>
                                        <tr><td>Religion </td><td><%=rs.getString("religion")%></td></tr>
                                        <tr><td>Occuapation </td><td><%=rs.getString("occupation")%></td></tr>
                                        <tr><td>Date Of Birth</td><td><%=rs.getString("birth")%></td></tr>
                                        <tr><td>City </td><td><%=rs.getString("city")%></td></tr>
                                        <tr><td>State </td><td><%=rs.getString("state")%></td></tr>
                                        <tr><td>Country </td><td><%=rs.getString("country")%></td></tr>
                                    </tbody>
                                </table>

                            </div>
                            <div class="clearfix"> </div>
                        </div>

                    </div>
                    <div class="col-md-4 profile_right">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <label style="margin-left:50px;margin-top:8px"><%=rs.getString("fname")%> <%=rs.getString("lname")%></label>
                                <img src="upload/<%=rs.getString("code")%>.jpg" class="img-responsive" style="margin-top:-40px;width:40px;height:40px;border-radius: 50%">

                            </div>
                            <div class="panel-body"  id="chatPanel">
                               <div>
                            <%
                                PreparedStatement psm = cn.prepareStatement("select * from inbox where ( email='" + email + "' AND to_code='" + code + "') OR (to_email = '" + email + "' AND from_code ='" + code + "') order by sn ");
                                ResultSet rsm = psm.executeQuery();
                                while (rsm.next()) {    
                                    boolean sentByUser = rsm.getString("from_code").equals(code);
                                    if(sentByUser){


                            %>
                            <div style="text-align:left; margin-top:5px">
                                <label id="showmsg"><%= rsm.getString("msg") %></label>
                            </div>
                            <%      }
                                    else{
                                        %>
                            <div style="text-align:right; margin-top:5px" id="msgdel-<%= rsm.getString("code") %>">
                                
                                <label id="showmsg"><%= rsm.getString("msg") %></label>
                                <i class="fa fa-trash" id="<%= rsm.getString("code") %>"></i>
                            </div>
                            <% 
                                    }
                                }
                            %>
                        </div>
                                <div id='panelmsg' style="text-align:right">
                                    
                                </div>
                             </div>

                            <div class="panel-footer" id="usermsg">
                                <input placeholder="Type A Message.." name="msg" id="message">
                                <i class="fa fa-paper-plane" style="margin-left:10px"></i>
                                <%
                                    PreparedStatement psmi = cn.prepareStatement("select * from details where email='" + email + "' ");
                                    ResultSet rsmi = psmi.executeQuery();
                                    if (rsmi.next()) {

                                %>
                                <img src="upload/<%=rsmi.getString("code")%>.jpg" class="img-responsive" style="width:50px;height:50px;border-radius: 50%;margin-top: -45px">
                                <%}%>


                            </div>
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