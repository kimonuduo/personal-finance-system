<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Income & Expend  Stat</title>
    <link href="static/index.css" rel = "stylesheet" type = "text/css"/>
    <link href="static/table.css" rel = "stylesheet" type = "text/css"/>
</head>
<body>
<%@include file="header.jsp" %>
<div class="site-content">
    <h1>Personal Account</h1>
    <table>
        <thead>
        <tr>
            <th>Total Income</th>
            <th>Total Expend</th>
        </tr>
        </thead>
        <tbody>
 		<tr>
 			<td>${dataList[0]}</td>
 			<td>${dataList[1]}</td>
 		</tr>
        </tbody>
    </table>
</div>

</body>
</html>
