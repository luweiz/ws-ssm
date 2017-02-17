<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1">
<link rel="stylesheet" href="../../src/css/index.css">
<link rel="stylesheet" href="../../src/layui/css/layui.css">
</head>
<body>
	<div class="tab-body">
		<p class="page-tab">
			<span class="layui-breadcrumb" lay-separator=">"><a href="">首页</a><a><cite>用户列表</cite>
			</a>
			</span>
		</p>
		<div class="handle-box">
			<ul>
				<li class="handle-item"><span class="layui-form-label">输入用户名：</span>
				<div class="layui-input-inline">
						<input type="text" autocomplete="off" placeholder="请输入搜索条件"
							class="layui-input">
					</div>
					<button class="layui-btn mgl-20">查询</button>
					<button class="layui-btn mgl-20" id="refresh">刷新</button>
					<span class="fr"><a
						class="layui-btn layui-btn-danger radius btn-delect"
						id="btn-delect-all"><i class="linyer icon-delect"></i> 批量删除</a><a
						class="layui-btn btn-add btn-default" id="btn-adduser"><i
							class="linyer icon-add"></i> 添加用户</a>
				</span>
				</li>
			</ul>
		</div>
		<div class="layui-clear">
			<div class="tableTools fr"></div>
		</div>
		<table class="table-box table-sort" id="userTable">
			<thead>
				<tr>
					<th><input type="checkbox" class="btn-checkall fly-checkbox">
					</th>
					<th>ID</th>
					<th>用户名</th>
					<th>性别</th>
					<th>手机</th>
					<th>身份证号</th>
					<th>邮箱</th>
					<th>地址</th>
					<th>加入时间</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody></tbody>
			<tfoot>
				<tr>
					<th><input type="checkbox" class="btn-checkall fly-checkbox">
					</th>
					<th>ID</th>
					<th>用户名</th>
					<th>性别</th>
					<th>手机</th>
					<th>身份证号</th>
					<th>邮箱</th>
					<th>地址</th>
					<th>加入时间</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</tfoot>
		</table>
	</div>
	<script src="../../src/layui/layui.js"></script>
	<script src="../../src/js/define/common.js"></script>
	<script src="../../src/js/define/user.js"></script>
</body>
</html>