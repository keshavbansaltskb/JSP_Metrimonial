package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class image_005fupload_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("      \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
 
            
            String code = request.getParameter("id");
      
        
      out.write("\n");
      out.write("        \n");
      out.write("        <div class='container-fluid'>\n");
      out.write("            <div class='row'>\n");
      out.write("                <div class='col-sm-3'></div>\n");
      out.write("                <div class='col-sm-6'>\n");
      out.write("                    <div class='card'>\n");
      out.write("                        <div class='card-header bg-primary' style=\"color:white\" class='fd'>Select A Image : </div>\n");
      out.write("                        <div class='card-body'>\n");
      out.write("                            <form method=\"post\" ACTION=\"upload_image.jsp?id=");
      out.print(code);
      out.write("\" name=\"uploadForm\" ENCTYPE='multipart/form-data' class=\"form\">\n");
      out.write("                            <input type='file' name='uploadFile' class=\"table table-borderless\"><br>\n");
      out.write("                            <button class=\"btn btn-secondary\">Upload</button>\n");
      out.write("                            </form>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                 </div>\n");
      out.write("                <div class='col-sm-3'></div>\n");
      out.write("            </div>\n");
      out.write("       </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
