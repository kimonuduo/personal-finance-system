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
    <h1>Income & Expend Statistic</h1>
    <table>
        <h1>Expend Analysis</h1>
        <thead>
        <tr>
            <th>Catering</th>
            <th>Transportation</th>
            <th>Shopping</th>
            <th>Daily Expense</th>
            <th>Other</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${String.format("%.2f", expendList[0])}%</td>
            <td>${String.format("%.2f", expendList[1])}%</td>
            <td>${String.format("%.2f", expendList[2])}%</td>
            <td>${String.format("%.2f", expendList[3])}%</td>
            <td>${String.format("%.2f", expendList[4])}%</td>
        </tr>
        </tbody>
    </table>

    <table>
        <h1>Income Analysis</h1>
        <thead>
        <tr>
            <th>Salary</th>
            <th>Property</th>
            <th>Other</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${String.format("%.2f",incomeList[0])}%</td>
            <td>${String.format("%.2f",incomeList[1])}%</td>
            <td>${String.format("%.2f",incomeList[2])}%</td>
        </tr>
        </tbody>
    </table>
</div>

</body>
</html>
