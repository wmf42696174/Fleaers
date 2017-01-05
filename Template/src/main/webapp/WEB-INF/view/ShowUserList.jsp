<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/static/css/animate.css">
    <style type="text/css">
      .box{width:80%;float:right;height:550px;border: 1px solid #fff;margin-right: 15px;}
      .box .b_title{width:100%;height:30px;border:1px solid red;border-top:none;background: #333762;}
      .box .b_title span{font-size:14px;display: inline-block; height:30px;text-align: center;color:#fff;line-height: 30px;}
      .box .b_title span.s1{width:100px;margin-left: 20px;}
      .box .b_title span.s2{width:60px;margin-left: 40px;}
      .box .b_title span.s3{width:50px;margin-left: 30px;}
      .box .b_title span.s4{width: 150px;margin-left: 20px;}
      .box .b_title span.s5{width:200px;margin-left: 20px;}
      .box .b_title span.s6{width:200px;margin-left: 20px;}
      .box .b_content{width:100%;height:490px;}
      .box .b_content p{display: block;width:100%;height:30px;border-bottom: 1px solid #fff;}
      .box .b_content span{font-size:14px;display: inline-block; height:30px;text-align: center;color:#fff;line-height: 30px;}
      .box .b_content span a{text-decoration: none;color:#fff;}
      .box .b_content span.c1{width:100px;margin-left: 20px;}
      .box .b_content span.c2{width:60px;margin-left: 40px;}
      .box .b_content span.c3{width:50px;margin-left: 30px;}
      .box .b_content span.c4{width: 150px;margin-left: 20px;}
      .box .b_content span.c5{width:200px;margin-left: 20px;}
      .box .b_content span.c6{width:200px;margin-left: 20px;}
      .box .fenye{width:100%;height:30px;}
      .box .fenye p{display: block;width:100%;height:100%;background:#7a43c3;}
      .box .fenye p span{margin-left:20px;display:inline-block;width:60px;height:30px;text-align: center;line-height: 30px;color:#fff;font-size: 14px;}
      .tip{display:none;width:300px;height:120px;position:absolute;top:0px;left:530px;background:#fff;}
      .tip .t_title{width:100%;height:30px;background:#131231;color:#fff;line-height:30px;}
      .tip .t_title p{color:#000;width:100%;height:30px;font-size:16px;letter-spacing:4px;margin-top:10px;}
    </style>
</head>
  <div class="box">
     <div class="b_title">
        <span class="s1">用户名</span>
        <span class="s2">性别</span>
        <span class="s3">年龄</span>
        <span class="s4">手机号</span>
        <span class="s5">email</span>
        <span class="s6">地址</span>
     </div>
     <div class="b_content">
         <c:forEach items="${UserList}" var="User">
             <p>
                 <span class="c1">${User.userName}</span>
                 <c:if test="${User.sex==1}">
                     <span class="c2">男</span>
                 </c:if>
                 <c:if test="${User.sex==2}">
                     <span class="c2">女</span>
                 </c:if>
                 <span class="c3">${User.age}</span>
                 <span class="c4">${User.phone}</span>
                 <span class="c5">${User.email}</span>
                 <span class="c6">${User.address}</span>
                 <span class="changeuser"><a href="<%=basePath%>/user/changeuser?id=${User.id}">修改</a></span>
                 <span class="deleteuser"><a href="<%=basePath%>/user/deleteuser?id=${User.id}">删除</a></span>
             </p>
         </c:forEach>
     </div>
      <div class="fenye">
            <form name="MyForm" method="post">
                <input type="hidden" id="_userName" name="userName"/>
                <input type="hidden" id="_sex" name="sex">
                <p style="color:#fff;">
                   <span>共     <i id="count">${count}</i>       页</span>
                   <input type="button" value="上一页" onclick="prea()" style="display:inline-block;width:80px;height:20px;text-align:center;line-height:20px;background:#333762;border-radius:3px;border: none;cursor:pointer;color:#fff;"/>
                    第<input type="text" id="pagenum" name="pagenum" value="${currentpagenum}" style="width:40px;background:#fff;border-radius:3px;text-align:center;border:none;"/>页
                   <input type="button" value="下一页" onclick="next()" style="display:inline-block;width:80px;height:20px;text-align:center;line-height:20px;background:#333762;border-radius:3px;border: none;cursor:pointer;color:#fff;"/>
                </p>
            </form>

      </div>
  </div>
<div class="tip animated bounceInDown">
    <div class="t_title">温馨提示
        <p id="tishi">已经删除该用户</p>
    </div>
</div>
<script>

    function next(){
        var pagenum=$("#pagenum").val();
        var count=$("#count").html();
        $("#_userName").val($("#userName").val());
        $("#_sex").val($("#sex").val());

        if(pagenum<count){
            var p=Number(pagenum)+1;
            $("#pagenum").val(p);
        }
        document.MyForm.action="<%=basePath%>/user/list?index=index";
        document.MyForm.submit();
    }

    function prea(){
        var pagenum=$("#pagenum").val();
        var count=$("#count").html();
        $("#_userName").val($("#userName").val());
        $("#_sex").val($("#sex").val());
        if(pagenum>1){
            var p=Number(pagenum)-1;
            $("#pagenum").val(p);
        }
        document.MyForm.action="<%=basePath%>/user/list?index=index";
        document.MyForm.submit();
    }
    var msg=$(".msg").text();
    if(msg=="success"){
        $(".tip").show();
        setTimeout(function(){
            $(".tip").slideUp();
        },2500);
    }
</script>
</body>
</html>
