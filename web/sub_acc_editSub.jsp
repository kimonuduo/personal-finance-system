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
  <h1>Edit Subscribe</h1>
  <div>
    <form action="editsub" method="post">
      订阅时间: <input type="text" name="stime"> <br>
      订阅种类: <input type="text" name="stype"> <br>
      订阅金额: <input type="text" name="sprice"> <br>
      <button>提交</button>
      <span style="color:red;font-size:12px">${msg}</span>
    </form>
  </div>
</div>
</body>
</html>
