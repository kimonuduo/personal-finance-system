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
  <label for="year-select">Year:</label>
  <select id="year-select" name="year">
    <script>
      var startYear = 2000;
      var endYear = 2023;
      for (var i = startYear; i <= endYear; i++) {
        document.write('<option value="' + i + '">' + i + '</option>');
      }
    </script>
  </select>

  <div id="data-container">
    <!-- 在这里显示根据所选年份更新后的数据 -->
  </div>
  <script>
    var yearSelect = document.getElementById('year-select');
    var dataContainer = document.getElementById('data-container');

    // 绑定 change 事件处理程序
    yearSelect.addEventListener('change', function() {
      var selectedYear = yearSelect.value;
      // 根据所选年份更新数据
      dataContainer.innerHTML = '您选择的年份是：' + selectedYear;
    });
  </script>
  <table>
    <h1>Annual Expend Analysis</h1>
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
    <h1>Annual Income Analysis</h1>
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
