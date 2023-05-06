<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="topbar">
  <h1>PFS</h1>
  <div class="topbar-right">
    <div class="username" onclick="location.href='#';">UserID</div>
    <div class="logout-btn">log out</div>
  </div>
</div>
<div class="header-separator"></div>
<div class="top">
  <ul>
    <li><a href="sub_personalAccount.jsp">👤Individual Account</a></li>
    <li>
      <a href="${pageContext.request.contextPath}/sub_accountBook">📒 Account Book</a>
      <ul>
        <li><a href="sub_acc_editBills.jsp">Edit Bills</a></li>
        <li><a href="sub_acc_addBills.jsp">Add Bills</a></li>
      </ul>
    </li>
    <li><a href="sub_stat.jsp">📈Income & Expend  Stat</a>
      <ul>
        <li><a href="sub_stat_annual.jsp">Annual</a></li>
        <li><a href="sub_stat_monthly.jsp">Monthly</a></li>
      </ul>
    </li>
    <li><a href="sub_intelliPredic.jsp">🧠Intelligent Prediction</a></li>
  </ul>
</div>