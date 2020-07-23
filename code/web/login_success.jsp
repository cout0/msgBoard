<%--
  Created by IntelliJ IDEA.
  User: Root
  Date: 2019/6/5
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style/css.css"/>
        <title>留言管理程序――登陆</title>
    </head>
    <body >
    <center>
        <h1>留言管理程序</h1>
        <hr>
        <br>
        <%
            if (session.getAttribute("uname") != null) {
                        // 用户已登陆
%>
        <h2>登陆成功</h2>
        <h2>欢迎<font color="red" size="12">
            <%=session.getAttribute("uname")%>
            <%="["%>
            <%=session.getAttribute("uleixing")%>
            <%="]"%>
            </font>光临jsp留言程序</h2>
        <h2>两秒后跳转到留言管理界面</h2>
        <%		response.setHeader("refresh", "2;URL=list_notes.jsp");
        %>
        <h3><a href="list_notes.jsp">进入留言管理页面</a></h3>
        <%
        } else {
            // 用户未登陆，提示用户登陆，并跳转
            response.setHeader("refresh", "2;URL=login.jsp");
        %>
        您还未登陆，请先登陆！！！<br>
        两秒后自动跳转到登陆窗口！！！<br>
        如果没有跳转，请按<a href="login.jsp">这里</a>！！！<br>
        <%
            }
        %>
    </center>
</body>
</html>