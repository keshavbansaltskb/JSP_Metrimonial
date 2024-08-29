<%-- 
    Document   : userdetails
    Created on : Aug 2, 2023, 12:41:31 AM
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
                    String Education=request.getParameter("Education");
                    String income=request.getParameter("income");
                    String father=request.getParameter("father");
                    String mother=request.getParameter("mother");
                    int brother=Integer.parseInt(request.getParameter("brother"));
                    int sister=Integer.parseInt(request.getParameter("sister"));
                    String height=request.getParameter("height");
                    String weight=request.getParameter("weight");
                    PreparedStatement ps = cn.prepareStatement("update userdetails set Education=? , income=? , father=? , mother=? , brother=? , sister=? , height=? ,  weight=? where email=?");
                    ps.setString(1,Education);
                    ps.setString(2,income);
                    ps.setString(3,father);
                    ps.setString(4,mother);
                    ps.setInt(5,brother);
                    ps.setInt(6,sister);
                    ps.setString(7,height);
                    ps.setString(8,weight);
                    ps.setString(9,email);
                    if(ps.executeUpdate()>0){
                        response.sendRedirect("profile.jsp?detailsupdate=1");
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
