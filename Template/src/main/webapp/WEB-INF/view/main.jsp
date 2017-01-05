<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="/static/css/animate.css">
    <style type="text/css">
        *{margin:0px;padding: 0px;font-family: "微软雅黑";}
        body{background: #1B3050;overflow-x: hidden;overflow-y: hidden;}
        .title{width:100%;height:40px;border:1px solid #fff;box-shadow:0px 0px 23px 2px #DD70E4;}
        .title .header{width:1200px;height:40px;margin:0 auto;}
        .title .header .person{display:block;width:150px;height:35px;font-size:14px;
            text-align: center;line-height: 35px;color:#fff;float:left}
        .title .header .type{display:block;width:150px;height:35px; text-align: center;line-height: 35px;
            color:#fff;float:right;}
        .title .header .quit{text-decoration:none;color:#fff;float:right;margin-right:-200px;display:inline-block;width:60px;line-height:40px;text-align:center;height:40px;}
         .m_left{width:200px;height:600px;float:left;margin-top:20px;border:1px solid #fff;box-shadow:0px 0px 23px 2px #DD70E4;}
         .m_left ul li{list-style: none;border-bottom: 1px solid #fff;}
         .m_left ul li.manger{background:url("/static/img/manager.png") no-repeat 24px 7px;}
         .m_left ul li.shen{background:url("/static/img/shen.png") no-repeat 24px 7px;}
         .m_left ul li.cha{background:url("/static/img/cha.png") no-repeat 24px 7px;}
         .m_left ul li.want{background:url("/static/img/want.png") no-repeat 24px 7px;}
         .m_left ul li.pset{background:url("/static/img/manager.png") no-repeat 24px 7px;}
         .m_left ul li.mys{background:url("/static/img/mys.png") no-repeat 24px 7px;}
         .m_left ul li.fb{background:url("/static/img/fb.png") no-repeat 24px 7px;}
         .m_left ul li.splb{background:url("/static/img/splb.png") no-repeat 24px 7px;}
         .m_left ul li.smr{background:url("/static/img/smr.png") no-repeat 24px 7px;}
         .m_left ul li.fbxq{background:url("/static/img/fbxq.png") no-repeat 24px 7px;}
           .m_left ul li span{cursor:pointer;text-align:center;display:block;line-height:40px;color:#fff;}
        .m_left ul li span a{text-decoration: none;color:#fff;}
        .m_left ul li .list{display:none;}
         .m_left ul li .list p{text-align: center;cursor:pointer;font-size:14px;color:red;border-top:1px solid #606C7D;}

        .tip{display:none;width:300px;height:120px;position:absolute;top:40px;left:530px;background:#fff;}
        .tip .t_title{width:100%;height:30px;background:#131231;color:#fff;line-height:30px;}
        .tip .t_title p{color:#000;width:100%;height:30px;font-size:16px;letter-spacing:4px;margin-top:10px;}
    </style>
</head>
<body>
<%
   HttpSession session1=request.getSession();
    String Name=(String) session1.getAttribute("username");
    String type=(String)session1.getAttribute("type");

%>
<div class="title">
    <div class="header">
        <span class="person">欢迎<%=Name%>登陆</span>
        <span class="type"><%=type%></span>
        <a class="quit" href="../user/login">注销</a>
    </div>
</div>
<div class="m_left">
    <ul>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
        <li class="manger">
            <span><a href="../user/list?index=index&pagenum=1">用户管理</a></span>
            <div class="msg" style="display: none;">${tip}</div>
            <div class="list">
            </div>
        </li>
        </sec:authorize>
        <sec:authorize access="hasAnyRole('ROLE_USER','ROLE_SALE')">
         <li class="pset">
             <span><a href="../user/MyInfo">个人管理</a></span>
             <div class="msg3">${changemetip}</div>
         </li>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_USER')">
            <li class="mys">
                <span><a href="../goods/showmygoodslist?pagenum=1">我的商品</a></span>
                <div class="msg4">${changegoodstip}</div>
            </li>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_SALE')">
            <li class="splb">
                <span><a href="../goods/showallgoods?pagenum=1">商品列表</a></span>
            </li>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_SALE')">
            <li class="smr">
                <span><a href="../record/showmyrecord?pagenum=1">购买记录</a></span>
            </li>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_SALE')">
            <li class="fbxq">
                <span><a href="../want/addwant">发布需求</a></span>
            </li>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_USER')">
            <li class="fb">
                <span><a href="../goods/addgoods">发布商品</a></span>
            </li>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
        <li class="shen">
            <span><a href="../goods/checkgoods?pagenum=1">商品审核</a></span>
            <div class="msg2"style="display: none">${changetip}</div>
            <div class="list">
            </div>
        </li>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
        <li class="cha">
            <span><a href="../record/showallrecordlist?pagenum=1">查看订单</a></span>
            <div class="list">
            </div>
        </li>
        </sec:authorize>
        <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
        <li class="want">
            <span><a href="../want/showwantlist?pagenum=1">用户需求</a></span>
            <div class="list">
            </div>
        </li>
        </sec:authorize>
    </ul>
</div>
<!-- login end -->
<div class="tip animated bounceInDown">
    <div class="t_title">温馨提示
        <p id="tishi">用户修改成功</p>
    </div>
</div>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script>
    $(".m_left ul li span").click(function(){
        $(this).parent().find(".list").slideToggle(400);
        $(this).parent().siblings().find(".list").slideUp(400);

    });
    $(".m_left ul li").click(function(){
        var index=$(this).index();
        $(".page").eq(index).show().siblings().hide();
    });
    var msg=$(".msg").text();
    if(msg =="success"){
        $(".tip").show();
        setTimeout(function(){
            $(".tip").slideUp();
        },2500);
    };
    var msg2=$(".msg2").text();
    if(msg2 =="success"){

        $("#tishi").html("审核成功");
        $(".tip").show();
        setTimeout(function(){
            $(".tip").slideUp();
        },2500);
    };
    var msg3=$(".msg3").text();
    if(msg3 =="success"){
        $(".tip").show();
        setTimeout(function(){
            $(".tip").slideUp();
        },2500);
    };
</script>
</body>
</html>
