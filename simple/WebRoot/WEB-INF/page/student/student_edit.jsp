<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html style="padding-top: 0">
<head>

<%@ include file="/WEB-INF/page/s/common/pack-css.jsp" %>

</head>

<body class="bg-1">
	<div id="content" style="margin-top: 30px;padding-right: 50px;">
	<section class="">

        <!-- tile body -->
        <div class="tile-body col-md-8">
          
          <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/stu/update" id="pageForm">
            <div class="form-group">
              <label for="input01" class="col-sm-3 control-label">姓名</label>
              <div class="col-sm-7">
                <input type="text" class="form-control" name="name" value="${student.name}" >
              </div>
            </div>

            <div class="form-group">
              <label for="input02" class="col-sm-3 control-label" >年龄</label>
              <div class="col-sm-7">
               	<input type="text" class="form-control" name="age" value="${student.age}" >
              </div>
            </div>

            <div class="">
              <div class="col-sm-12 text-center">
                <button type="button" class="btn btn-danger" onclick="javascript:submitForm()" >保存并关闭</button>
              </div>
            </div>

          </form>

        </div>
        <!-- /tile body -->
       </section>
	
	</div>
	
	<%@ include file="/WEB-INF/page/s/common/pack-js.jsp" %>
	<script type="text/javascript">
		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
		function submitForm() {
			var action = $("#pageForm").attr("action");
			var options = {
	                url: action,
	                type: 'post',
	                dataType: 'text',
	                data: $("#pageForm").serialize(),
	                success: function (data) {
	                	var form =  parent.$('#pageList');
	        			form.submit();
	                    parent.layer.close(index);
	                }
	         };
	         $.ajax(options);
		}
	</script>
</body>
</html>
