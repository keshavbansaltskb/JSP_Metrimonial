<%-- 
    Document   : upload_user_image
    Created on : Jul 5, 2023, 1:14:25 PM
    Author     : keshav bansal
--%>
%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%
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
    String usercode = request.getParameter("id");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select Max(sn) from userdata where usercode='" + usercode + "' ");
        int sn = 0;
        if (rs.next()) {
            sn = rs.getInt(1);
        }
        sn++;
        code = code + "_" + sn;
        PreparedStatement ps = cn.prepareStatement("insert into userdata values (?,?,?)");
        ps.setInt(1, sn);
        ps.setString(2, code);
        ps.setString(3, usercode);
        if (ps.executeUpdate() > 0) {
        } else {
        }
        cn.close();
    } catch (Exception er) {
        out.println(er.getMessage());
    }

    String contentType = request.getContentType();

    String imageSave = null;
    byte dataBytes[] = null;
    String saveFile = null;
    if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
        DataInputStream in = new DataInputStream(request.getInputStream());
        int formDataLength = request.getContentLength();
        dataBytes = new byte[formDataLength];
        int byteRead = 0;
        int totalBytesRead = 0;
        while (totalBytesRead < formDataLength) {
            byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
            totalBytesRead += byteRead;
        }
        /*String code="";
         try{
         ....
         ...
         ....
         ResultSet rs=st.executeQuery("select code from table_name where email='"+email+"'");
         if(rs.next()){
         code=rs.getString(1);
         }

         } 
         catch(Exception er){
    
         }*/
        String file = new String(dataBytes);
        /*saveFile = file.substring(file.indexOf("filename=\"") + 10);
         saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
         saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));*/
        saveFile = code + ".jpg";
// out.print(dataBytes);
        int lastIndex = contentType.lastIndexOf("=");
        String boundary = contentType.substring(lastIndex + 1, contentType.length());
// out.println(boundary);
        int pos;
        pos = file.indexOf("filename=\"");
        pos = file.indexOf("\n", pos) + 1;
        pos = file.indexOf("\n", pos) + 1;
        pos = file.indexOf("\n", pos) + 1;
        int boundaryLocation = file.indexOf(boundary, pos) - 4;
        int startPos = ((file.substring(0, pos)).getBytes()).length;
        int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

        try {
            File fr = new File(request.getRealPath("/") + "/upload/" + usercode);
            fr.mkdir();

            FileOutputStream fileOut = new FileOutputStream(request.getRealPath("/") + "/upload/" + usercode + "/" + saveFile);


// fileOut.write(dataBytes);
            fileOut.write(dataBytes, startPos, (endPos - startPos));
            fileOut.flush();
            fileOut.close();
            response.sendRedirect("gallary.jsp");
        } catch (Exception e) {

            imageSave = "Failure";
        }
    }
//response.sendRedirect("index.jsp");
%>