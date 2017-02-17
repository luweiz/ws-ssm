$(function() {
	getList(1);
});
function getList(page){
	$("#offset").val(page);
	$.getJSON(
		"/service/user/list",
		jQuery("#listForm").serialize(),
		function(json){
			if(json.state){
				var result=json.result;
				$("#order_list").setTemplateElement("template",null,{filter_data: false});
				$("#order_list").processTemplate(result);
				$("#pager").pager({pagenumber: page, pagecount:result.pageNumber, buttonClickCallback: getList,resultNumber:result.total });
			}else{
				layer.alert(json.msg,8,"温馨提示");//1：打钩,8：失败,9：成功 ,3:禁止 5：警告
			}
		}
	);
}

function deleteModel(id){//删除
	layer.confirm("您确定删除选择的记录？", function(){
		$.post(
		"/service/user/delete",
		{
		   r:Math.random(),id:id
		},
		function(json){
			if(json.status){
				layer.alert('一个很普通的信息框');
				getList(1);
			}else{
				layer.alert('一个很普通的信息框222');
			}
		},'json');
    }, "温馨提示");
	
}

