<%--
  Created by IntelliJ IDEA.
  User: Root
  Date: 2019/6/5
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" type="text/css" href="style/css.css"/>
  <title>留言管理程序――修改</title>
</head>
<script language="JavaScript">
    /*设置新密码框是否可见*/
    function show() {
    var s=document.getElementById("newpwd");
    s.style.cssText="visibility: visible";
  }
  function hid() {
    var s=document.getElementById("newpwd");
    s.style.cssText="visibility: hidden";
  }
</script>
<body>
<center>
  <h1>留言管理程序</h1>
  <hr>
    <%
        // 判断是否有错误信息，如果有则打印
        // 如果没有此段代码，则显示时会直接打印null
        if (request.getAttribute("err") != null) {
    %>
    <h2><%=request.getAttribute("err")%></h2>
    <%
        }
    %>
  <form name="frmchg" action="del_chg_do.jsp" method="post">
    <table width="25%">
      <h1 style="color:red;font-size:40px;">用户修改</h1>
      <%--操作类型判断 --%>
      <tr>
        <td>用户类型：</td>
        <td>
          <input type="radio" name="leixing" value="chg" onclick="show()" checked>修改密码
          <input type="radio" name="leixing" value="del" onclick="hid()">删除账号
        </td>
      </tr>
      <%--用户类型判断 --%>
      <tr>
        <td>ＩＤ：</td>
        <td><input type="text" name="id" id="id" ></td>
      </tr>
      <tr>
        <td>密码：</td>
        <td><input type="password" name="password" id="password"></td>
      </tr>
      <tr id="newpwd" style="visibility: visible">
        <td>新密码：</td>
        <td><input type="password" name="new_password" id="new_password"></td>
      </tr>
      <tr>
        <td colspan="2">
          <br>
          <input type="submit" value="确定">
          <input type="reset" value="重置">
          <a href="zhuce.jsp">点击立即注册</a>
          <a href="login.jsp">返回登陆</a>
        </td>
      </tr>
    </table>
  </form>
  <hr>
</center>
</body>
</html>
