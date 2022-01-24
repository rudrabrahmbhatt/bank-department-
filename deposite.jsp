<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Deposit Money</title>
</head>
<body>
<%
try{
 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3310/exam","root","02022020");
 String AccountHolder = request.getParameter("name");
 String accno = request.getParameter("acc");
 String depoamount = request.getParameter("dm");

 String sql1 = "select * from acc where Name= ? or account_number = ?";
 PreparedStatement ps1 = con.prepareStatement(sql1);
 ps1.setString(1, AccountHolder);
 ps1.setString(2,accno);
 
 System.out.println("\n"+AccountHolder+"\t"+accno);
 
 ResultSet rs = ps1.executeQuery();
 if(rs.next())
 {
  String sql = "update acc set Amount = ? where Name = ? and account_number = ?";
  PreparedStatement ps = con.prepareStatement(sql);
  String depo = (String)rs.getString("Amount");
  int depoam = Integer.parseInt(depo);
  int dep1 = Integer.parseInt(depoamount);
  dep1 = dep1 + depoam;
  depo = Integer.toString(dep1);
  ps.setString(1, depo);

  ps.setString(2, AccountHolder);
  ps.setString(3, accno);
  ps.executeUpdate();
  ServletContext sc = getServletContext();
  out.println("<h1><b>Money Deposited</b></h1>"); 
  con.close();
  sc.getRequestDispatcher("Home.html").forward(request,response);

 }
 else
 {
  
  out.println("<h1><b>Username or account is not valid try again</b></h1>");
  ServletContext sc = getServletContext();
  con.close();
  sc.getRequestDispatcher("Home.html").forward(request,response);

 }
}catch(Exception e){
 System.out.println(e);
}
%>

<a href="Home.html"><button type="submit" name="submit"> Logout </button></a>
</body>
</html>