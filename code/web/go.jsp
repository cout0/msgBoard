<%--
  Created by IntelliJ IDEA.
  User: Root
  Date: 2019/6/5
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DB.DBClass"%>
<html>
<head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <LINK rel="Bookmark" href="http://uploadico.55.la/upload/ico/2014/05/11/19/gic5466363_1399809439.ico" >
    <LINK rel="Shortcut Icon" href="http://uploadico.55.la/upload/ico/2014/05/11/19/gic5466363_1399809439.ico" />
	<link rel="stylesheet" type="text/css" href="style/css.css"/>
	<title>留言管理程序――退出</title>
</head>
<body>
<center>
	<h1>留言管理程序</h1>
	<hr>
	<br>
	<%
		// 进行乱码处理
		request.setCharacterEncoding("UTF-8") ;
	%>
	<%   //退出对留言板的操作
		if(session.getAttribute("uname")!=null)
		{
			session.setAttribute("uname","null") ;
			session.invalidate();
			out.print("您已经成功退出，若要进行其他操作，<a href='login.jsp'>请重新登录</a>");
			out.print("<hr>");
		}
		else
		{
			out.print("您已经成功退出，若要进行其他操作，<a href='login.jsp'>请重新登录</a>");	
			out.print("<hr>");
		}
	%>
	
</center>
</body>
</html>