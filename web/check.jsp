<%-- 
    Document   : Check
    Created on : Feb 19, 2023, 3:30:43 PM
    Author     : keshav bansal
--%>

<%@page contentType="text/html" import='javax.servlet.http.Cookie,java.sql.*'  pageEncoding="UTF-8"%>

   <%
       String email=request.getParameter("email");
       String pass=request.getParameter("pass");
       try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery("select * from details where email='"+email+"'");
            if(rs.next()){
                if(rs.getString("password").equals(pass)){
                    Cookie c = new Cookie("login",email);
                    c.setMaxAge(3600*7*30);
                    response.addCookie(c);
                    response.sendRedirect("profile.jsp"); 
                    cn.close();
                }
                else{
                    response.sendRedirect("login.jsp?invalid_pass=1");
                }
            }
            else{
                response.sendRedirect("login.jsp?invalid=1");
            }
            
        }
        catch(Exception er){
            out.println(er.getMessage());
        }
%>