layui.use(['jquery','layer','element','laypage','laytpl'],function(){
window.jQuery = window.$ = layui.jquery;
window.layer = layui.layer;
var element = layui.element(),laytpl = layui.laytpl,
laypage = layui.laypage;

           
var getTpl = templateId.innerHTML;
function getList(page){
	$("#offset").val(page);
	$.getJSON(
		"/service/admin/user/list",
		$("#listForm").serialize(),
		function(json){
			if(json.state){
				var result=json.result;
   				laytpl(getTpl).render(result, function(html){
   					document.getElementById('tboydId').innerHTML = html;
   				});
			}else{
				layer.alert(json.msg,{icon: 5,title:'温馨提示'});
			}
		}
	);
}
       	
function initPageList(){
	$.getJSON(
		"/service/admin/user/list",
		$("#listForm").serialize(),
		function(json){
			if(json.state){
				var result=json.result;
				var pageNumber =result.pageNumber;
				laypage({
					cont: 'page',
					pages: pageNumber,
					jump: function(obj, first) {
						//得到了当前页，用于向服务端请求对应数据
						var curr = obj.curr;
						if(!first) {
							getList(curr);
						}else{
							laytpl(getTpl).render(result, function(html){
            					document.getElementById('tboydId').innerHTML = html;
            				});
						}
					}
				});
			}else{
				layer.alert(json.msg,{icon: 5,title:'温馨提示'});
			}
		}
	);
}
       	
$(function(){
	initPageList();
});

window.deleteModel=function(id){
	layer.confirm('确认要删除吗？', {icon: 0, title:'提示'}, function(index){
		  $.post(
			"/service/admin/user/delete",
			{
			   r:Math.random(),id:id
			},
			function(json){
				if(json.status){
					layer.msg('删除成功',{
						icon : 1,
						time : 1e3
					});
					getList(1);
				}else{
					layer.msg('删除失败',{
						icon : 2,
						time : 1e3
					});
				}
			},'json');
	});
	
}

});