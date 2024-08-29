<%-- 
    Document   : like
    Created on : Jul 1, 2023, 11:03:00 AM
    Author     : keshav bansal
--%>
<%@page contentType="text/html" import="java.sql.*,java.util.*"  pageEncoding="UTF-8"%>
<%

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
        String user_code = request.getParameter("id");
        String dt = new java.util.Date() + "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
            
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery("select Max(sn) from fav");
            int sn = 0;
            if (rs.next()) {
                sn = rs.getInt(1);
            }
            sn++;
            PreparedStatement ps1 = cn.prepareStatement("select * from fav where email='" + email + "' AND user_code='" + user_code + "' ");
            ResultSet rs1 = ps1.executeQuery();
            if (rs1.next()) {
                int status =rs1.getInt("status");
                if (status == 1) {

                    PreparedStatement ps2 = cn.prepareStatement("delete from fav where email='" + email + "' AND user_code='" + user_code + "' ");
                    if (ps2.executeUpdate() > 0) {
                        out.print("delete");
                    }
                }

            } else {
                PreparedStatement ps4 = cn.prepareStatement("insert into fav values(?,?,?,?,?)");
                ps4.setInt(1,sn);
                ps4.setString(2,email);
                ps4.setString(3,user_code);
                ps4.setInt(4,1);
                ps4.setString(5,dt);
                if (ps4.executeUpdate() > 0) {
                    out.print("success");
                }
            }
            
            cn.close();
        } catch (Exception er) {
            out.println(er.getMessage());
        }
    }
%>    
