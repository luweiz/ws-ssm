layui.use("layedit", function() {
	var i = layui.layedit;
	i.build("article-box", {
		tool : [ "strong", "italic", "underline", "del", "|", "left", "center",
				"right", "link", "unlink", "face", "image" ]
	})
});