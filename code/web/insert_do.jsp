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
        <link rel="stylesheet" type="text/css" href="style/css.css"/>
        <title>留言管理程序――插入</title>
    </head>
    <body>
    <center>
        <h1>留言管理程序</h1>
        <hr>
        <br>
        <%
            // 进行乱码处理
            request.setCharacterEncoding("UTF-8");
        %>
        <%
            if (session.getAttribute("uname") != null) {
                        // 用户已登陆
        %>
        <%!
            Connection conn = null;
            Statement stmt = null;
        %>
        <%
            // 声明一个boolean变量
            boolean flag = false;

            // 接收参数
            String title1 = request.getParameter("title");
            String author1 = String.valueOf(session.getAttribute("uname")) + "(id:" + String.valueOf(session.getAttribute("id")) + ")";
            String content1 = request.getParameter("content");
        %>
        <%
                // 现在note表中的主键是id自动递增生成
            String sql = "INSERT INTO note(orign,title,author,content)"
                    + " VALUES ('"+ String.valueOf(session.getAttribute("id")) +
                    "','" + title1 + "','"
                    + author1 + "','"
                    + content1 + "')";

                conn=new DBClass().get_con();
                stmt = (Statement) conn.createStatement();

                stmt.executeUpdate(sql);
                stmt.close();
                conn.close();
                // 如果插入成功，则肯定能执行到此段代码
                flag = true;
        %>
        <%
            response.setHeader("refresh", "2;URL=list_notes.jsp");
            if (flag) {
        %>
        留言添加成功，两秒后跳转到留言列表页！！！<br>
        如果没有跳转，请按<a href="list_notes.jsp">这里</a>！！！
        <hr>
        <%
        } else {
        %>
        留言添加失败，两秒后跳转到留言列表页！！！<br>
        如果没有跳转，请按<a href="list_notes.jsp">这里</a>！！！
        <hr>
        <%
            }
        %>
        <%
        } else {
            // 用户未登陆，提示用户登陆，并跳转
            response.setHeader("refresh", "2;URL=login.jsp");
        %>
        您还未登陆，请先登陆！！！<br>
        两秒后自动跳转到登陆窗口！！！<br>
        如果没有跳转，请按<a href="login.jsp">这里</a>！！！<br>
        <hr>
        <%
            }
        %>
    </center>
</body>
</html>