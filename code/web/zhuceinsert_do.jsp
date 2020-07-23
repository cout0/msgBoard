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
        <title>留言管理程序――注册</title>
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

        <%!
            Connection conn = null;
            Statement stmt = null;
        %>
        <%
            // 声明一个boolean变量
            boolean flag = false;

            // 接收参数
            String leixing = request.getParameter("leixing");
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String psw = request.getParameter("psw");
        %>
        <%
            //判断用户类型，学生注册，
            if (leixing.equals("xuesheng")) {
        %>
        <%
            // 现在note表中的主键是id自动递增生成
            String sql = "INSERT INTO person(id,name,password,super)"
                    + " VALUES ('" + id + "','"
                    + name + "','"
                    + psw + "','0')";

                conn=new DBClass().get_con();
                stmt = (Statement) conn.createStatement();

                stmt.executeUpdate(sql);
                stmt.close();
                conn.close();
                // 如果插入成功，则肯定能执行到此段代码
                flag = true;

        %>
        <%
            //判断用户类型，管理员注册，
        } else {
        %>
        <%
            // 现在note表中的主键是id自动递增生成
            String sql = "INSERT INTO person(id,name,password,super)"
                    + " VALUES ('" + id + "','"
                    + name + "','"
                    + psw + "','1')";

                conn=new DBClass().get_con();
                stmt = (Statement) conn.createStatement();
                stmt = (Statement) conn.createStatement();

                stmt.executeUpdate(sql);
                stmt.close();
                conn.close();
                // 如果插入成功，则肯定能执行到此段代码
                flag = true;
        %>
        <%
            }
        %>

        <%
            response.setHeader("refresh", "2;URL=login.jsp");
            if (flag) {
        %>
        会员注册成功，两秒后跳转到登陆首页！！！<br>
        如果没有跳转，请按<a href="login.jsp">这里</a>！！！
        <hr>
        <%
        } else {
        %>
        会员注册失败，两秒后跳转到登陆首页！！！<br>
        如果没有跳转，请按<a href="zhuce.jsp">这里</a>！！！
        <hr>
        <%
            }
        %>

    </center>
</body>
</html>