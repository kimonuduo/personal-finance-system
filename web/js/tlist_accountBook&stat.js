//假设jsp接受的data是{"billNo": "004", "billTime": "2023-04-25", "category": "餐饮", "amount": "30.00"

var tbody = document.querySelector("table tbody");//选择jsp中的table 和 tbody

for (var i = 0; i < data.length; i++) {
	var row = document.createElement("tr");
	
	var td1 = document.createElement("td");
	td1.innerText = data[i].billNo;//填充数据  billNo以及下面的billTime等是暂定的，需要user输入以及servlet传输回的数组进行更改
	//billNo可能需要改为"00"+i+1
	var td2 = document.createElement("td");
	td2.innerText = data[i].billTime;
	var td3 = document.createElement("td");
	td3.innerText = data[i].category;
	var td4 = document.createElement("td");
	td4.innerText = data[i].amount;
	
	row.appendChild(td1);//将上面td加入 tr中
    row.appendChild(td2);
    row.appendChild(td3);
    row.appendChild(td4);
    
    tbody.appendChild(row);//将上列表格添加进tbody中
	
}