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
    <form action="sub_stat_monthly" method="post">
        <label for="year-select">Year:</label>
        <select id="year-select" name="year">
            <script>
                var startYear = 2020;
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
        <button>Submit</button>
    </form>


    <table>
        <h1>${year} ${month} Expend Analysis</h1>
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
        <h1>${year} ${month} Income Analysis</h1>
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
