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
        <thead>
        <tr>
            <th>账单号</th>
            <th>账单时间</th>
            <th>消费种类</th>
            <th>消费金额</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>001</td>
            <td>2023-04-01</td>
            <td>餐饮</td>
            <td>50.00</td>
        </tr>
        <tr>
            <td>002</td>
            <td>2023-04-10</td>
            <td>交通</td>
            <td>20.00</td>
        </tr>
        <tr>
            <td>003</td>
            <td>2023-04-20</td>
            <td>购物</td>
            <td>100.00</td>
        </tr>
        </tbody>
    </table>
</div>

</body>
</html>
