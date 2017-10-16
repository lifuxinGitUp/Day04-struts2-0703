<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/10/13
  Time: 上午9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>

  <a href="upload.jsp">单文件上传</a><br>
  <a href="download.action?fileName=孔子.png">点击下载孔子图片</a><br>
  <a href="login.jsp">登录界面</a>

  <%-- 显示错误信息 --%>
  <s:actionerror/>
  <s:fielderror/>

  </body>
</html>
