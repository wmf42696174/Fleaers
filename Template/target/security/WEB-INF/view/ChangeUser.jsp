<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@include file="ShowUserListIndex.jsp"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/static/css/animate.css">
    <style type="text/css">
        *{margin:0px;padding:0px;font-family:"幼圆"}
       .ChangeUser{width:100%;height:100%;background:rgba(0,0,0,.5);position: absolute;}
       .ChangeUser .C_Box{display:none;box-shadow:0px 0px 23px 2px #fff;width: 300px;height:400px;border-radius:4px;margin:20px auto;background: #333762;}
       .ChangeUser .C_Box h1{width:100%;height:40px;color:#fff;text-align: center;line-height: 40px;font-size: 22px;}
       .ChangeUser .C_Box p{width: 100%;height:40px;display:block;margin-top:10px;}
        .ChangeUser .C_Box p span{display: inline-block;height:30px;color:#fff;text-align:center;width:80px;line-height: 30px;}
        .ChangeUser .C_Box p input{padding-left:4px;background:#525898;color:#fff;display:inline-block;width:140px;height:22px;border-radius: 4px;border:none;}
        .ChangeUser .C_Box p select{padding-left:4px;width:100px;color:#fff;height:22px;border-radius: 2px;background:#525898;}
        .ChangeUser .C_Box p a{border-radius:4px;width:100px;height:22px;display:inline-block;background: #525898;text-decoration: none;color:#fff;text-align: center;line-height: 22px;}
    </style>
</head>
<body>
<div class="ChangeUser">
    <div class="C_Box">
        <form action="<%=basePath%>/user/changeuserinfo" method="post">
         <h1>修改信息</h1>
         <input type="hidden" name="id" id="id" value="${user.id}"/>
        <p><span>手机号:</span><input type="text" name="phone" id="phone" value="${user.phone}" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/></p>
        <p><span>年龄:</span><input type="text" name="age" id="age" value="${user.age}" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/></p>
        <p>
            <span>性别:</span>
            <select name="sex" id="sex">
             <c:if test="${user.sex==1}">
                 <option value="1" selected="selected">男</option>
                 <option value="2">女</option>
             </c:if>
            <c:if test="${user.sex==2}">
                <option value="1">男</option>
                 <option value="2" selected="selected">女</option>
            </c:if>
        </select>
        </p>
        <p>
            <span>email:</span>
            <input type="text" name="email" id="email" value="${user.email}"/>
        </p>
        <p>
            <span>地址:</span>
            <input id="address" name="address" value="${user.address}"/>
        </p>
        <p style="padding-left: 30px;">
            <input type="submit" value="修改" class="change" style="width:100px;background: #525891;cursor: pointer"/>
            <a href="<%=basePath%>/user/Return">取消</a>
        </p>
       </form>
    </div>
</div>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script>
    $(function () {
        $(".C_Box").removeClass("animated bounceOutUp").show().addClass("animated bounceInDown");
    })
</script>
</body>
</html>
