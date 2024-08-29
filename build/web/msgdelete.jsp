<%-- 
    Document   : msgdelete
    Created on : Mar 17, 2024, 4:57:56 PM
    Author     : keshav bansal
--%>
<%@page contentType="text/html" import='java.sql.*,java.util.*'  pageEncoding="UTF-8"%>

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
                 String code = request.getParameter("id");
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                 PreparedStatement pst = cn.prepareStatement("delete from inbox where code=?");
                 pst.setString(1, code);
                 if (pst.executeUpdate() > 0) {
                     out.print("success");
                 } else {
                    out.print("error");
                 }
             } catch (Exception er) {
                 out.println(er.getMessage());
             }
         }
     } catch (Exception e) {
         out.println(e.getMessage());
     }
    
%>

