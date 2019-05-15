<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<title>用户表</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/paging.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/paging.js"></script>
<script type="text/javascript">
$(function(){
	var page = "${page}";
	if(page != ""){//不等于空满足条件
		$("#pageNum").val("${page.pageNum}");
		$("#pageSize").val("${page.pageSize}");
		$("#order").val("${page.t.order }");
		$("#userName").val("${page.t.user.name }");
		$("#startBirthday").val("${page.t.startBirthday }");
		$("#endBirthday").val("${page.t.endBirthday }");
		$("#userAddr").val("${page.t.user.addr }");
		tableData();
	}
	
	tableData();//调用方法查询数据 
	$("#searchs").click(function(){//当点击搜索按钮就进行搜索
		$("#pageNum").val(1);//默认第一页
		tableData();//查询出搜索的数据
	});
	
	//id顺序或id倒叙
	$("#asc,#desc").click(function(){
		var id = $(this).attr("id");
		/* var pageSize = $("#pageSize").val();
		var search = $("#search").val(); */
		if(id == "asc"){
			var order = $("#order").val();
			if(order != "0"){
				$("#order").val(0);//0为顺序
				tableData();
			}
		}else{
			var order = $("#order").val();
			if(order != "1"){
				$("#order").val(1);//1为倒序
				tableData();
			}
		}
	});
	
});

//跳转修改页面
function update(data){
	$("#form").attr("action","${pageContext.request.contextPath }/user/user/"+data).submit();//修改action的值并提交form表单
}

//删除用户
function deletes(data){
	var id = $(data).parent("td").siblings("td:first").text();
	$.ajax({//用ajax静态访问servlet
		type : "POST",
		url : "${pageContext.request.contextPath }/user/user/"+id,
		async : false,//设置为同步请求
		data : {
			"_method":"DELETE"
		},
		success : function(data) {//成功则调用函数tableData添加数据到页面
			if($("#pageNum").val() == $("#pageCount").text() && Math.ceil(($("#totalCount").text()-1)/$("#pageSize").val()) != $("#pageNum").val()){//	向上取整（如果总记录数-1除以当前条数）   != 需要跳转的页面
				$("#pageNum").val($("#pageNum").val()-1);
			}
			tableData();
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			 alert("错误: "+XMLHttpRequest.status);
		}
	}); 
}

function tableData(){
	$("#tables,#paging").empty();//清空表的值和页码数
	var form = $('form').serializeArray();//获取表单所有值的json格式
	$.ajax({//用ajax静态访问servlet
		type : "GET",
		url : "${pageContext.request.contextPath }/user/users",
		dataType:"json",
		async : false,//设置为同步请求
		data : form,
		success : function(data) {//成功则调用函数tableData添加数据到页面
			if(data.dataList != "" ){
				if($("#wu").text() == "无数据"){//如果无数据则满足条件(也就是只报一次无数据)
					$("#wu").remove();
				} 
				for ( var i in data.dataList) {//循环出数据的数据添加到table表中
					if(data.dataList[i].user.sex == 0){
						data.dataList[i].user.sex = "女";
					}else{
						data.dataList[i].user.sex = "男";
					}
					if(data.dataList[i].user.state == 0){
						data.dataList[i].user.state = "停用";
					}else{
						data.dataList[i].user.state = "启用";
					}
					$("#tables").append("<tr>"
							+"<td>"+data.dataList[i].user.id+"</td>"
							+"<td>"+data.dataList[i].user.name+"</td>"
							+"<td>"+data.dataList[i].user.sex+"</td>"
							+"<td>"+data.dataList[i].user.addr+"</td>"
							+"<td>"+data.dataList[i].user.birthday+"</td>"
							+"<td>"+data.dataList[i].user.email+"</td>"
							+"<td>"+data.dataList[i].user.state+"</td>"
							+"<td>"
							+"<input type='button' name='update' class='updatebutton' value='修改' onclick='update("+data.dataList[i].user.id+");'/>"
							+"<input type='button' onclick='deletes(this)' style='background-color:#FA5858;border: 1px solid #FA5858' class='updatebutton' value='删除' />"
							+"</td>"
							+"</tr>");
				}
				//参数依次为	总页数，当前页数，总条数，当前大小，页码数，分页所放的ul的ID的值 ，搜索框的值
				myFunction(data.pageCount, data.pageNum, data.totalCount, data.pageSize, 3, "paging", data.search);
				
				var pageNum = $("#pageNum").val();//当点击按钮页数，id为pageNumber就会获得点击的页数，用变量接住页数的值
				$("ul button").each(function(){//匹配ul下的button的值
					if(pageNum == $(this).text()){//当页数和该对象的文本值相等时
						$(this).attr("style","color: #2eccfa;background: #dddddd;border: 1px solid #dddddd;");//就改变该按钮的样式
					}
				});
			}else{
				if($("#wu").text() == ""){//如果无数据则满足条件(也就是只报一次无数据)
					$("#myTable").after("<h2 id='wu'>无数据</h2>");
				} 
			}
		},
		error : function(XMLHttpRequest, textStatus, errorThrown) {
			 alert("错误: "+XMLHttpRequest.status);
		}
	});
}

</script>
<body style="background-color:#FFEBCD;">
	<div align="center">
		<form action="" id="form">
			<input id="pageSize" name="pageSize" type="hidden" value="3"/><!-- 默认每页3条 -->
			<input id="pageNum" name="pageNum" type="hidden" value="1"/><!-- 默认第一页 -->
			<input id="order" name="order" type="hidden" value="1"/><!-- 默认排序倒序 -->
			<p>
				姓名:<input id="userName" name="user.name" type="text">&nbsp;&nbsp;
				生日:<input id="startBirthday" size="4" name="startBirthday" type="date">-<input size="4" id="endBirthday" name="endBirthday" type="date">&nbsp;&nbsp;
				地址:<input id="userAddr" name="user.addr">&nbsp;&nbsp;
				<input id="searchs" type="button" value="确定">
				<input type="reset" value="清空">&nbsp;&nbsp;
				<a href="${pageContext.request.contextPath }/user/user">添加</a>
				<button type="button" id="asc">id顺序</button>
				<button type="button" id="desc">id倒序</button>
			</p>
		</form>
		<table id="myTable" border="1" cellpadding="10" cellspacing="0" style="border-collapse: collapse;">
			<!-- 表头 -->
			<thead>
				<tr align="center">
					<td>id</td>
					<td>名字</td>
					<td>性别</td>
					<td>地址</td>
					<td>生日</td>
					<td>电子邮箱</td>
					<td>状态</td>
					<td>操作</td>
				</tr>
			</thead>
			
			<!-- 主体 -->
			<tbody id="tables">
				
			</tbody>
			
			<!-- 页脚 -->
			<tfoot>
			</tfoot>
		</table>
		<div class="pagination">
			<ul id="paging">
			</ul>
		</div>
	</div>
</body>
</html>