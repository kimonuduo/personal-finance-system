//<canvas id="bar-chart" width="500" height="400"></canvas>
var data = [{name: '食品', value: 50},{name: '生活用品', value: 25},{name: '衣服', value: 25}];//测试数据
		var color = ["red", "yellow", "green", "blue", "pink"];

		var canvas = document.getElementById("bar-chart");
		var ctx = canvas.getContext("2d");

		var width = canvas.width; //获取宽度
		var height = canvas.height; //获取长度

		var barWidth = width / data.length; //设定柱子宽度

		var values = data.map(item => item.value); //提取value
		var maxValue = Math.max(...values); //最大值
		var minValue = Math.min(...values); //最小值

		ctx.beginPath(); //起
		ctx.moveTo(0, height); //移动
		ctx.lineTo(0, 0);// 记录路径
		ctx.lineTo(width, 0);
		ctx.lineTo(width, height);
		ctx.lineTo(0, height);
		ctx.stroke();//描边

		for (let i = 0; i < data.length; i++) {
			var barHeight = (values[i] - minValue) / (maxValue - minValue) * (height - 20)||values[i]/maxValue* (height - 20); //可能需要根据实际情况更改
			//if(barHeight=0){
				//barHeight =  values[i]/maxValue* (height - 20)
			//}
			var x = i * barWidth +20;
			var y = height - barHeight-10;
			
			var barColor = color[i];
			ctx.fillStyle = barColor;
			ctx.fillRect(x, y, barWidth - 20, barHeight); //填充矩形
			ctx.fillStyle = "black";
			ctx.font = "12px Arial";
			ctx.textAlign = "center";
			ctx.fillText(data[i].name, x + (barWidth / 2) - 10, height - 5); //加文字
		}
		ctx.fillStyle = "black";
		ctx.font = "12px Arial";
		ctx.textAlign = "right";
		ctx.textBaseline = "middle";
		
		//Y轴刻度线
		for (let i = 0; i <= 5; i++) {
		  const value = (maxValue / 5) * i; //先来5个
		  const y = height - (value / maxValue) * (height - 20)-10;
		  ctx.fillText(value, 30, y);
		  ctx.beginPath();
		  ctx.moveTo(35, y);
		  ctx.lineTo(width, y);
		  ctx.strokeStyle = "#ccc";
		  ctx.stroke();
		}