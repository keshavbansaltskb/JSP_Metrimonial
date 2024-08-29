<%-- 
    Document   : email_check
    Created on : Aug 1, 2023, 11:54:37 PM
    Author     : keshav bansal
--%>
<%@page contentType="text/html" import="java.sql.*, javax.servlet.http.Cookie" pageEncoding="UTF-8"%>
<%
    String emailcheck = request.getParameter("id");
    emailcheck = emailcheck + "@gmail.com";
    Class.forName("com.mysql.jdbc.Driver");
    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
    Statement st = cn.createStatement();
    ResultSet rs = st.executeQuery("select * from details where email='" + emailcheck + "'");
    if (rs.next()) {
        out.print("success");
    }
    else{
        out.print("error");
    }


%>