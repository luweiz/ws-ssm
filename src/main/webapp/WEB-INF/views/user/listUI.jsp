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
<form action="/user/list.html" id="listForm" name="listForm" method="post">
<input type="hidden" id="offset" name="offset" value="1" /> 
<input type="hidden" id="pageSize" name="pageSize" value="5" />
<section class="layui-larry-box">
	<div class="larry-personal">
	    <div class="layui-tab">
            <blockquote class="layui-elem-quote mylog-info-tit">
                <p class="page-tab">
					<span class="layui-breadcrumb" lay-separator=">"><a href="">首页</a><a><cite>订单列表</cite>
					</a>
					</span>
				</p>
            </blockquote>
            <div class="larry-separate"></div>
            
		    <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
		    	<div class="handle-box">
					<ul>
						<li class="handle-item"><span class="layui-form-label">用户名：</span>
						<div class="layui-input-inline">
								<input type="text" autocomplete="off" placeholder="用户名"
									class="layui-input">
							</div>
							<button class="layui-btn mgl-20">查询</button>
							<button class="layui-btn mgl-20" id="refresh">刷新</button>
							<span class="fr">
							<a class="layui-btn layui-btn-danger"><i class="layui-icon">&#xe640;</i> 删除</a>
							<a class="layui-btn layui-btn-danger" href="/admin/user/addUI.html" ><i class="layui-icon">&#xe61f;</i> 添加</a>
						</span>
						</li>
					</ul>
				</div>
			    
                <div class="layui-tab-item layui-field-box layui-show">
                     <table class="layui-table table-hover" lay-even="" lay-skin="nob">
                          <thead>
                              <tr>
                                  <th><input type="checkbox" id="selected-all"></th>
                                  <th>ID</th>
                                  <th>登录名</th>
                                  <th>名称</th>
                                  <th>更新</th>
                                  <th>操作</th>
                              </tr>
                          </thead>
                          <tbody id="tboydId">
                          </tbody>
                     </table>
                     <div class="larry-table-page clearfix">
				          <div id="page" class="page"></div>
			         </div>
			    </div>
		    </div>
		</div>
	</div>
</section>
</form>
<script type="text/javascript" src="/resources/js/layui/common/layui/layui.js"></script>
<script id="templateId" type="text/html">
<ul>
{{#  layui.each(d.datas, function(index, item){ }}
  <tr>
      <td><input type="checkbox"></td>
      <td>{{ item.id }}</td>
	  <td>{{ item.userName }}</td>
	  <td>{{ item.cnName }}</td>
	  <td>{{ item.updated }}</td>
	  <td>
		<a class="layui-btn layui-btn-small" href="/admin/user/addUI.html?id={{ item.id }}"><i class="layui-icon">&#xe642;</i>编辑</a>
    	<button type="button" class="layui-btn layui-btn-small" onclick="deleteModel({{ item.id }});" title='删除'><i class="layui-icon">&#xe640;</i>删除</button>
	  </td>
  </tr>
{{#  }); }}
 
{{#  if(d.datas.length === 0){ }}
  无数据
{{#  } }} 
</ul>
</script>
<script type="text/javascript" src="/resources/jsp/user/listUI.js"></script>

</body>
</html>