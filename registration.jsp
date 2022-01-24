<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib  prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib  prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<core:set var="un" value="${param.un}"></core:set>
<core:set var="passwd" value="${param.passwd}"></core:set>
<core:set var="Que" value="${param.Que}"></core:set>
<core:set var="add" value="${param.add}"></core:set>
<core:set var="mail" value="${param.mail}"></core:set>
<core:set var="pn" value="${param.pn}"></core:set>


<sql:setDataSource var="Connection" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3310/exam" user="root" password="02022020"></sql:setDataSource>

<sql:update var="insertData" dataSource="${Connection}">
Insert Into bank values(?,?,?,?,?,?)
<sql:param value="${un}" ></sql:param>
<sql:param value="${passwd}" ></sql:param>
<sql:param value="${Que}" ></sql:param>
<sql:param value="${add}" ></sql:param>
<sql:param value="${mail}" ></sql:param>
<sql:param value="${pn}" ></sql:param>

</sql:update>
<core:if test="${insertData==1}">

<h1><b> Successfully Registered !!</b></h1>
  <table border="5">

<core:forEach items="insertData.rows">
<tr><td> UserName : </td><td> <core:out value="${un}" ></core:out>  </td></tr>
<tr><td> Address :  </td><td> <core:out value="${add}" ></core:out>  </td></tr>
<tr><td> Email-Id : </td><td> <core:out value="${mail}" ></core:out>  </td></tr>
<tr><td> Phone-number : </td><td>  <core:out value="${pn}" ></core:out>  </td></tr>
</core:forEach>
<tr>
<td colspan="2"><a href="Home.html" ><button type="logout">logout</button></a></td>
</tr>
 
</table>  
</core:if>


</body>
</html>