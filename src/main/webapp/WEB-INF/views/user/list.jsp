<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" media="screen" href="/resources/css/paper-css.css" />
<script type="text/javascript" src="/resources/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-jtemplates.js"></script>
<script type="text/javascript" src="/resources/js/jquery.pager.js"></script>
<script type="text/javascript" src="/resources/js/layer/layer.js"></script>
<script type="text/javascript" src="/resources/jsp/user/list.js"></script>
</head>
<body>
	<form action="/user/list.html" id="listForm" name="listForm"
		method="post">
		<input type="hidden" id="offset" name="offset" value="0" /> <input
			type="hidden" id="pageSize" name="pageSize" value="5" />
		<div id="content">
			<table width="800" cellspacing="0" cellPadding="0" id="listTable">
				<thead>
					<tr>
						<td width="50">序号</td>
						<td width="*">登录名</td>
						<td width="120">名称</td>
						<td width="110">状态</td>
						<td width="200">操作</td>
					</tr>
				</thead>
				<tbody id="order_list" name="order_list">
				</tbody>
			</table>
			<textarea id="template" style="display:none;"> 
		      	 {#foreach $T.datas as record}
		          <tr>
		            <td>{$T.record["id"]}</td>
		            <td>{$T.record["userName"]}</td>
		            <td>{$T.record["cnName"]}</td>
		            <td>
		            {#if $T.record["1"]=='1'}
				              男
				    {#else}
				                       女
				    {#/if}
		            </td>
		            <td>
		              <a href="/user/add.html?id={$T.record["id"]}" class="ups_css">编辑</a>
		              <a href="javascript:void(0)"
								onclick="deleteModel({$T.record["id"]})" class="ups_css">删除</a><br />
		            </td>
		          </tr>
		         {#/for}
			 </textarea>
			 <div class="pageLink" id="pager"></div>
		</div>
	</form>
	<div><a href="/user/register.html" target="_blank"></a></div>
</body>
</html>