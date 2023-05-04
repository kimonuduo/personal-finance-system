//<canvas id="chart" width="400" height="300"></canvas>
    //<canvas id="linechart"></canvas>
     // <button onclick="drawChart('单笔')">单笔</button>
     // <button onclick="drawChart('订阅')">订阅</button>
	//<script type="text/javascript">





var bills = [
        { id: 1, type: "income", amount: 5000, billtime: "2023-01-01", expendtype: "单笔" },
        { id: 2, type: "expense", amount: 2000, billtime: "2023-01-02", expendtype: "订阅" },
        { id: 3, type: "income", amount: 8000, billtime: "2023-02-01", expendtype: "单笔" },
        { id: 4, type: "expense", amount: 3000, billtime: "2023-02-03", expendtype: "单笔" },
        { id: 5, type: "expense", amount: 1500, billtime: "2023-03-05", expendtype: "单笔" },
        { id: 6, type: "income", amount: 7000, billtime: "2023-03-07", expendtype: "单笔" },
      ];

      var data = {};
      for (var i = 0; i < bills.length; i++) {
        var expendtype = bills[i].expendtype;
        var month = parseInt(bills[i].billtime.substring(5, 7)); //选取第5-6个字符
        var amount = bills[i].amount;
        
        if (!data[expendtype]) {
          data[expendtype] = {};
        }
        
        if (!data[expendtype][month]) {
          data[expendtype][month] = 0;
        }
        
        data[expendtype][month] += amount;
      }
		
      function drawChart(expendtype) {
        var values = [];
        for (var month = 1; month <= 12; month++) {
          if (data[expendtype] && data[expendtype][month]) {
            values.push(data[expendtype][month]); //添加到value中
          } else {
            values.push(0);
          }
        }

        var canvas = document.getElementById("linechart");
        var ctx = canvas.getContext("2d");

        //清空
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        
        //坐标轴
        ctx.beginPath();
  		ctx.moveTo(10, 10);
  		ctx.lineTo(10, canvas.height-10);
  		ctx.moveTo(10, canvas.height-10);
  		ctx.lineTo(canvas.width, canvas.height-10);
  		ctx.stroke();

        //画图
        var maxValue = Math.max(...values);
        var yRatio = (canvas.height-30) / maxValue; //设置y单位数值占用的像素点
        var xInterval = canvas.width / 13;
        
        //画X刻度
        for (var i = 0; i < 12; i++) {
            var x = 10 + (i + 1) * xInterval;
            ctx.beginPath();
            ctx.moveTo(x, canvas.height);
            ctx.lineTo(x, canvas.height);
            ctx.stroke();
            ctx.fillText(i + 1, x , canvas.height);
        }
        
        //画Y轴刻度
        var yInterval = maxValue/5
        for (var i = 0; i <= 5; i++) {
        	var y = i*yInterval*yRatio;
        	var ylabel = i*yInterval;
        	ctx.fillText(ylabel,10,(canvas.height)-y);

        }
        
        ctx.beginPath();
        ctx.moveTo(xInterval+13, canvas.height - values[0] * yRatio-10);
        for (var i = 1; i < values.length; i++) {
          ctx.lineTo((i+1) * xInterval+10+3, canvas.height - values[i] * yRatio-10);
        }
        ctx.stroke();
        
      }