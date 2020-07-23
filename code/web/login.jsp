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
  <title>留言管理程序――登陆</title>
</head>
<SCRIPT Language = "javascript">
  //下面的副程序将执行资料检查
  function isValid()
  {
    //下面的if判断语句将检查是否输入帐号资料
    if (frmLogin.id.value == "")
    {
      window.alert("您必须完成帐号的输入!");
      //显示错误信息
      document.frmLogin.elements(0).focus();
      //将光标移至帐号输入栏
      return  false;
    }

    //下面的if判断语句将检查是否输入帐号密码
    if (frmLogin.password.value == "")
    {
      window.alert("您必须完成密码的输入!");
      //显示错误信息
      document.frmLogin.elements(1).focus();
      //将光标移至密码输入栏
      return  false;  //离开函数
    }

    frmLogin.submit(); //送出表单中的资料
  }
</SCRIPT>
<center>
<body>

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
  <form name="frmLogin" action="login_conf.jsp" method="post" onSubmit="return isValid(this);">
    <table width="25%">
      <h1 style="color:red;font-size:40px;">用户登录</h1>
      <tr>
        <td>ＩＤ：</td>
        <td><input type="text" name="id" id="id" ></td>
      </tr>
      <tr>
        <td>密码：</td>
        <td><input type="password" name="password" id="password"></td>
      </tr>
      <tr>
        <td colspan="2">
          <br>
          <input type="submit" value="登陆">
          <input type="reset" value="重置">
          <a href="zhuce.jsp">点击立即注册</a>
          <a href="del_chg.jsp">账号设置</a>
        </td>
      </tr>
    </table>
  </form>
  <hr>
</center>
</body>
</html>
