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
        <title>留言管理程序――修改</title>
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
            PreparedStatement stmt = null;
        %>
        <%
            // 声明一个boolean变量
            boolean flag = false;
            boolean legal = false;
            // 接收参数
            String leixing = request.getParameter("leixing");
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String psw = request.getParameter("password");
            String npsw = request.getParameter("new_password");
            String real_psw = null;


            String sql1="SELECT password FROM person WHERE id=?";
            conn=new DBClass().get_con();
            stmt = conn.prepareStatement(sql1);
            stmt.setInt(1,Integer.parseInt(id));
            ResultSet rs=stmt.executeQuery();

            if(rs.next()){
                real_psw=rs.getString(1);
                if(real_psw.equals(psw)){
                    legal=true;
                }
            }
            if(legal==false){
                out.print("错误的学生用户名及密码！！！即将跳转修改页<br>");
                response.setHeader("refresh", "2;URL=del_chg.jsp");
                %>
                <br>如果没有跳转，请按<a href="del_chg.jsp">这里</a>！！！
                <%
                return;
            }


            //判断操作类型，修改密码
            if (leixing.equals("chg")) {
            String sql2 = "UPDATE person set password=? WHERE id=?";

                conn=new DBClass().get_con();
                stmt = conn.prepareStatement(sql2);
                stmt.setString(1,npsw);
                stmt.setInt(2,Integer.parseInt(id));

                stmt.executeUpdate();
                stmt.close();
                conn.close();
                // 如果修改成功，则肯定能执行到此段代码
                flag = true;
            } else {


                //判断操作类型，删除用户
            String sql3 = "DELETE FROM person WHERE id=?";

                conn=new DBClass().get_con();
                stmt = conn.prepareStatement(sql3);
                stmt.setInt(1,Integer.parseInt(id));

                stmt.execute();
                stmt.close();
                conn.close();
                // 如果删除成功，则肯定能执行到此段代码
                flag = true;
            }
        %>

        <%
            response.setHeader("refresh", "2;URL=login.jsp");
            if (leixing.equals("chg")) {
                out.print("修改密码");
            } else {
                out.print("删除账号");
            }
        %>
        <%
        if (flag) {
        %>
        成功，两秒后跳转到登陆首页！！！<br>
        如果没有跳转，请按<a href="login.jsp">这里</a>！！！
        <hr>
        <%
            } else {
        %>
        失败，两秒后跳转到修改页面！！！<br>
        如果没有跳转，请按<a href="del_chg.jsp.jsp">这里</a>！！！
        <hr>
        <%
            }
        %>
    </center>
</body>
</html>