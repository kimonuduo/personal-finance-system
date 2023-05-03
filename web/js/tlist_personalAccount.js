//假设输入数据为data{deposit:"50000.00",monthlySubsricbe:"500.00",Salary:"2500",others:"100000.00"}<th>存款</th>
            //<th>monthly订阅</th>
            //<th>Salary</th>
            //<th>其他</th>

var tbody = document.querySelector("table tbody");//选择jsp中的table 和 tbody

for (var i = 0; i < data.length; i++) {
	var row = document.createElement("tr");
	
	var td1 = document.createElement("td");
	td1.innerText = data[i].deposit;//填充数据  billNo以及下面的billTime等是暂定的，需要user输入以及servlet传输回的数组进行更改
	//billNo可能需要改为"00"+i+1
	var td2 = document.createElement("td");
	td2.innerText = data[i].monthlySubsricbe;
	var td3 = document.createElement("td");
	td3.innerText = data[i].Salary;
	var td4 = document.createElement("td");
	td4.innerText = data[i].others;
	
	row.appendChild(td1);//将上面td加入 tr中
    row.appendChild(td2);
    row.appendChild(td3);
    row.appendChild(td4);
    
    tbody.appendChild(row);//将上列表格row添加进tbody中
    }