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

    <label for="month-select">Month:</label>
    <select id="month-select" name="month">
        <script>
            var startMonth = 1;
            var endMonth = 12;
            for (var i = startMonth; i <= endMonth; i++) {
                document.write('<option value="' + i + '">' + i + '</option>');
            }
        </script>
    </select>

    <div id="data-container">
        <!-- 在这里显示根据所选年份更新后的数据 -->
    </div>
    <script>
        var yearSelect = document.getElementById('year-select');
        var monthSelect = document.getElementById('month-select');
        var dataContainer = document.getElementById('data-container');

        // 监听年份和月份选择器的值变化
        yearSelect.addEventListener('change', updateData);
        monthSelect.addEventListener('change', updateData);

        function updateData() {
            // 获取所选的年份和月份
            var selectedYear = yearSelect.value;
            var selectedMonth = monthSelect.value;

            // 更新数据容器中的内容
            dataContainer.innerHTML = '您选择了 ' + selectedYear + ' 年 ' + selectedMonth + ' 月的数据。';
        }

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
