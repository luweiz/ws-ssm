<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>个人信息</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="stylesheet" type="text/css" href="/resources/js/layui/common/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="/resources/js/layui/common/bootstrap/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="/resources/js/layui/common/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="/resources/js/layui/admin/css/personal.css" media="all">
</head>
<body>
<section class="layui-larry-box">
	<div class="larry-personal">
		<header class="larry-personal-tit">
			<span>个人信息</span>
		</header><!-- /header -->
		<div class="larry-personal-body clearfix">
			<form class="layui-form col-lg-7" action="" method="post" id="listForm">
				<input type="hidden" id="id" name="id" value="${model.id}"/>
				<div class="layui-form-item">
					<label class="layui-form-label">登录名</label>
					<div class="layui-input-block">  
						<input type="text" name="userName" required lay-verify="required" autocomplete="off"  class="layui-input" value="${model.userName}"  >
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">姓名</label>
					<div class="layui-input-block">
						<input type="text" name="cnName" required lay-verify="required"  autocomplete="off" class="layui-input" value="${model.cnName}">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">上传</label>
					<div class="layui-input-block">
						<input type="file" name="uploadFile" class="layui-upload-file">
					</div>
				</div>
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">座右铭</label>
					<div class="layui-input-block">
						<textarea id="remark" name="remark"  placeholder="备注" class="layui-textarea">${model.remark }</textarea>
					</div>
				</div>
				
				
				
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="btnSmt">立即提交</button>
						<a class="layui-btn layui-btn-primary" href="/admin/user/initUI.html">返回</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<script type="text/javascript" src="/resources/js/layui/common/layui/layui.js"></script>
<script type="text/javascript" src="/resources/jsp/user/addUI.js"></script>
</body>
</html>