<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Income & Expend  Stat</title>
    <link href="static/index.css" rel = "stylesheet" type = "text/css"/>
    <link href="static/table.css" rel = "stylesheet" type = "text/css"/>
</head>
<body>
<%@include file="header.jsp" %>
<div class="site-content">
    <h1>Intelligent Prediction</h1>
    <table>
        <thead>
        <tr> 
            <th>Total Income</th>
            <th>Total Expend</th>
            <th>Account Balance</th>
            <th>Financial Evaluation</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${dataList[0]}</td>
            <td>${dataList[1]}</td>
            <td><fmt:formatNumber value="${dataList[0] - dataList[1]}" minFractionDigits="2" groupingUsed="false" /></td>
            <td><p id="financialRating"></p></td>
        </tr>
        </tbody>
    </table>
    <script type="text/javascript">
    function showFinancialRating() {
    var ratio = '${dataList[1]}' / '${dataList[0]}'; //这里插入数据
 	var ratingText;
  	if (ratio < 0.5) {
    	ratingText = "Good financial position, can spend freely";
  	} else if (ratio < 0.7) {
    	ratingText = "Good financial position";
  	} else if (ratio < 0.9) {
    	ratingText = "Poor financial position, please notice the balance";
  	} else {
    	ratingText = "Poor financial position, please refrain from spending";
  	}
  	document.getElementById("financialRating").innerText = "Ratio is: " + parseFloat(ratio).toFixed(3) +"\n" + ratingText;
  	}
  	window.onload = showFinancialRating;
</script>
</div>


</body>
</html>