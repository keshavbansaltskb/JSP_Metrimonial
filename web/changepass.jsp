<%-- 
    Document   : changepass
    Created on : 24 Feb, 2023, 4:05:58 AM
    Author     : keshav bansal
--%>

<%@page contentType="text/html" import="java.sql.*, javax.servlet.http.Cookie" pageEncoding="UTF-8"%>

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
            if (request.getParameter("cp").trim().length() == 0 || request.getParameter("np").trim().length() == 0 || request.getParameter("rp").trim().length() == 0) {
                response.sendRedirect("change_pass.jsp?empty=1");
            } else {
                String cp = request.getParameter("cp").trim();
                String np = request.getParameter("np").trim();
                String rp = request.getParameter("rp").trim();
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery("select * from details where email='" + email + "'");
                if (rs.next()) {
                    if (cp.equals(rs.getString("password"))) {

                        PreparedStatement ps = cn.prepareStatement("update details set password=? where email=?");
                        ps.setString(1, np);
                        ps.setString(2, email);
                        if (ps.executeUpdate() > 0) {
                            out.print("success");
                        } else {
                            out.print("again");
                        }

                    } else {
                        out.print("invalid");
                    }
                } else {
                    response.sendRedirect("logout.jsp");
                }
            }
        }
    } catch (Exception er) {
        out.println(er.getMessage());
    }
%>