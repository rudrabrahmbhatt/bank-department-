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

<core:set var="fn" value="${param.fn}"></core:set>
<core:set var="pn" value="${param.pn}"></core:set>
<core:set var="acc" value="${param.acc}"></core:set>
<core:set var="country" value="${param.country}"></core:set>
<core:set var="contact" value="${param.contact}"></core:set>


<sql:setDataSource var="Connection" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3310/exam" user="root" password="02022020"></sql:setDataSource>


<sql:update var="insertData" dataSource="${Connection}">
Insert Into acc1 values(?,?,?,?,?,?,?)
<sql:param value="${fn}" ></sql:param>
<sql:param value="${pn}" ></sql:param>
<sql:param value="${acc}" ></sql:param>
<sql:param value="${country}" ></sql:param>
<sql:param value="${contact}" ></sql:param>
<sql:param value="${0}" ></sql:param>
<sql:param value="${0}" ></sql:param>
</sql:update>
<core:if test="${insertData==1}">

<h1><b> Successfully Registered !!</b></h1>
  <table border="5">
<core:forEach items="insertData.rows"  >
<tr><td> Name : </td><td> <core:out value="${fn}" ></core:out>  </td></tr>
<tr><td> Account number : </td><td> <core:out value="${123}" ></core:out>  </td></tr>
<tr><td> Account type : </td><td> <core:out value="${acc}" ></core:out>  </td></tr>



    
</core:forEach>
<tr>
<td colspan="2"><a href="Home.html" ><button type="logout">logout</button></a></td>
</tr>
 
</table>  
</core:if>


</body>
</html>