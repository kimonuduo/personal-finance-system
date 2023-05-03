//<select id="selectYearMonth">
  //<option value="You'd better to make a choice">You'd better to make a choice</option>
  //<option value="2023-01">2023年1月</option>
 // <option value="2023-02">2023年2月</option>
 // <option value="2023-03">2023年3月</option>
//</select>
 
 
var billList = document.getElementById("billList");
var selectMonth = document.getElementById("selectYearMonth");
var bills = [
  { id: 1, type: "income", amount: 5000, billtime: "2023-01-01", expendtype: "单笔" },
  { id: 2, type: "expense", amount: 2000, billtime: "2023-01-02", expendtype: "订阅" },
  { id: 3, type: "income", amount: 8000, billtime: "2023-02-01", expendtype: "单笔" },
  { id: 4, type: "expense", amount: 3000, billtime: "2023-02-03", expendtype: "单笔" },
  { id: 5, type: "expense", amount: 1500, billtime: "2023-03-05", expendtype: "单笔" },
  { id: 6, type: "income", amount: 7000, billtime: "2023-03-07", expendtype: "单笔" },
];

//根据月份筛选账单，从bills中帅选出
	function filterBills(year,month) {
	  var filteredBills = bills.filter(function (bill) {
		  var billDate = new Date(bill.billtime);
		  return billDate.getFullYear() == year && billDate.getMonth() + 1 == month;  //提取bill_time属性 如果提取年份的话替换getMonth()为getFullYear()
	  });
	  return filteredBills;
	}

//列表元素
	function renderBillList(bills) {
	  billList.innerHTML = "";//清空之前的东西
	  bills.forEach(function (bill) {
	    var li = document.createElement("li"); //创建新元素 下面算是格式
	    li.innerHTML = `
	      <div>${bill.billtime}</div>
	      <div>${bill.expendtype}</div>
	      <div>${bill.type === "income" ? "+" : "-"}${bill.amount}</div>
	    `;
	    billList.appendChild(li); 
	  });
	}

//初始化显示所有账单，账单更新
	renderBillList(bills);//将所有的bill渲染到页面上

//change事件，添加监听器
	selectMonth.addEventListener("change", function () {
		var yearMonth = selectYearMonth.value.split("-");
		var year = parseInt(yearMonth[0]);
		var month = parseInt(yearMonth[1]);
		var filteredBills = filterBills(year, month);
		renderBillList(filteredBills);
	  //var month = parseInt(this.value);//将this中的值转化为int
	  //var filteredBills = filterBills(month);//基于上面选择的month过滤
	  //renderBillList(filteredBills);//将所有被选择的渲染到页面上
	});


  // 生成列表元素
  //test.forEach((bill) => {
    //var li = document.createElement("li");
    //li.innerHTML = `
      //<div>${bill.bill_time}</div>
      //<div>${bill.expend_type}</div>
      //<div>${bill.type === "income" ? "+" : "-"}${bill.amount}</div>
    //`;
    //billList.appendChild(li);
  //});