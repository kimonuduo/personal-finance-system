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
		<form action="sub_acc_addBill" method="post">
			<div>
				<label for="btime">Bill Time：</label> <input type="date" id="btime"
					name="btime"> <span id="billDateError" style="color: red;"></span>
			</div>

			<div>
				<label for="category">Choice Category：</label> <select id="category"
					name="category" required>
					<option value="">choice</option>
					<optgroup label="Expenses">
						<option value="catering">catering</option>
						<option value="transportation">transportation</option>
						<option value="shopping">shopping</option>
						<option value="daily expense">daily expense</option>
						<option value="other">other</option>
					</optgroup>
					<optgroup label="Income">
						<option value="income-salary">salary income</option>
						<option value="income-property">property income</option>
						<option value="income-other">other income</option>
					</optgroup>
				</select> <span id="categoryError" style="color: red;"></span>
			</div>
			<input type="hidden" id="selectedLabel" name="selectedLabel" value="">
			<div>
				<label for="amount">Amount：</label> <input type="text" id="amount"
					name="amount" required> <span id="amountError"
					style="color: red;"></span>
			</div>

			<button>Submit</button>
		</form>

		<script>
			// 数据验证
			var form = document.querySelector('form');
			form.addEventListener('submit', function(event) {

				var category = document.getElementById('category').value;
				var amount = document.getElementById('amount').value;

				var categoryError = document.getElementById('categoryError');
				var amountError = document.getElementById('amountError');

				var isValid = true;

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

			document
					.getElementById('category')
					.addEventListener(
							'change',
							function() {
								var select = this;
								var option = select.options[select.selectedIndex];
								var optgroup = option.parentNode;
								document.getElementById('selectedLabel').value = optgroup.label;
							});
		</script>

	</div>
</body>
</html>
