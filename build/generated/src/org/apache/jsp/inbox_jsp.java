package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.http.Cookie;
import java.sql.*;

public final class inbox_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/nav.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

        
        try{
           Cookie c[]=request.getCookies();
           String email=null;
           if(request.getParameter("email")!=null){
               email = request.getParameter("email");
           }
           for(int i=0 ; i<c.length ; i++){
               if(c[i].getName().equals("login")){
                   email = c[i].getValue();
                   break;
               }
           }
           if(email==null){
               response.sendRedirect("index.jsp");
           }
           else{
               try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
                    Statement st = cn.createStatement();
                    ResultSet rs = st.executeQuery("select * from details where email='"+email+"'");
                    if(rs.next()){
  
      out.write("\n");
      out.write("  \n");
      out.write("\n");
      out.write("<!DOCTYPE HTML>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title>Marital an Wedding Category Flat Bootstarp Resposive Website Template | Inbox :: w3layouts</title>\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("<meta name=\"keywords\" content=\"Marital Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, \n");
      out.write("Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design\" />\n");
      out.write("<script type=\"application/x-javascript\"> addEventListener(\"load\", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>\n");
      out.write("<link href=\"css/bootstrap-3.1.1.min.css\" rel='stylesheet' type='text/css' />\n");
      out.write("<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->\n");
      out.write("<script src=\"js/jquery.min.js\"></script>\n");
      out.write("<script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("<!-- Custom Theme files -->\n");
      out.write("<link href=\"css/style.css\" rel='stylesheet' type='text/css' />\n");
      out.write("<link href='//fonts.googleapis.com/css?family=Oswald:300,400,700' rel='stylesheet' type='text/css'>\n");
      out.write("<link href='//fonts.googleapis.com/css?family=Ubuntu:300,400,500,700' rel='stylesheet' type='text/css'>\n");
      out.write("<!----font-Awesome----->\n");
      out.write("<link href=\"css/font-awesome.css\" rel=\"stylesheet\"> \n");
      out.write("<!----font-Awesome----->\n");
      out.write("<script>\n");
      out.write("$(document).ready(function(){\n");
      out.write("    $(\".dropdown\").hover(            \n");
      out.write("        function() {\n");
      out.write("            $('.dropdown-menu', this).stop( true, true ).slideDown(\"fast\");\n");
      out.write("            $(this).toggleClass('open');        \n");
      out.write("        },\n");
      out.write("        function() {\n");
      out.write("            $('.dropdown-menu', this).stop( true, true ).slideUp(\"fast\");\n");
      out.write("            $(this).toggleClass('open');       \n");
      out.write("        }\n");
      out.write("    );\n");
      out.write("});\n");
      out.write("</script>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<!-- ============================  Navigation Start =========================== -->\n");
      out.write("  ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    
    Cookie ct[]=request.getCookies();
           String useremail=null;
           for(int i=0 ; i<ct.length ; i++){
               if(ct[i].getName().equals("login")){
                   useremail = ct[i].getValue();
                   break;
               }
           }
          if(useremail !=null){
                       
    
      out.write("\n");
      out.write("<div class=\"navbar navbar-inverse-blue navbar\">\n");
      out.write("    <!--<div class=\"navbar navbar-inverse-blue navbar-fixed-top\">-->\n");
      out.write("      <div class=\"navbar-inner navbar-inner_1\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("           <div class=\"navigation\">\n");
      out.write("              \n");
      out.write("           </div>\n");
      out.write("           <a class=\"brand\" href=\"profile.jsp\"><img src=\"images/logo.png\" alt=\"logo\"></a>\n");
      out.write("           <div class=\"pull-right\">\n");
      out.write("          \t<nav class=\"navbar nav_bottom\" role=\"navigation\">\n");
      out.write(" \n");
      out.write("\t\t <!-- Brand and toggle get grouped for better mobile display -->\n");
      out.write("\t\t  <div class=\"navbar-header nav_2\">\n");
      out.write("\t\t      <button type=\"button\" class=\"navbar-toggle collapsed navbar-toggle1\" data-toggle=\"collapse\" data-target=\"#bs-megadropdown-tabs\">Menu\n");
      out.write("\t\t        <span class=\"sr-only\">Toggle navigation</span>\n");
      out.write("\t\t        <span class=\"icon-bar\"></span>\n");
      out.write("\t\t        <span class=\"icon-bar\"></span>\n");
      out.write("\t\t        <span class=\"icon-bar\"></span>\n");
      out.write("\t\t      </button>\n");
      out.write("\t\t      <a class=\"navbar-brand\" href=\"#\"></a>\n");
      out.write("\t\t   </div> \n");
      out.write("\t\t   <!-- Collect the nav links, forms, and other content for toggling -->\n");
      out.write("\t\t    <div class=\"collapse navbar-collapse\" id=\"bs-megadropdown-tabs\">\n");
      out.write("\t\t        <ul class=\"nav navbar-nav nav_1\">\n");
      out.write("\t\t            <li><a href=\"profile.jsp\">Home</a></li>\n");
      out.write("\t\t            <li><a href=\"search.jsp\">Search</a></li>\n");
      out.write("\t\t           \n");
      out.write("\t\t    \t\t<li class=\"dropdown\">\n");
      out.write("\t\t              <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Matches<span class=\"caret\"></span></a>\n");
      out.write("\t\t              <ul class=\"dropdown-menu\" role=\"menu\">\n");
      out.write("\t\t                <li><a href=\"matches.html\">New Matches</a></li>\n");
      out.write("\t\t                <li><a href=\"viewed-profile.html\">Who Viewed my Profile</a></li>\n");
      out.write("\t\t                <li><a href=\"viewed-not_contacted.html\">Viewed & not Contacted</a></li>\n");
      out.write("\t\t                <li><a href=\"members.html\">Premium Members</a></li>\n");
      out.write("\t\t                <li><a href=\"shortlisted.html\">Shortlisted Profile</a></li>\n");
      out.write("\t\t              </ul>\n");
      out.write("\t\t            </li>\n");
      out.write("\t\t\t\t\t<li class=\"dropdown\">\n");
      out.write("\t\t              <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Search<span class=\"caret\"></span></a>\n");
      out.write("\t\t              <ul class=\"dropdown-menu\" role=\"menu\">\n");
      out.write("\t\t                <li><a href=\"search.html\">Regular Search</a></li>\n");
      out.write("\t\t                <li><a href=\"profile.html\">Recently Viewed Profiles</a></li>\n");
      out.write("\t\t                <li><a href=\"search-id.html\">Search By Profile ID</a></li>\n");
      out.write("\t\t                <li><a href=\"faq.html\">Faq</a></li>\n");
      out.write("\t\t                <li><a href=\"shortcodes.html\">Shortcodes</a></li>\n");
      out.write("\t\t              </ul>\n");
      out.write("\t\t            </li>j\n");
      out.write("\t\t            <li class=\"dropdown\">\n");
      out.write("\t\t              <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Messages<span class=\"caret\"></span></a>\n");
      out.write("\t\t              <ul class=\"dropdown-menu\" role=\"menu\">\n");
      out.write("\t\t                <li><a href=\"inbox.jsp\">Inbox</a></li>\n");
      out.write("\t\t                <li><a href=\"inbox.jsp\">New</a></li>\n");
      out.write("\t\t                <li><a href=\"inbox.jsp\">Accepted</a></li>\n");
      out.write("\t\t                <li><a href=\"sent.jsp\">Sent</a></li>\n");
      out.write("\t\t                <li><a href=\"upgrade.jsp\">Upgrade</a></li>\n");
      out.write("\t\t              </ul>\n");
      out.write("\t\t            </li>\n");
      out.write("\t\t            <li class=\"dropdown\">\n");
      out.write("\t\t              <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">");
      out.print(useremail);
      out.write("<span class=\"caret\"></span></a>\n");
      out.write("\t\t              <ul class=\"dropdown-menu\" role=\"menu\">\n");
      out.write("\t\t                <li><a href=\"edit.jsp\">Edit profile</a></li>\n");
      out.write("\t\t                <li><a href=\"change_pass.jsp\">Change Password</a></li>\n");
      out.write("\t\t                <li><a href=\"delete.jsp\">Delete Account</a></li>\n");
      out.write("\t\t                <li><a href=\"logout.jsp\">Log Out</a></li>\n");
      out.write("\t\t                \n");
      out.write("\t\t              </ul>\n");
      out.write("\t\t            </li>\n");
      out.write("\t\t            \n");
      out.write("\t\t        </ul>\n");
      out.write("\t\t     </div><!-- /.navbar-collapse -->\n");
      out.write("\t\t    </nav>\n");
      out.write("\t\t   </div> <!-- end pull-right -->\n");
      out.write("          <div class=\"clearfix\"> </div>\n");
      out.write("        </div> <!-- end container -->\n");
      out.write("      </div> <!-- end navbar-inner -->\n");
      out.write("    </div> <!-- end navbar-inverse-blue -->\n");
      out.write("    \n");
      out.write("    ");

          }
          
          
      out.write("\n");
      out.write("<!-- ============================  Navigation End ============================ -->\n");
      out.write("<div class=\"grid_3\">\n");
      out.write("  <div class=\"container\">\n");
      out.write("   <div class=\"breadcrumb1\">\n");
      out.write("     <ul>\n");
      out.write("        <a href=\"index.html\"><i class=\"fa fa-home home_1\"></i></a>\n");
      out.write("        <span class=\"divider\">&nbsp;|&nbsp;</span>\n");
      out.write("        <li class=\"current-page\">Inbox</li>\n");
      out.write("     </ul>\n");
      out.write("   </div>\n");
      out.write("   <div class=\"col-md-3 col_5\">\n");
      out.write("   \t <ul class=\"match_box\">\n");
      out.write("   \t \t<h4>Matches</h4>\n");
      out.write("   \t \t<li><a href=\"#\">Mutual Matches</a></li>\n");
      out.write("   \t \t<li><a href=\"#\">Profiles yet to be viewed</a></li>\n");
      out.write("   \t \t<li><a href=\"#\">Mutual Matches</a></li>\n");
      out.write("   \t </ul>\n");
      out.write("   \t <img src=\"images/v1.jpg\" class=\"img-responsive\" alt=\"\"/>\n");
      out.write("     <ul class=\"menu\">\n");
      out.write("\t\t<li class=\"item1\"><h3 class=\"m_2\">Show Profiles Created</h3>\n");
      out.write("\t\t  <ul class=\"cute\">\n");
      out.write("\t\t\t<li class=\"subitem1\"><a href=\"#\">within a week (2) </a></li>\n");
      out.write("\t\t\t<li class=\"subitem2\"><a href=\"#\">within a month (4)</a></li>\n");
      out.write("\t\t  </ul>\n");
      out.write("\t\t</li>\n");
      out.write("\t\t<li class=\"item1\"><h3 class=\"m_2\">Profile type</h3>\n");
      out.write("\t\t  <ul class=\"cute\">\n");
      out.write("\t\t\t<li class=\"subitem1\"><a href=\"#\">with Photo (3) </a></li>\n");
      out.write("\t\t  </ul>\n");
      out.write("\t\t</li>\n");
      out.write("\t\t<li class=\"item1\"><h3 class=\"m_2\">Marital Status</h3>\n");
      out.write("\t\t  <ul class=\"cute\">\n");
      out.write("\t\t\t<li class=\"subitem1\"><a href=\"#\">Unmarried (2) </a></li>\n");
      out.write("\t\t  </ul>\n");
      out.write("\t\t</li>\n");
      out.write("\t\t<li class=\"item1\"><h3 class=\"m_2\">Mother Tongue</h3>\n");
      out.write("\t\t  <ul class=\"cute\">\n");
      out.write("\t\t\t<li class=\"subitem1\"><a href=\"#\">English </a></li>\n");
      out.write("\t\t  </ul>\n");
      out.write("\t\t</li>\n");
      out.write("\t\t<li class=\"item1\"><h3 class=\"m_2\">Education</h3>\n");
      out.write("\t\t  <ul class=\"cute\">\n");
      out.write("\t\t\t<li class=\"subitem1\"><a href=\"#\">Bachelors-Engineering </a></li>\n");
      out.write("\t\t\t<li class=\"subitem1\"><a href=\"#\">Masters-Engineering </a></li>\n");
      out.write("\t\t  </ul>\n");
      out.write("\t\t</li>\n");
      out.write("\t\t<li class=\"item1\"><h3 class=\"m_2\">Occupation</h3>\n");
      out.write("\t\t  <ul class=\"cute\">\n");
      out.write("\t\t\t<li class=\"subitem1\"><a href=\"#\">Engineer-Non IT (2) </a></li>\n");
      out.write("\t\t\t<li class=\"subitem1\"><a href=\"#\">Software Professional (3)</a></li>\n");
      out.write("\t\t  </ul>\n");
      out.write("\t\t</li>\n");
      out.write("\t\t<li class=\"item1\"><h3 class=\"m_2\">Physical Status</h3>\n");
      out.write("\t\t  <ul class=\"cute\">\n");
      out.write("\t\t\t<li class=\"subitem1\"><a href=\"#\">Normal (2) </a></li>\n");
      out.write("\t\t  </ul>\n");
      out.write("\t\t</li>\n");
      out.write("\t\t<li class=\"item1\"><h3 class=\"m_2\">Eating Habits</h3>\n");
      out.write("\t\t  <ul class=\"cute\">\n");
      out.write("\t\t\t<li class=\"subitem1\"><a href=\"#\">Non Vegetarian (3)</a></li>\n");
      out.write("\t\t\t<li class=\"subitem1\"><a href=\"#\">Vegetarian (2)</a></li>\n");
      out.write("\t\t  </ul>\n");
      out.write("\t\t</li>\n");
      out.write("\t\t<li class=\"item1\"><h3 class=\"m_2\">Smoking</h3>\n");
      out.write("\t\t  <ul class=\"cute\">\n");
      out.write("\t\t\t<li class=\"subitem1\"><a href=\"#\">Not Specified (3)</a></li>\n");
      out.write("\t\t  </ul>\n");
      out.write("\t\t</li>\n");
      out.write("\t\t<li class=\"item1\"><h3 class=\"m_2\">Drinking</h3>\n");
      out.write("\t\t  <ul class=\"cute\">\n");
      out.write("\t\t\t<li class=\"subitem1\"><a href=\"#\">Not Specified (3)</a></li>\n");
      out.write("\t\t\t<li class=\"subitem1\"><a href=\"#\">Never Drinks (3)</a></li>\n");
      out.write("\t\t  </ul>\n");
      out.write("\t\t</li>\n");
      out.write("\t\t<li class=\"item1\"><h3 class=\"m_2\">Profile Created by</h3>\n");
      out.write("\t\t  <ul class=\"cute\">\n");
      out.write("\t\t\t<li class=\"subitem1\"><a href=\"#\">Self (1)</a></li>\n");
      out.write("\t\t  </ul>\n");
      out.write("\t\t</li>\n");
      out.write("\t  </ul>\n");
      out.write("   </div>\n");
      out.write("   <div class=\"col-md-9 members_box2\">\n");
      out.write("   \t   <h3>Inbox</h3>\n");
      out.write("   \t   <p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\n");
      out.write("       <div class=\"col_4\">\n");
      out.write("\t\t    <div class=\"bs-example bs-example-tabs\" role=\"tabpanel\" data-example-id=\"togglable-tabs\">\n");
      out.write("\t\t\t   <ul id=\"myTab\" class=\"nav nav-tabs nav-tabs1\" role=\"tablist\">\n");
      out.write("\t\t\t\t  <li role=\"presentation\" class=\"active\"><a href=\"#home\" id=\"home-tab\" role=\"tab\" data-toggle=\"tab\" aria-controls=\"home\" aria-expanded=\"true\">All</a></li>\n");
      out.write("\t\t\t\t  <li role=\"presentation\"><a href=\"#profile\" role=\"tab\" id=\"profile-tab\" data-toggle=\"tab\" aria-controls=\"profile\">New</a></li>\n");
      out.write("\t\t\t\t  <li role=\"presentation\"><a href=\"#profile1\" role=\"tab\" id=\"profile-tab\" data-toggle=\"tab\" aria-controls=\"profile\">Read</a></li>\n");
      out.write("\t\t\t\t  <li role=\"presentation\"><a href=\"#profile2\" role=\"tab\" id=\"profile-tab\" data-toggle=\"tab\" aria-controls=\"profile\">Accepted</a></li>\n");
      out.write("\t\t\t\t  <li role=\"presentation\"><a href=\"#profile2\" role=\"tab\" id=\"profile-tab\" data-toggle=\"tab\" aria-controls=\"profile\">Not Interested</a></li>\n");
      out.write("\t\t\t   </ul>\n");
      out.write("\t\t\t   <div id=\"myTabContent\" class=\"tab-content\">\n");
      out.write("\t\t\t\t  <div role=\"tabpanel\" class=\"tab-pane fade in active\" id=\"home\" aria-labelledby=\"home-tab\">\n");
      out.write("\t\t\t\t    <ul class=\"pagination pagination_1\">\n");
      out.write("\t\t\t\t \t  <li class=\"active\"><a href=\"#\">1</a></li>\n");
      out.write("\t\t\t\t \t  <li><a href=\"#\">2</a></li>\n");
      out.write("\t\t\t\t \t  <li><a href=\"#\">3</a></li>\n");
      out.write("\t\t\t\t \t  <li><a href=\"#\">4</a></li>\n");
      out.write("\t\t\t\t \t  <li><a href=\"#\">5</a></li>\n");
      out.write("\t\t\t\t \t  <li><a href=\"#\">...</a></li>\n");
      out.write("\t\t\t\t \t  <li><a href=\"#\">Next</a></li>\n");
      out.write("\t                </ul>\n");
      out.write("\t                <div class=\"clearfix\"> </div>\n");
      out.write("\t                <div class=\"jobs-item with-thumb\">\n");
      out.write("\t                   <div class=\"thumb_top\">\n");
      out.write("\t\t\t\t        <div class=\"thumb\"><a href=\"view_profile.html\"><img src=\"images/p13.jpg\" class=\"img-responsive\" alt=\"\"/></a></div>\n");
      out.write("\t\t\t\t\t    <div class=\"jobs_right\">\n");
      out.write("\t\t\t\t\t\t\t<h6 class=\"title\"><a href=\"view_profile.html\">Lorem (2547189)</a></h6>\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"top-btns\">\n");
      out.write("\t\t\t\t\t\t\t  <li><a href=\"#\" class=\"fa fa-facebook\"></a></li>\n");
      out.write("\t\t\t\t\t\t\t  <li><a href=\"#\" class=\"fa fa-twitter\"></a></li>\n");
      out.write("\t\t\t\t\t\t\t  <li><a href=\"#\" class=\"fa fa-google-plus\"></a></li>\n");
      out.write("\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"login_details1\">\n");
      out.write("\t\t\t\t\t\t\t  <li>Last Login : 5 days ago</li>\n");
      out.write("\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t<p class=\"description\">30 years, 5 Ft 7 In / 170 Cms | <span class=\"m_1\">Reliogion</span> : Hindu | <span class=\"m_1\">Education</span> : B.Tech | <span class=\"m_1\">Occupation</span> : Software Professional<br><a href=\"view_profile.html\" class=\"read-more\">view full profile</a></p>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<div class=\"clearfix\"> </div>\n");
      out.write("\t\t\t\t\t   </div>\n");
      out.write("\t\t\t\t\t   <div class=\"thumb_bottom\">\n");
      out.write("\t\t\t\t\t   \t  <div class=\"thumb\"><a href=\"view_profile.html\" class=\"photo_view\">Add Photo</a></div>\n");
      out.write("\t\t\t\t\t   \t   <div class=\"thumb_but\"><a href=\"view_profile.html\" class=\"photo_view\">Send Mail</a></div>\n");
      out.write("\t\t\t\t\t   \t  <div class=\"clearfix\"> </div>\n");
      out.write("\t\t\t\t\t   </div>\n");
      out.write("\t\t\t\t\t  </div>\n");
      out.write("\t\t\t\t\t  \n");
      out.write("\t\t\t\t\t  \n");
      out.write("\t\t\t\t  </div>\n");
      out.write("\t\t\t\t  <div role=\"tabpanel\" class=\"tab-pane fade\" id=\"profile\" aria-labelledby=\"profile-tab\">\n");
      out.write("\t\t\t\t    <div class=\"jobs-item with-thumb\">\n");
      out.write("\t                   <div class=\"thumb_top\">\n");
      out.write("\t\t\t\t        <div class=\"thumb\"><a href=\"view_profile.html\"><img src=\"images/s3.jpg\" class=\"img-responsive\" alt=\"\"/></a></div>\n");
      out.write("\t\t\t\t\t    <div class=\"jobs_right\">\n");
      out.write("\t\t\t\t\t\t\t<h6 class=\"title\"><a href=\"view_profile.html\">Lorem (2547189)</a></h6>\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"top-btns\">\n");
      out.write("\t\t\t\t\t\t\t  <li><a href=\"#\" class=\"fa fa-facebook\"></a></li>\n");
      out.write("\t\t\t\t\t\t\t  <li><a href=\"#\" class=\"fa fa-twitter\"></a></li>\n");
      out.write("\t\t\t\t\t\t\t  <li><a href=\"#\" class=\"fa fa-google-plus\"></a></li>\n");
      out.write("\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"login_details1\">\n");
      out.write("\t\t\t\t\t\t\t  <li>Last Login : 5 days ago</li>\n");
      out.write("\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t<p class=\"description\">30 years, 5 Ft 7 In / 170 Cms | <span class=\"m_1\">Reliogion</span> : Hindu | <span class=\"m_1\">Education</span> : B.Tech | <span class=\"m_1\">Occupation</span> : Software Professional<br><a href=\"view_profile.html\" class=\"read-more\">view full profile</a></p>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<div class=\"clearfix\"> </div>\n");
      out.write("\t\t\t\t\t   </div>\n");
      out.write("\t\t\t\t\t   <div class=\"thumb_bottom\">\n");
      out.write("\t\t\t\t\t   \t  <a href=\"view_profile.jsp?id=");
      out.print(rs.getString("code"));
      out.write("\"><div class=\"vertical\">View Profile</div></a>\n");
      out.write("\t\t\t\t\t   \t  <div class=\"clearfix\"> </div>\n");
      out.write("\t\t\t\t\t   </div>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<div class=\"jobs-item with-thumb\">\n");
      out.write("\t                   <div class=\"thumb_top\">\n");
      out.write("\t\t\t\t        <div class=\"thumb\"><a href=\"view_profile.html\"><img src=\"images/s3.jpg\" class=\"img-responsive\" alt=\"\"/></a></div>\n");
      out.write("\t\t\t\t\t    <div class=\"jobs_right\">\n");
      out.write("\t\t\t\t\t\t\t<h6 class=\"title\"><a href=\"view_profile.html\">Lorem (2547189)</a></h6>\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"top-btns\">\n");
      out.write("\t\t\t\t\t\t\t  <li><a href=\"#\" class=\"fa fa-facebook\"></a></li>\n");
      out.write("\t\t\t\t\t\t\t  <li><a href=\"#\" class=\"fa fa-twitter\"></a></li>\n");
      out.write("\t\t\t\t\t\t\t  <li><a href=\"#\" class=\"fa fa-google-plus\"></a></li>\n");
      out.write("\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"login_details1\">\n");
      out.write("\t\t\t\t\t\t\t  <li>Last Login : 5 days ago</li>\n");
      out.write("\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t<p class=\"description\">30 years, 5 Ft 7 In / 170 Cms | <span class=\"m_1\">Reliogion</span> : Hindu | <span class=\"m_1\">Education</span> : B.Tech | <span class=\"m_1\">Occupation</span> : Software Professional<br><a href=\"view_profile.html\" class=\"read-more\">view full profile</a></p>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<div class=\"clearfix\"> </div>\n");
      out.write("\t\t\t\t\t   </div>\n");
      out.write("\t\t\t\t\t   <div class=\"thumb_bottom\">\n");
      out.write("\t\t\t\t\t   \t  <div class=\"thumb\"><a href=\"view_profile.html\" class=\"photo_view\">Add Photo</a></div>\n");
      out.write("\t\t\t\t\t   \t   <div class=\"thumb_but\"><a href=\"view_profile.html\" class=\"photo_view\">Send Mail</a></div>\n");
      out.write("\t\t\t\t\t   \t  <div class=\"clearfix\"> </div>\n");
      out.write("\t\t\t\t\t   </div>\n");
      out.write("\t\t\t\t\t  </div>\n");
      out.write("\t\t\t\t\t  <div class=\"jobs-item with-thumb\">\n");
      out.write("\t                   <div class=\"thumb_top\">\n");
      out.write("\t\t\t\t        <div class=\"thumb\"><a href=\"view_profile.html\"><img src=\"images/s3.jpg\" class=\"img-responsive\" alt=\"\"/></a></div>\n");
      out.write("\t\t\t\t\t    <div class=\"jobs_right\">\n");
      out.write("\t\t\t\t\t\t\t<h6 class=\"title\"><a href=\"view_profile.html\">Lorem (2547189)</a></h6>\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"top-btns\">\n");
      out.write("\t\t\t\t\t\t\t  <li><a href=\"#\" class=\"fa fa-facebook\"></a></li>\n");
      out.write("\t\t\t\t\t\t\t  <li><a href=\"#\" class=\"fa fa-twitter\"></a></li>\n");
      out.write("\t\t\t\t\t\t\t  <li><a href=\"#\" class=\"fa fa-google-plus\"></a></li>\n");
      out.write("\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"login_details1\">\n");
      out.write("\t\t\t\t\t\t\t  <li>Last Login : 5 days ago</li>\n");
      out.write("\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t<p class=\"description\">30 years, 5 Ft 7 In / 170 Cms | <span class=\"m_1\">Reliogion</span> : Hindu | <span class=\"m_1\">Education</span> : B.Tech | <span class=\"m_1\">Occupation</span> : Software Professional<br><a href=\"view_profile.html\" class=\"read-more\">view full profile</a></p>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<div class=\"clearfix\"> </div>\n");
      out.write("\t\t\t\t\t   </div>\n");
      out.write("\t\t\t\t\t   <div class=\"thumb_bottom\">\n");
      out.write("\t\t\t\t\t   \t  <div class=\"thumb\"><a href=\"view_profile.html\" class=\"photo_view\">Add Photo</a></div>\n");
      out.write("\t\t\t\t\t   \t   <div class=\"thumb_but\"><a href=\"view_profile.html\" class=\"photo_view\">Send Mail</a></div>\n");
      out.write("\t\t\t\t\t   \t  <div class=\"clearfix\"> </div>\n");
      out.write("\t\t\t\t\t   </div>\n");
      out.write("\t\t\t\t\t  </div>\n");
      out.write("\t\t\t\t </div>\n");
      out.write("\t\t\t\t <div role=\"tabpanel\" class=\"tab-pane fade\" id=\"profile1\" aria-labelledby=\"profile-tab\">\n");
      out.write("\t\t\t\t    <div class=\"terms\">\n");
      out.write("            \t\t  <h2>Your Privacy Settings</h2>\n");
      out.write("\t\t\t\t\t   <div class=\"terms_top\">\n");
      out.write("\t\t\t\t\t\t<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>\n");
      out.write("\t\t\t\t\t\t<ol class=\"terms_list\">\n");
      out.write("\t\t\t\t\t\t\t<li>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\".</li>\n");
      out.write("\t\t\t\t\t\t\t<li>Lusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati.</li>\n");
      out.write("\t\t\t\t\t\t\t<li>Praesentium voluptatum deleniti atque corrupti quos</li>\n");
      out.write("\t\t\t\t\t\t\t<li>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi.</li>\n");
      out.write("\t\t\t\t\t\t\t<li>Mentum eleifend enim a feugiat distinctio lor</li>\n");
      out.write("\t\t\t\t\t\t</ol>\n");
      out.write("\t\t\t\t\t\t<h4>There are many variations of passages</h4>\n");
      out.write("\t\t\t\t\t\t<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non libero magna. Sed et quam lacus. Fusce condimentum eleifend enim a feugiat. Pellentesque viverra vehicula sem ut volutpat. Integer sed arcu. At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non <a href=\"#\">libero consectetur adipiscing</a> elit magna. Sed et quam lacus. Fusce condimentum eleifend enim a feugiat. Pellentesque viverra vehicula sem ut volutpat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non libero magna. Sed et quam lacus. Fusce condimentum eleifend enim a feugiat.</p>\n");
      out.write("\t\t\t\t\t\t<p><strong>Iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non sit amet, consectetur adipiscing elit. Ut adipiscing elit magna. Sed et quam lacus. Fusce condimentum eleifend enim a feugiat. Pellentesque lorem ipsum dolor sit amet. Ut non libero magna. Sed et quam lacus. Fusce condimentum eleifend enim a feugiat <a href=\"#\">consectetur adipiscing elit</a>.</strong></p>\n");
      out.write("\t\t\t\t\t  </div> \t\n");
      out.write("\t\t           </div>\n");
      out.write("\t\t\t\t </div>\n");
      out.write("\t\t\t\t <div role=\"tabpanel\" class=\"tab-pane fade\" id=\"profile2\" aria-labelledby=\"profile-tab\">\n");
      out.write("\t\t\t\t    <div class=\"jobs-item with-thumb\">\n");
      out.write("\t                   <div class=\"thumb_top\">\n");
      out.write("\t\t\t\t        <div class=\"thumb\"><a href=\"view_profile.html\"><img src=\"images/s3.jpg\" class=\"img-responsive\" alt=\"\"/></a></div>\n");
      out.write("\t\t\t\t\t    <div class=\"jobs_right\">\n");
      out.write("\t\t\t\t\t\t\t<h6 class=\"title\"><a href=\"view_profile.html\">Lorem (2547189)</a></h6>\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"top-btns\">\n");
      out.write("\t\t\t\t\t\t\t  <li><a href=\"#\" class=\"fa fa-facebook\"></a></li>\n");
      out.write("\t\t\t\t\t\t\t  <li><a href=\"#\" class=\"fa fa-twitter\"></a></li>\n");
      out.write("\t\t\t\t\t\t\t  <li><a href=\"#\" class=\"fa fa-google-plus\"></a></li>\n");
      out.write("\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"login_details1\">\n");
      out.write("\t\t\t\t\t\t\t  <li>Last Login : 5 days ago</li>\n");
      out.write("\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t<p class=\"description\">30 years, 5 Ft 7 In / 170 Cms | <span class=\"m_1\">Reliogion</span> : Hindu | <span class=\"m_1\">Education</span> : B.Tech | <span class=\"m_1\">Occupation</span> : Software Professional<br><a href=\"view_profile.html\" class=\"read-more\">view full profile</a></p>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<div class=\"clearfix\"> </div>\n");
      out.write("\t\t\t\t\t   </div>\n");
      out.write("\t\t\t\t\t   <div class=\"thumb_bottom\">\n");
      out.write("\t\t\t\t\t   \t  <div class=\"thumb\"><a href=\"view_profile.html\" class=\"photo_view\">Add Photo</a></div>\n");
      out.write("\t\t\t\t\t   \t   <div class=\"thumb_but\"><a href=\"view_profile.html\" class=\"photo_view\">Send Mail</a></div>\n");
      out.write("\t\t\t\t\t   \t  <div class=\"clearfix\"> </div>\n");
      out.write("\t\t\t\t\t   </div>\n");
      out.write("\t\t\t\t\t  </div>\n");
      out.write("\t\t\t\t\t  <div class=\"jobs-item with-thumb\">\n");
      out.write("\t                   <div class=\"thumb_top\">\n");
      out.write("\t\t\t\t        <div class=\"thumb\"><a href=\"view_profile.html\"><img src=\"images/s3.jpg\" class=\"img-responsive\" alt=\"\"/></a></div>\n");
      out.write("\t\t\t\t\t    <div class=\"jobs_right\">\n");
      out.write("\t\t\t\t\t\t\t<h6 class=\"title\"><a href=\"view_profile.html\">Lorem (2547189)</a></h6>\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"top-btns\">\n");
      out.write("\t\t\t\t\t\t\t  <li><a href=\"#\" class=\"fa fa-facebook\"></a></li>\n");
      out.write("\t\t\t\t\t\t\t  <li><a href=\"#\" class=\"fa fa-twitter\"></a></li>\n");
      out.write("\t\t\t\t\t\t\t  <li><a href=\"#\" class=\"fa fa-google-plus\"></a></li>\n");
      out.write("\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"login_details1\">\n");
      out.write("\t\t\t\t\t\t\t  <li>Last Login : 5 days ago</li>\n");
      out.write("\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t<p class=\"description\">30 years, 5 Ft 7 In / 170 Cms | <span class=\"m_1\">Reliogion</span> : Hindu | <span class=\"m_1\">Education</span> : B.Tech | <span class=\"m_1\">Occupation</span> : Software Professional<br><a href=\"view_profile.html\" class=\"read-more\">view full profile</a></p>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<div class=\"clearfix\"> </div>\n");
      out.write("\t\t\t\t\t   </div>\n");
      out.write("\t\t\t\t\t   <div class=\"thumb_bottom\">\n");
      out.write("\t\t\t\t\t   \t  <div class=\"thumb\"><a href=\"view_profile.html\" class=\"photo_view\">Add Photo</a></div>\n");
      out.write("\t\t\t\t\t   \t   <div class=\"thumb_but\"><a href=\"view_profile.html\" class=\"photo_view\">Send Mail</a></div>\n");
      out.write("\t\t\t\t\t   \t  <div class=\"clearfix\"> </div>\n");
      out.write("\t\t\t\t\t   </div>\n");
      out.write("\t\t\t\t\t  </div>\n");
      out.write("\t\t\t\t\t  <div class=\"jobs-item with-thumb\">\n");
      out.write("\t                   <div class=\"thumb_top\">\n");
      out.write("\t\t\t\t        <div class=\"thumb\"><a href=\"view_profile.html\"><img src=\"images/s3.jpg\" class=\"img-responsive\" alt=\"\"/></a></div>\n");
      out.write("\t\t\t\t\t    <div class=\"jobs_right\">\n");
      out.write("\t\t\t\t\t\t\t<h6 class=\"title\"><a href=\"view_profile.html\">Lorem (2547189)</a></h6>\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"top-btns\">\n");
      out.write("\t\t\t\t\t\t\t  <li><a href=\"#\" class=\"fa fa-facebook\"></a></li>\n");
      out.write("\t\t\t\t\t\t\t  <li><a href=\"#\" class=\"fa fa-twitter\"></a></li>\n");
      out.write("\t\t\t\t\t\t\t  <li><a href=\"#\" class=\"fa fa-google-plus\"></a></li>\n");
      out.write("\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"login_details1\">\n");
      out.write("\t\t\t\t\t\t\t  <li>Last Login : 5 days ago</li>\n");
      out.write("\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t<p class=\"description\">30 years, 5 Ft 7 In / 170 Cms | <span class=\"m_1\">Reliogion</span> : Hindu | <span class=\"m_1\">Education</span> : B.Tech | <span class=\"m_1\">Occupation</span> : Software Professional<br><a href=\"view_profile.html\" class=\"read-more\">view full profile</a></p>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<div class=\"clearfix\"> </div>\n");
      out.write("\t\t\t\t\t   </div>\n");
      out.write("\t\t\t\t\t   <div class=\"thumb_bottom\">\n");
      out.write("\t\t\t\t\t   \t  <div class=\"thumb\"><a href=\"view_profile.html\" class=\"photo_view\">Add Photo</a></div>\n");
      out.write("\t\t\t\t\t   \t   <div class=\"thumb_but\"><a href=\"view_profile.html\" class=\"photo_view\">Send Mail</a></div>\n");
      out.write("\t\t\t\t\t   \t  <div class=\"clearfix\"> </div>\n");
      out.write("\t\t\t\t\t   </div>\n");
      out.write("\t\t\t\t\t  </div>\n");
      out.write("\t\t\t\t\t  <div class=\"jobs-item with-thumb\">\n");
      out.write("\t                   <div class=\"thumb_top\">\n");
      out.write("\t\t\t\t        <div class=\"thumb\"><a href=\"view_profile.html\"><img src=\"images/s3.jpg\" class=\"img-responsive\" alt=\"\"/></a></div>\n");
      out.write("\t\t\t\t\t    <div class=\"jobs_right\">\n");
      out.write("\t\t\t\t\t\t\t<h6 class=\"title\"><a href=\"view_profile.html\">Lorem (2547189)</a></h6>\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"top-btns\">\n");
      out.write("\t\t\t\t\t\t\t  <li><a href=\"#\" class=\"fa fa-facebook\"></a></li>\n");
      out.write("\t\t\t\t\t\t\t  <li><a href=\"#\" class=\"fa fa-twitter\"></a></li>\n");
      out.write("\t\t\t\t\t\t\t  <li><a href=\"#\" class=\"fa fa-google-plus\"></a></li>\n");
      out.write("\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t<ul class=\"login_details1\">\n");
      out.write("\t\t\t\t\t\t\t  <li>Last Login : 5 days ago</li>\n");
      out.write("\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t<p class=\"description\">30 years, 5 Ft 7 In / 170 Cms | <span class=\"m_1\">Reliogion</span> : Hindu | <span class=\"m_1\">Education</span> : B.Tech | <span class=\"m_1\">Occupation</span> : Software Professional<br><a href=\"view_profile.html\" class=\"read-more\">view full profile</a></p>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t<div class=\"clearfix\"> </div>\n");
      out.write("\t\t\t\t\t   </div>\n");
      out.write("\t\t\t\t\t   <div class=\"thumb_bottom\">\n");
      out.write("\t\t\t\t\t   \t  <div class=\"thumb\"><a href=\"view_profile.html\" class=\"photo_view\">Add Photo</a></div>\n");
      out.write("\t\t\t\t\t   \t   <div class=\"thumb_but\"><a href=\"view_profile.html\" class=\"photo_view\">Send Mail</a></div>\n");
      out.write("\t\t\t\t\t   \t  <div class=\"clearfix\"> </div>\n");
      out.write("\t\t\t\t\t   </div>\n");
      out.write("\t\t\t\t\t  </div>\n");
      out.write("\t\t\t\t </div>\n");
      out.write("\t\t\t\t <div role=\"tabpanel\" class=\"tab-pane fade\" id=\"profile3\" aria-labelledby=\"profile-tab\">\n");
      out.write("\t\t\t\t    <div class=\"terms\">\n");
      out.write("            \t\t  <h2>Your Privacy Settings</h2>\n");
      out.write("\t\t\t\t\t   <div class=\"terms_top\">\n");
      out.write("\t\t\t\t\t\t<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>\n");
      out.write("\t\t\t\t\t\t<ol class=\"terms_list\">\n");
      out.write("\t\t\t\t\t\t\t<li>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\".</li>\n");
      out.write("\t\t\t\t\t\t\t<li>Lusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati.</li>\n");
      out.write("\t\t\t\t\t\t\t<li>Praesentium voluptatum deleniti atque corrupti quos</li>\n");
      out.write("\t\t\t\t\t\t\t<li>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi.</li>\n");
      out.write("\t\t\t\t\t\t\t<li>Mentum eleifend enim a feugiat distinctio lor</li>\n");
      out.write("\t\t\t\t\t\t</ol>\n");
      out.write("\t\t\t\t\t\t<h4>There are many variations of passages</h4>\n");
      out.write("\t\t\t\t\t\t<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non libero magna. Sed et quam lacus. Fusce condimentum eleifend enim a feugiat. Pellentesque viverra vehicula sem ut volutpat. Integer sed arcu. At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non <a href=\"#\">libero consectetur adipiscing</a> elit magna. Sed et quam lacus. Fusce condimentum eleifend enim a feugiat. Pellentesque viverra vehicula sem ut volutpat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non libero magna. Sed et quam lacus. Fusce condimentum eleifend enim a feugiat.</p>\n");
      out.write("\t\t\t\t\t\t<p><strong>Iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non sit amet, consectetur adipiscing elit. Ut adipiscing elit magna. Sed et quam lacus. Fusce condimentum eleifend enim a feugiat. Pellentesque lorem ipsum dolor sit amet. Ut non libero magna. Sed et quam lacus. Fusce condimentum eleifend enim a feugiat <a href=\"#\">consectetur adipiscing elit</a>.</strong></p>\n");
      out.write("\t\t\t\t\t  </div> \t\n");
      out.write("\t\t           </div>\n");
      out.write("\t\t\t\t </div>\n");
      out.write("\t\t\t </div> \n");
      out.write("\t\t  </div>\n");
      out.write("\t   </div>\n");
      out.write("    </div>\n");
      out.write("   <div class=\"clearfix\"> </div>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("<div class=\"map\">\n");
      out.write("\t<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d3150859.767904157!2d-96.62081048651531!3d39.536794757966845!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1408111832978\"> </iframe>\n");
      out.write("</div>\n");
      out.write("<div class=\"footer\">\n");
      out.write("    \t<div class=\"container\">\n");
      out.write("    \t\t<div class=\"col-md-4 col_2\">\n");
      out.write("    \t\t\t<h4>About Us</h4>\n");
      out.write("    \t\t\t<p>\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.\"</p>\n");
      out.write("    \t\t</div>\n");
      out.write("    \t\t<div class=\"col-md-2 col_2\">\n");
      out.write("    \t\t\t<h4>Help & Support</h4>\n");
      out.write("    \t\t\t<ul class=\"footer_links\">\n");
      out.write("    \t\t\t\t<li><a href=\"#\">24x7 Live help</a></li>\n");
      out.write("    \t\t\t\t<li><a href=\"contact.html\">Contact us</a></li>\n");
      out.write("    \t\t\t\t<li><a href=\"#\">Feedback</a></li>\n");
      out.write("    \t\t\t\t<li><a href=\"faq.html\">FAQs</a></li>\n");
      out.write("    \t\t\t</ul>\n");
      out.write("    \t\t</div>\n");
      out.write("    \t\t<div class=\"col-md-2 col_2\">\n");
      out.write("    \t\t\t<h4>Quick Links</h4>\n");
      out.write("    \t\t\t<ul class=\"footer_links\">\n");
      out.write("    \t\t\t\t<li><a href=\"privacy.html\">Privacy Policy</a></li>\n");
      out.write("    \t\t\t\t<li><a href=\"terms.html\">Terms and Conditions</a></li>\n");
      out.write("    \t\t\t\t<li><a href=\"services.html\">Services</a></li>\n");
      out.write("    \t\t\t</ul>\n");
      out.write("    \t\t</div>\n");
      out.write("    \t\t<div class=\"col-md-2 col_2\">\n");
      out.write("    \t\t\t<h4>Social</h4>\n");
      out.write("    \t\t\t<ul class=\"footer_social\">\n");
      out.write("\t\t\t\t  <li><a href=\"#\"><i class=\"fa fa-facebook fa1\"> </i></a></li>\n");
      out.write("\t\t\t\t  <li><a href=\"#\"><i class=\"fa fa-twitter fa1\"> </i></a></li>\n");
      out.write("\t\t\t\t  <li><a href=\"#\"><i class=\"fa fa-google-plus fa1\"> </i></a></li>\n");
      out.write("\t\t\t\t  <li><a href=\"#\"><i class=\"fa fa-youtube fa1\"> </i></a></li>\n");
      out.write("\t\t\t    </ul>\n");
      out.write("    \t\t</div>\n");
      out.write("    \t\t<div class=\"clearfix\"> </div>\n");
      out.write("    \t\t<div class=\"copy\">\n");
      out.write("\t\t       <p>Copyright © 2015 Marital . All Rights Reserved  | Design by <a href=\"http://w3layouts.com/\" target=\"_blank\">W3layouts</a> </p>\n");
      out.write("\t        </div>\n");
      out.write("      </div>\n");
      out.write("</div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");

                    }
                    else{
                        response.sendRedirect("index.jsp?invalid=1");
                    }

                }
                catch(Exception er){
                    out.println(er.getMessage());
                }
           }
      }
      catch(Exception er){
          response.sendRedirect("index.jsp");
      }

    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
