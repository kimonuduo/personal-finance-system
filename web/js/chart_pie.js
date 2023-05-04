
//<canvas id = "pie" width = "400" height = "400"></canvas>
var canvas = document.getElementById("pie");
	var ctx = canvas.getContext("2d");
	
	var test = [100,200,300,400,500];//测试数据
	var color = ["red","yellow","green","blue","pink"];//颜色
	
	var sum = 0; //设定数据总和
	var dataforangle = 0; 
	
	for (var i=0; i<test.length; i++){
		sum += test[i]; 
	} 	//加总
	for (var i=0; i<test.length; i++){
		var ratio = test[i]/sum; //单个数据的比例
		var angle = dataforangle +ratio * Math.PI *2; //按比例赋予角度
		ctx.fillStyle = color[i];//填充第i个数据的颜色
		ctx.beginPath();//开始点
		ctx.moveTo(150,150);//结束点
		ctx.arc(150,150,100,dataforangle,angle);//位置和起点终点
		ctx.closePath();//结束画图
		ctx.fill();//填充
                
        dataforangle = angle; //替换data的angle
        
        
        ctx.font = "10px Arial";//图注字体
        ctx.fillStyle = "black";//图注颜色(需要改)
        ctx.textAlign = "right";//设定位置
        ctx.fillText((ratio*100).toFixed(2) + '%', canvas.width - 120, i * 20 + 20);//加文字
        //ctx.fillText(item.name + ' ' + ratio.toFixed(2)*100 + '%', canvas.width - 120, i * 20 + 20);//需要name
        
 }