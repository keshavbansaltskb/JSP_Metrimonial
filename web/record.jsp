<%-- 
    Document   : signup
    Created on : Feb 19, 2023, 3:13:20 PM
    Author     : keshav bansal
--%>

<%@page contentType="text/html" import='java.sql.*,java.util.*' pageEncoding="UTF-8"%>

<% 
    
    LinkedList ls = new LinkedList();
    for(int i=0 ; i<=9 ; i++){
            ls.add(i+"");
    }
    for(char i='A' ; i<='Z' ; i++){
            ls.add(i+"");
    }
    for(char i='a' ; i<='z' ; i++){
            ls.add(i+"");
    }
    Collections.shuffle(ls);
    String code="";
    for(int i=0 ; i<6 ; i++){
            code = code+ls.get(i);
    }
        String fname= request.getParameter("fname");
        String lname= request.getParameter("lname");
        String email= request.getParameter("email");
        String pass= request.getParameter("pass");
        String gender= request.getParameter("gender");
        String caste= request.getParameter("caste");
        String religion= request.getParameter("religion");
        String occupation= request.getParameter("occupation");
        String birth= request.getParameter("birth");
        String city= request.getParameter("city");
        String state=request.getParameter("state");
        String country= request.getParameter("country");
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
            Statement st = cn.createStatement();
            int sn=0;
            ResultSet rs = st.executeQuery("select MAX(sn) from details");
            if(rs.next()){
                sn = rs.getInt(1);
            }
            sn++;
            code=code+"_"+sn;
            PreparedStatement ps = cn.prepareStatement("insert into details values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setInt(1,sn);  
            ps.setString(2,code);
            ps.setString(3,fname);
            ps.setString(4,lname);
            ps.setString(5,email);
            ps.setString(6,pass);
            ps.setString(7,gender);
            ps.setString(8,caste);
            ps.setString(9,religion);
            ps.setString(10,occupation);
            ps.setString(11,birth);
            ps.setString(12,city);
            ps.setString(13,state);
            ps.setString(14,country);
            PreparedStatement ps1 = cn.prepareStatement("insert into userdetails values(?,?,?,?,?,?,?,?,?)");
            ps1.setString(1,"Not Specified");  
            ps1.setString(2,"Not Specified");
            ps1.setString(3,"Not Specified");
            ps1.setString(4,"Not Specified");
            ps1.setInt(5,0);
            ps1.setInt(6,0);
            ps1.setString(7,"Not Specified");
            ps1.setString(8,"Not Specified");
            ps1.setString(9,email);
            if(ps.executeUpdate()>0 && ps1.executeUpdate()>0  ){
                response.sendRedirect("image_upload.jsp?id="+code+"&email="+email+"&pass="+pass); 
            }
            else{
                response.sendRedirect("index.jsp?error=1"); 
            }
        }
        catch(Exception er){
            out.println(er.getMessage());
        }
%>