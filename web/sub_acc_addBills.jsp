<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
  <title>Account Book</title>
  <link href="static/index.css" rel="stylesheet" type="text/css" />
  <link href="static/table.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="header.jsp"%>
<div class="site-content">
  <h1>Edit Bills</h1>
  <form action="sub_acc_addBills" method="post">
    <div>
      <label for="btime">账单时间：</label>
      <input type="text" id="btime" name="btime" required>
      <span id="billDateError" style="color: red;"></span>
    </div>

    <div>
      <label for="category">消费种类：</label>
      <select id="category" name="btype" required>
        <option value="">请选择</option>
        <option value="餐饮">餐饮</option>
        <option value="交通">交通</option>
        <option value="购物">购物</option>
        <option value="娱乐">娱乐</option>
      </select> <span id="categoryError" style="color: red;"></span>
    </div>

    <div>
      <label for="amount">消费金额：</label> <input type="text" id="amount" name="bprice" required>
      <span id="amountError" style="color: red;"></span>
    </div>

    <button>提交</button>
  </form>

  <script>
    // 数据验证
    var form = document.querySelector('form');
    form.addEventListener('submit', function(event) {
      var billDate = document.getElementById('billDate').value;
      var category = document.getElementById('category').value;
      var amount = document.getElementById('amount').value;

      var billDateError = document.getElementById('billDateError');
      var categoryError = document.getElementById('categoryError');
      var amountError = document.getElementById('amountError');

      var isValid = true;

      if (!/^\d{4}-\d{2}-\d{2}$/.test(billDate)) {
        billDateError.innerHTML = '请输入正确的日期格式（yyyy-MM-dd）';
        isValid = false;
      } else {
        billDateError.innerHTML = '';
      }

      if (category === '') {
        categoryError.innerHTML = '请选择消费种类';
        isValid = false;
      } else {
        categoryError.innerHTML = '';
      }

      if (!/^\d+(\.\d{1,2})?$/.test(amount)) {
        amountError.innerHTML = '请输入正确的金额格式';
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
