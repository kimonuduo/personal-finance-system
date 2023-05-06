<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Account Book</title>
    <link href="static/index.css" rel = "stylesheet" type = "text/css"/>
    <link href="static/table.css" rel = "stylesheet" type = "text/css"/>
</head>
<body>
<%@include file="header.jsp" %>
<div class="site-content">
    <h1>Edit Bills</h1>
    <div>
        <form action="editbills" method="post">
            账单时间: <input type="text" name="btime"> <br>
            消费种类: <input type="text" name="btype"> <br>
            消费金额: <input type="text" name="bprice"> <br>
            <button>提交</button>
            <span style="color:red;font-size:12px">${msg}</span>
        </form>
    </div>
</div>
</body>
</html>
