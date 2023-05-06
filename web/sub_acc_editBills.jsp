<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <table>
        <thead>
        <tr>
            <th>Bill ID</th>
            <th>Bill time</th>
            <th>Bill type</th>
            <th>Price</th>
            <th>Income/Expend</th>
            <th>Edit</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${transactionsList}" var="transaction" >
            <tr>
                <td>${transaction.id}</td>
                <td>${transaction.bill_time}</td>
                <td>${transaction.category}</td>
                <td>${transaction.amount}</td>
                <td>${(transaction.bill_type == "0") ? "income" : (transaction.bill_type == "1") ? "expend" : ""}</td>
                <td>
                    <a href="deleteBill?id=${transaction.id}"><button type="button">delete</button></a>
                    <a href="sub_acc_editSingleBill.jsp?id=${transaction.id}&bill_time=${transaction.bill_time}&category=${transaction.category}&amount=${transaction.amount}&bill_type=${transaction.bill_type}"><button type="button">edit</button></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>



<script type="text/javascript">
    var value =<%=request.getAttribute("transactionsList") %>;
</script>
<script type="text/javascript" src="js/tlist_accountBook&stat.js"></script>
</body>
</html>
