<%-- 
    Document   : deleteimg
    Created on : Jul 3, 2023, 3:15:41 PM
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
            String code = request.getParameter("id");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                PreparedStatement ps = cn.prepareStatement("delete from userdata where code=?");
                ps.setString(1, code);
                if (ps.executeUpdate() > 0) {
                    out.println("success");
                } else {
                    response.sendRedirect("gallary.jsp?del_error=1");
                }
                cn.close();
            } catch (Exception er) {
                out.println(er.getMessage());
            }
        }
    } catch (Exception er) {
        out.println(er.getMessage());
    }

%>
