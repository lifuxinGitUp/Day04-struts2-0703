<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: dllo
  Date: 17/10/13
  Time: 上午9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>成功</title>
</head>
<body>
<h4>恭喜,提交成功!!</h4>
<h3>用户名:${username}</h3>
<h3>密码:${password}</h3>
<h3>取action属性,直接按属性名获取</h3>
用户名: <s:property value="username"/>

<h3>取request中的属性集合的某个key值; 没有定义scope时默认在request域中</h3>
<s:property value="#attr.request_username"/>

<h3>取application中map的某个key值,需要加application的前缀</h3>
<s:property value="#application.application_username"/>

<h3>取session中map的某个key值,也需要加session的前缀</h3>
<s:property value="#session.session_username"/>

<h3>取parameter中map的某个key值,也需要加parameter前缀</h3>
<s:property value="#parameters.username"/>

<h3>先通过set标签更改username的值,在调用propetry获取一下他的值</h3>
<s:set var="username" value="'张三'" scope="session"/>
<s:property value="#session.username"/>

<h3>通过set标签在session域中添加一个username属性</h3>
<s:set var="username" value="'张三'"/>
<s:property value="username"/>


<h3>通过set标签在application域中添加一个username属性,取值用username 如果value对应的值没有用单引号包裹起来,则默认认为是一个变量,
action属性集合中查找有没有定义该变量 </h3>
<s:set var="username" value="username" scope="application"/>
<s:property value="#application.username"/>

<h3>取request,session,application的属性同名对象</h3>
<%--<s:property value="#attr.name"/><br>--%>
<%--<s:property value="#session.name"/><br>--%>
<s:property value="#application.name"/>



<h3>#号构建map对象</h3>
<s:set name="footbar" value="#{'foo1':'吃饭','foo2':'睡觉'}"/>
<s:property value="#footbar['foo1']"/>



<h3>%{}将大括号中的内容认为是ognl表达式</h3>
<s:property value="%{姓名}"/>


<h3>输出一个list集合</h3>
<s:property value="{'吃饭','睡觉','打游戏'}"/>



</body>
</html>
