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
        <title>留言管理程序――注册</title>

    </head>
    <body>
    <center>
        <h1>留言管理程序</h1>
        <hr>
        <%
            request.setCharacterEncoding("UTF-8");
        %>
        <%--注册信息写入数据库 --%>

        <form action="zhuceinsert_do.jsp" method="post">
            <table width="28%">
                <h1 style="color:red;font-size:40px;">注册信息</h1>
                <%--用户类型判断 --%>
                    <td>用户类型：<input type="radio" name="leixing" value="xuesheng" checked>学生
                    <input type="radio" name="leixing" value="guanliyuan">管理员</td>

                    <%--<td style="color:#F00;"><font size="20px">学生普通操作，管理员进行编辑和删除</font></td>--%>
                </tr>

                <tr style="color:#F00;"><td>学生普通操作，管理员进行编辑和删除</td></tr>
                <%--用户类型判断 --%>
                <tr>
                    <td>ＩＤ：<input type="text" name="id"></td>
                    <td  style="color:#F00;">(数字)</td>
                </tr>
                <tr>
                    <td>姓名：<input type="text" name="name"></td>
                </tr>
                <tr>
                    <td>密码：<input type="text" name="psw"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="注册">
                        <input type="reset" value="重置">
                    </td>
                </tr>
            </table>
        </form>
        <h3><a href="login.jsp">回到登陆首页</a></h3>

        <hr>
    </center>
</body>
</html>