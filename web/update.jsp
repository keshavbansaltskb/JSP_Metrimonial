<%-- 
    Document   : update
    Created on : Feb 19, 2023, 4:17:33 PM
    Author     : keshav bansal
--%>

<%@page contentType="text/html" import='javax.servlet.http.Cookie,java.sql.*' pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    
    try{
           Cookie c[]=request.getCookies();
           String email=null;
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
                    String fname=request.getParameter("fname");
                    String lname=request.getParameter("lname");
                    String gender=request.getParameter("gender");
                    String caste=request.getParameter("caste");
                    String religion=request.getParameter("religion");
                    String occupation=request.getParameter("occupation");
                    String birth=request.getParameter("birth");
                    String city=request.getParameter("city");
                    String state=request.getParameter("state");
                    String country=request.getParameter("country");
                    PreparedStatement ps = cn.prepareStatement("update details set fname=?, lname=?, gender=?, caste=?, religion=?,  occupation=?, birth=?, city=?, state=?, country=? where email=?");
                    ps.setString(1,fname);
                    ps.setString(2,lname);
                    ps.setString(3,gender);
                    ps.setString(4,caste);
                    ps.setString(5,religion);
                    ps.setString(6,occupation);
                    ps.setString(7,birth);
                    ps.setString(8,city);
                    ps.setString(9,state);
                    ps.setString(10,country);
                    ps.setString(11,email);
                    if(ps.executeUpdate()>0){
                        response.sendRedirect("profile.jsp?update=1");
                    }
                    else{
                        response.sendRedirect("profile.jsp?error=1");
                    }
               }
               catch(Exception er){
                   out.println(er.getMessage());
               }
            }
        }
        catch(Exception er){
            out.println(er.getMessage());
        }
%>
