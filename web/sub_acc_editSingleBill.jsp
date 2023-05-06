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
  <h1>Edit Single Bill</h1>
  <form action="editSingleBill" method="post">
    <div>
      <label for="btime">BillTime：</label>
      <input type="text" id="btime" name="btime" value= "${param.bill_time}" required>
      <span id="billDateError" style="color: red;"></span>
    </div>

    <div>
      <label for="category">Choice category：</label>
      <select id="category" name="category" required>
        <option value="">choice</option>
        <optgroup label="Expenses">
          <option value="catering" ${param.category == 'catering' ? 'selected' : ''}>catering</option>
          <option value="transportation" ${param.category == 'transportation' ? 'selected' : ''}>transportation</option>
          <option value="shopping" ${param.category == 'shopping' ? 'selected' : ''}>shopping</option>
          <option value="daily expense" ${param.category == 'daily expense' ? 'selected' : ''}>daily expense</option>
          <option value="other" ${param.category == 'other' ? 'selected' : ''}>other</option>
        </optgroup>
        <optgroup label="Income">
          <option value="income-salary" ${param.category == 'salary income' ? 'selected' : ''}>salary income</option>
          <option value="income-property" ${param.category == 'property income' ? 'selected' : ''}>property income</option>
          <option value="income-other" ${param.category == 'other income' ? 'selected' : ''}>other income</option>
        </optgroup>
      </select>
      <span id="categoryError" style="color: red;"></span>
    </div>
	<input type="hidden" id="selectedLabel" name="selectedLabel" value="">
	<input type="hidden" id="id" name="id" value="${param.id}">
    <div>
      <label for="amount">Amount：</label> <input type="text" id="amount" name="amount"  value= "${param.amount}" required>
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
  <script>
  document.getElementById('category').addEventListener('change', function() {
    var select = this;
    var option = select.options[select.selectedIndex];
    var optgroup = option.parentNode;
    document.getElementById('selectedLabel').value = optgroup.label;
  });
</script>

</div>
</body>
</html>
