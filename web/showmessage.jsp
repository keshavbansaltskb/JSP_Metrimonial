<%-- 
    Document   : showmessage
    Created on : Mar 17, 2024, 6:05:04 PM
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
             try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
                String code = request.getParameter("code");
                
                %>
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
                <%
             } catch (Exception er) {
        response.sendRedirect("index.jsp");
    }
            }
    } catch (Exception er) {
        response.sendRedirect("index.jsp");
    }
%>