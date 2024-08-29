<%-- 
    Document   : msg
    Created on : Mar 11, 2023, 10:32:01 PM
    Author     : keshav bansal
--%>

<%@page contentType="text/html" import='java.sql.*,java.util.*'  pageEncoding="UTF-8"%>

<%
    String to_code = request.getParameter("id");

    if (request.getParameter("msg").trim().length() == 0) {
        response.sendRedirect("view_profile.jsp?empty=1&id=" + to_code);
    } else {

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
                LinkedList ls = new LinkedList();
                for (int i = 0; i <= 9; i++) {
                    ls.add(i + "");
                }
                for (char i = 'A'; i <= 'Z'; i++) {
                    ls.add(i + "");
                }
                for (char i = 'a'; i <= 'z'; i++) {
                    ls.add(i + "");
                }
                Collections.shuffle(ls);
                String code = "";
                for (int i = 0; i < 6; i++) {
                    code = code + ls.get(i);
                }
                String dt = new java.util.Date() + "";
                String msg = request.getParameter("msg");
                String to_email = null;
                String from_email = null;
                String from_code = null;
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                    Statement st = cn.createStatement();
                    int sn = 0;
                    ResultSet rs = st.executeQuery("select MAX(sn) from inbox");
                    if (rs.next()) {
                        sn = rs.getInt(1);
                    }
                    sn++;
                    code = code + "_" + sn;
                    PreparedStatement ps = cn.prepareStatement("select * from details where email=?");
                    ps.setString(1, email);
                    ResultSet rst = ps.executeQuery();
                    if (rst.next()) {
                        from_email = rst.getString("email");
                        from_code = rst.getString("code");
                    } else {
                        response.sendRedirect("view_profile.jsp?error=1&id=" + to_code);
                    }
                    PreparedStatement psq = cn.prepareStatement("select * from details where code=?");
                    psq.setString(1, to_code);
                    ResultSet rsv = psq.executeQuery();
                    if (rsv.next()) {
                        to_email = rsv.getString("email");
                    } else {
                        response.sendRedirect("view_profile.jsp?error=1&id=" + to_code);
                    }
                    PreparedStatement pst = cn.prepareStatement("insert into inbox values(?,?,?,?,?,?,?,?)");
                    pst.setInt(1, sn);
                    pst.setString(2, code);
                    pst.setString(3, email);
                    pst.setString(4, to_email);
                    pst.setString(5, from_code);
                    pst.setString(6, to_code);
                    pst.setString(7, msg);
                    pst.setString(8, dt);
                    if (pst.executeUpdate() > 0) {
                        
                        %>
                        <div id="msgdel-<%=code%>">
                            <i class="fa fa-trash" id="<%=code%>"></i>
                            <label id="showmsg"><%=msg%></label>
                        </div>
                        <%
                    } else {
                        response.sendRedirect("view_profile.jsp?again=1&id=" + to_code);
                    }
                } catch (Exception er) {
                    out.println(er.getMessage());
                }
            }
        } catch (Exception e) {
            out.println(e.getMessage());
        }
    }
%>

