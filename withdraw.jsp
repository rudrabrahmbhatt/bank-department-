<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Withdraw Money</title>
</head>
<body>
 
 <%
try
{
 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3310/exam","root","02022020");
 String username = request.getParameter("name");
 String accno = request.getParameter("number");
 String depoamount = request.getParameter("wm");

 String sql1 = "select * from acc where Name = ? and account_number = ?";
 PreparedStatement ps1 = con.prepareStatement(sql1);
 ps1.setString(1, username);
 ps1.setString(2,accno);
 System.out.println("\n"+username+"\t"+accno);
 ResultSet rs = ps1.executeQuery();
 if(rs.next())
 {
  String sql = "update acc set Amount = ? where Name = ? and account_number = ?";
  PreparedStatement ps = con.prepareStatement(sql);
  String depo = (String)rs.getString("Amount");
  int depoam = Integer.parseInt(depo);
  int dep1 = Integer.parseInt(depoamount);
  dep1 = depoam - dep1;
  depo = Integer.toString(dep1);
  ps.setString(1, depo);
  ps.setString(2, username);
  ps.setString(3, accno);
  ps.executeUpdate();
  ServletContext sc = getServletContext();
  out.println("<h1><b>Money Withdrawed </b></h1>");
  con.close();
  
  
   }
 else
 {
  
  out.println("<h1><b>!!Plz Check Your Username Or Account Number Something Is Wrong !!</h1></b>");
  ServletContext sc = getServletContext();
  con.close();
  

 }
}catch(Exception e){
 System.out.println(e);
}
 
 

%>
<a href="Home.html"><button type="submit" name="submit" >Logout</button></a>
</body>
</html>