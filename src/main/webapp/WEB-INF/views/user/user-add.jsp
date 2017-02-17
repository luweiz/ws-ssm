<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" media="screen"
	href="/resources/css/paper-css.css" />
<script type="text/javascript" src="/resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/resources/js/kindeditor-4.1.10/kindeditor-min.js"></script>
</head>
<body>
<form action="/user/list.html" id="listForm" name="listForm"
	method="post">
	<table width="100%" border="0" cellpadding="5" class="tab-form">
          <tr >
	        <td class="tl">帐号名称：</td>
	        <td class="tr">&nbsp;<input id="userName" name="userName" value="${model.userName}" type="text" class="l5" /><span></span></td>
	       </tr>
	       <tr >
	        <td class="tl">中文名称：</td>
	        <td class="tr">&nbsp;<input id="cnName" name="cnName" value="${model.name}"  type="text" class="l5" /><span></span></td>
	       </tr>
	       <tr style="line-height:20px;">
	        <td class="tl">简介：</td>
	        <td class="tr">&nbsp; 
	        <textarea id="remark" name="remark"  placeholder="简介" ><c:out value='${model.remark}' /></textarea>
	        </td>
	       </tr>
	       <tr >
	        <td class="tl">&nbsp;</td>
	        <td >&nbsp;
	        <input type="button" id="registsubmit" value="立即注册" onclick="submitForm();"/>
	        <input type="submit" class="btn_submit5" value="提交"/>&nbsp;
	        <input type="button" class="btn_submit5" value="返回" onclick="backList();"/></td>
	       </tr>
        </table>
        <label id='loginpwd_error'></label>
</form>
</body>
<script type="text/javascript">
function submitForm(){
	//将编辑器中的内容同步到隐藏多行文本中
	editor.sync();
	$.ajax({
	   type: "POST",
	   url: "/service/user/doRegister",
	   data: $("#listForm").serialize(),
	   dataType : "json",
	   error: function () {
           $("#loginpwd_error").html("网络超时，请稍后再试").show().attr({ "class": "error" });
       },
       success: function (result) {
    	   if (result) {
               var obj = eval(result);
               if (obj.status) {
               	obj.success = "http://localhost:9990/user/list.html";
                   var isIE = !-[1,];
                   if (isIE) {
                       var link = document.createElement("a");
                       link.href = obj.success;
                       link.style.display = 'none';
                       document.body.appendChild(link);
                       link.click();
                   } else {
                       window.location = obj.success;
                   }
                   return;
               }else{
                 $("#loginpwd_error").html("注册失败!").show().attr({ "class": "error" });
               }
    	   }
       }
	   
	});
}

var editor;
KindEditor.ready(function(K) {
	editor = K.create('textarea[name="remark"]', {
		resizeType : 1,
		allowPreviewEmoticons : false,
		allowImageUpload : false,
		newlineTag:"br",
		items : [
			'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
			'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
			'insertunorderedlist', '|', 'emoticons', 'image', 'link']
	});
});
</script>
</html>