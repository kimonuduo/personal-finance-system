<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <td>1%</td>
            <td>2%</td>
            <td>3%</td>
            <td>4%</td>
            <td>5%</td>
        </tr>
        </tbody>
    </table>

    <table>
        <h1>Income Analysis</h1>
        <thead>
        <tr>
            <th>Salary</th>
            <th>transportation</th>
            <th>Other</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>1</td>
            <td>2</td>
            <td>3</td>
        </tr>
        </tbody>
    </table>
</div>

</body>
</html>
