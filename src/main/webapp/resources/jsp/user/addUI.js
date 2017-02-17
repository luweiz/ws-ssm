layui.use(['form','upload','layedit'],function(){
	window.jQuery = window.$ = layui.jquery;
    var form = layui.form();
    layui.upload({ 
        url: '/service/pic/upload/' ,//上传接口 
        success: function(res){
         //上传成功后的回调 
         console.log(res) 
       } 
    });
    var layedit = layui.layedit;
    layedit.set({
	  uploadImage: {
	    url: '/service/pic/upload/',
	    type: 'post' //默认post
	  }
	});
    var editIndex = layedit.build('remark', {
	  height: 180 
	});
    
    form.on("submit(btnSmt)", function(e) {
    	var id = $("#id").val();
    	var url ="/service/admin/user/save";
    	if(id>0){
    		url ="/service/admin/user/update";
    	}
   		//layer.alert(JSON.stringify(e.field), {title : "最终的提交信息"});
    	layedit.sync(editIndex);
   		$.ajax({
    		   type: "POST",
    		   url: url,
    		   data: $("#listForm").serialize(),
    		   dataType : "json",
    		   error: function () {
    	           $("#loginpwd_error").html("网络超时，请稍后再试").show().attr({ "class": "error" });
    	       },
    	       success: function (result) {
    	    	   if (result) {
    	               var obj = eval(result);
    	               if (obj.status) {
    	            	   layer.msg('提交成功',{icon: 1,time: 2000 }, function(){
    	            		   window.location.href = "/admin/user/initUI.html";
    	            		 }); 
    	               }else{
    	                 $("#loginpwd_error").html("注册失败!").show().attr({ "class": "error" });
    	               }
    	    	   }
    	       }
    		});
   		
   		return false;
   	});
        

});