<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome </title>
</head>
<body>
<core:set var="mail" value="${param.mail}"></core:set>
<core:set var="pwd" value="${param.passwd}"></core:set>

<sql:setDataSource var="Connection" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3310/exam" user="root" password="02022020"></sql:setDataSource>

<sql:query var="rs" dataSource="${Connection}">
SELECT * FROM bank where Email = ?
<sql:param value="${mail}"></sql:param>
</sql:query>
<core:forEach var="r" items="${rs.rows}">
<!-- <core:out value="${pwd}"></core:out><br> -->

<core:out value="${r.password}"></core:out><br>

<!-- <core:out value="${pwd.equals(r.password)}"></core:out><br> --> 

<core:if test="${pwd.equals(r.password) == true}">
      
	<h1><b> !! You have successfully login !! </b></h1>
	<a href="Home.html"><button type="submit" name="submit" >Submit</button></a>
	</core:if>
	
</core:forEach>

</body>
</html>