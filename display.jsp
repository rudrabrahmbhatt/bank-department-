<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Details</title>
</head>
<body>
<core:set var="name" value="${param.name}"></core:set>
<core:set var="pn" value="${param.pn}"></core:set>

<sql:setDataSource var="Connection" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3310/exam" user="root" password="02022020"></sql:setDataSource>
<sql:query var="rs" dataSource="${Connection}">
SELECT * FROM acc where Name = ? and pancard=?
<sql:param value="${name}"></sql:param>
<sql:param value="${pn}"></sql:param>
</sql:query>

<table border="1">
<tr>
<th><core:out value="Name"></core:out></th>
<th><core:out value="pancard"></core:out></th>
<th><core:out value="account_number"></core:out></th>
<th><core:out value="IFSC_code"></core:out></th>
<th><core:out value="Bank_name"></core:out></th>
<th><core:out value="Amount"></core:out></th>
</tr>
<core:forEach var="r" items="${rs.rows}">
<tr>

<td><core:out value="${r.Name}"></core:out></td>
<td><core:out value="${r.pancard}"></core:out></td>
<td><core:out value="${r.account_number}"></core:out></td>
<td><core:out value="${r.IFSC_code}"></core:out></td>
<td><core:out value="${r.Bank_name}"></core:out></td>
<td><core:out value="${r.Amount}"></core:out></td>
</tr>
</core:forEach>
</table>
	<ol>
	
		<li><a href="Home.html">Home Page</a></li>
	</ol>
</body>
</html>