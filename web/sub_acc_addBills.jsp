<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
  <title>Account Book</title>
  <link href="static/index.css" rel="stylesheet" type="text/css" />
  <link href="static/table.css" rel="stylesheet" type="text/css" />
  <link href="static/content.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="header.jsp"%>
<div class="site-content">
  <h1>Edit Bills</h1>
  <form action="sub_acc_addBills" method="post">
    <div>
      <label for="btime">BillTime：</label>
      <input type="text" id="btime" name="btime" required>
      <span id="billDateError" style="color: red;"></span>
    </div>

    <div>
      <label for="category">Choice category：</label>
      <select id="category" name="category" required>
        <option value="">choice</option>
        <optgroup label="Expenses">
          <option value="catering">Catering</option>
          <option value="transportation">Transportation</option>
          <option value="shopping">Shopping</option>
          <option value="daily expense">Daily expense</option>
          <option value="other">Other</option>
        </optgroup>
        <optgroup label="Income">
          <option value="income-salary">Salary income</option>
          <option value="income-property">Property income</option>
          <option value="income-other">Other income</option>
        </optgroup>
      </select>
      <span id="categoryError" style="color: red;"></span>
    </div>

    <div>
      <label for="amount">Amount：</label> <input type="text" id="amount" name="amount" required>
      <span id="amountError" style="color: red;"></span>
    </div>

    <button>Submit</button>
  </form>

  <script>
    // 数据验证
    var form = document.querySelector('form');
    form.addEventListener('submit', function(event) {
      var billDate = document.getElementById('btime').value;
      var category = document.getElementById('category').value;
      var amount = document.getElementById('amount').value;

      var billDateError = document.getElementById('billDateError');
      var categoryError = document.getElementById('categoryError');
      var amountError = document.getElementById('amountError');

      var isValid = true;

      if (!/^\d{4}.\d{2}.\d{2}$/.test(billDate)) {
        billDateError.innerHTML = 'please input right type of date（yyyy-MM-dd）';
        isValid = false;
      } else {
        billDateError.innerHTML = '';
      }

      if (category === '') {
        categoryError.innerHTML = 'please choice the category';
        isValid = false;
      } else {
        categoryError.innerHTML = '';
      }

      if (!/^\d+(\.\d{1,2})?$/.test(amount)) {
        amountError.innerHTML = 'please input right type of money';
        isValid = false;
      } else {
        amountError.innerHTML = '';
      }

      if (!isValid) {
        event.preventDefault();
      }
    });
  </script>

</div>
</body>
</html>
