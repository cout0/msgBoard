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
        <title>留言管理程序――登陆</title>
    </head>
    <body>
    <center>
        <h1>留言管理程序</h1>
        <hr>
        <br>
        <%!
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
        %>
        <%
            // 声明一个boolean变量，用于保存用户是否合法的状态
            boolean flag = false;

            // 接收参数
            String id = request.getParameter("id");   				//用户名
            String password = request.getParameter("password");    //用户密码
            Integer su=null;
            String leixing = request.getParameter("leixing");		//用户类型
        %>
        <%--登陆检测--%>
        <%
            String sql = "SELECT name,super FROM person WHERE id=? and password=?";
                conn=new DBClass().get_con();

                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, id);
                pstmt.setString(2, password);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    // 用户合法
                    flag = true;
                    // 将用户名保存在session之中
                    session.setAttribute("uname", rs.getString(1));  //判断用户是否存在
                    session.setAttribute("id",id);
                    su=rs.getInt(2);
                    if(su.equals(0)){//判断用户类型
                        session.setAttribute("uleixing", "同学");
                    }else{
                        session.setAttribute("uleixing", "管理员");  //判断用户类型
                    }

                } else {
                    // 保存错误信息
                    request.setAttribute("err", "错误的用户名及密码！！！");
                }
                rs.close();
                pstmt.close();
                conn.close();
        %>
        <%
            // 跳转
            if (flag) {
                        // 用户合法
        %>
        <jsp:forward page="login_success.jsp"/>
        <%
        } else {
                        // 用户非法
        %>
        <jsp:forward page="login.jsp"/>
        <%
            }
        %>
    </center>
</body>
</html>