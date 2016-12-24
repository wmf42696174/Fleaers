<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="main.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        .MyBox{width:80%;float:right;height:600px;border: 1px solid #fff;margin-right: 15px;margin-top:20px;}
        .MyBox .mb_title{width:100%;height:30px;border:1px solid red;border-top:none;background: #333762;}
        .MyBox .mb_title span{font-size:14px;display: inline-block; height:30px;text-align: center;color:#fff;line-height: 30px;}
        .MyBox .mb_title span.s1{width:100px;margin-left: 20px;}
        .MyBox .mb_title span.s2{width:60px;margin-left: 40px;}
        .MyBox .mb_title span.s3{width:50px;margin-left: 30px;}
        .MyBox .mb_title span.s4{width: 150px;margin-left: 20px;}
        .MyBox .mb_title span.s5{width:200px;margin-left: 20px;}
        .MyBox .mb_title span.s6{width:200px;margin-left: 20px;}
        .MyBox .mb_content{width:100%;height: 520px;}
        .MyBox .mb_content p{display: block;width:100%;height:30px;border-bottom: 1px solid #fff;}
        .MyBox .mb_content p a{text-decoration: none;color:#fff;}
        .MyBox .mb_content p span{font-size:14px;display: inline-block; height:30px;text-align: center;color:#fff;line-height: 30px;}
        .MyBox .mb_content p span.c1{width:100px;margin-left: 20px;}
        .MyBox .mb_content p span.c2{width:60px;margin-left: 40px;}
        .MyBox .mb_content p span.c3{width:50px;margin-left: 30px;}
        .MyBox .mb_content p span.c4{width: 150px;margin-left: 20px;}
        .MyBox .mb_content p span.c5{width:200px;margin-left: 20px;}
        .MyBox .mb_content p span.c6{width:200px;margin-left: 20px;}
    </style>
</head>
<body>
<div class="MyBox">
   <div class="mb_title">
       <span class="s1">用户名</span>
       <span class="s2">性别</span>
       <span class="s3">年龄</span>
       <span class="s4">手机号</span>
       <span class="s5">email</span>
       <span class="s6">地址</span>
   </div>
    <div class="mb_content" >
        <p>
            <span class="c1">${user.userName}</span>
            <c:if test="${user.sex==1}">
                <span class="c2">男</span>
            </c:if>
            <c:if test="${user.sex==2}">
                <span class="c2">女</span>
            </c:if>
            <span class="c3">${user.age}</span>
            <span class="c4">${user.phone}</span>
            <span class="c5">${user.email}</span>
            <span class="c6">${user.address}</span>
            <span class="changeme"><a href="<%=basePath%>/user/changeme?id=${user.id}">修改</a></span>
        </p>
    </div>
</div>
</body>
</html>
