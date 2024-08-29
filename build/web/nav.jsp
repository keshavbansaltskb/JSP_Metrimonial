<%-- 
    Document   : nav
    Created on : Mar 17, 2023, 1:52:13 PM
        Author     : keshav bansal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="js/jquery.min.js"></script>
<script>
   function myFunction() {
    var text = "Are You Sure For Delete Your Account!\nEither OK or Cancel.";
    if (confirm(text) == true) {
      window.open("http://localhost:8080/Metrimonial/delete.jsp" , "_self");
    } else {
        
    }
  }
  function Logout() {
    var text = "Are You Sure For Logout Your Account!\nEither OK or Cancel.";
    if (confirm(text) == true) {
      window.open("http://localhost:8080/Metrimonial/logout.jsp" , "_self");
    } else {
        
    }
  }
</script>
<%

    Cookie ct[] = request.getCookies();
    String useremail = null;
    for (int i = 0; i < ct.length; i++) {
        if (ct[i].getName().equals("login")) {
            useremail = ct[i].getValue();
            break;
        }
    }
    if (useremail != null) {

%>
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
        <p>Some text in the modal.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<div class="navbar navbar-inverse-blue navbar">
    
    <div class="navbar-inner navbar-inner_1">
        <div class="container">
            <div class="navigation">

            </div>
            <a class="brand" href="profile.jsp"><img src="images/logo.png" alt="logo"></a>
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
                        <ul class="nav navbar-nav nav_1">
                            <li><a href="profile.jsp">Home</a></li>
                            <li><a href="gallary.jsp">Gallary</a></li>
                            <li><a href="favorite_profile.jsp">Favorites</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Search<span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="search.jsp">Search Any Required</a></li>
                                    <li><a href="userviewprofile.jsp">Viewed Profiles</a></li>
                                    <li><a href="searched_id.jsp">Profiles By Search </a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Message<span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                     <li><a href="inbox.jsp">Get Messages</a></li>
                                     <li><a href="sentmsg.jsp">Sent Messages</a></li>
                                    
                                </ul>
                            </li>
                           
                            
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=useremail%><span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="edit.jsp">Edit profile</a></li>
                                    <li><a href="details.jsp">My Details</a></li>
                                    <li><a href="change_pass.jsp">Change Password</a></li>
                                    <li><a onclick="myFunction()" style="cursor:pointer">Delete Account</a></li>
                                    <li><a onclick="Logout()" style="cursor:pointer">Log Out</a></li>

                                </ul>
                            </li>

                        </ul>
                    </div><!-- /.navbar-collapse -->
                </nav>
            </div> <!-- end pull-right -->
            <div class="clearfix"> </div>
        </div> <!-- end container -->
    </div> <!-- end navbar-inner -->
</div> <!-- end navbar-inverse-blue -->

<%
    }

%>