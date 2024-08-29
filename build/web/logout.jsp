<%-- 
    Document   : logout
    Created on : Feb 24, 2023, 3:06:42 PM
    Author     : keshav bansal
--%>
<%
    Cookie c = new Cookie("login",null);
    c.setMaxAge(0);
    response.addCookie(c);
    response.sendRedirect("index.jsp");
    %>