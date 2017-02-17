<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1">
<link rel="stylesheet" href="../../src/css/index.css">
<link rel="stylesheet" href="../../src/layui/css/layui.css">
<title>文章编辑</title>
</head>
<body>
	<div class="pd-20 product-add">
		<form class="layui-form" action="">
			<div class="layui-form-item">
				<label class="layui-form-label">文章标题</label>
				<div class="layui-input-block">
					<input type="text" name="productname" lay-verify="username"
						autocomplete="off" placeholder="请输入产品名称" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">文章类目</label>
				<div class="layui-input-block">
					<select name="classify"><option value="">请选择类目</option>
						<optgroup label="众星宝">
							<option value="稳健型">稳健型</option>
							<option value="进取型">进取型</option>
						</optgroup>
						<optgroup label="双融宝">
							<option value="双融宝">双融宝</option>
						</optgroup>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">显示状态</label>
				<div class="layui-input-block">
					<input type="checkbox" name="status" lay-skin="switch">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">文章编辑</label>
				<div class="layui-input-block">
					<textarea id="article-box" style="display:none"></textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"></label>
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit="" lay-filter="productadd">保存并提交</button>
					<button class="layui-btn" lay-submit="" lay-filter="productsave">保存草稿</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</form>
	</div>
	<script src="../../src/layui/layui.js"></script>
	<script src="../../src/js/define/common.js"></script>
	<script src="../../src/js/define/article-add.js"></script>
</body>
</html>