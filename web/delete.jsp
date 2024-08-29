<%-- 
    Document   : delete
    Created on : Feb 19, 2023, 4:24:19 PM
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
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
            PreparedStatement ps = cn.prepareStatement("delete from details where email=?");
            ps.setString(1, email);
            PreparedStatement ps1 = cn.prepareStatement("delete from fav where email=?");
            ps1.setString(1, email);
            PreparedStatement ps2 = cn.prepareStatement("delete from userdetails where email=?");
            ps2.setString(1, email);
            PreparedStatement ps3 = cn.prepareStatement("delete from viewed  where byuser=?");
            ps3.setString(1, email);
            PreparedStatement ps4 = cn.prepareStatement("delete from search where byuser=?");
            ps4.setString(1, email);
            PreparedStatement ps5 = cn.prepareStatement("delete from inbox where email=? OR to_email=?");
            ps5.setString(1, email);
            ps5.setString(2, email);
            if (ps.executeUpdate() > 0 && ps1.executeUpdate() > 0 && ps2.executeUpdate() > 0 && ps3.executeUpdate() > 0 && ps4.executeUpdate() > 0 && ps5.executeUpdate() > 0) {
                Cookie ct1 = new Cookie("login", null);
                ct1.setMaxAge(0);
                response.addCookie(ct1);
                response.sendRedirect("index.jsp?del_success=1");
            } else {
                response.sendRedirect("index.jsp?del_error=1");
            }
            cn.close();
        } catch (Exception er) {
            out.println(er.getMessage());
        }
    } catch (Exception er) {
        out.println(er.getMessage());
    }

%>
