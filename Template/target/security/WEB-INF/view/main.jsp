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
            <span><a href="../user/list?index=index">用户管理</a></span>
            <div class="list">
            </div>
        </li>
        </sec:authorize>
        <sec:authorize access="hasAnyRole('ROLE_USER','ROLE_SALE')">
         <li class="pset">
             <span><a href="../user/MyInfo">个人管理</a></span>
         </li>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_USER')">
            <li class="mys">
                <span><a href="../goods/showmygoodslist">我的商品</a></span>
            </li>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_SALE')">
            <li class="splb">
                <span><a href="../goods/showallgoods">商品列表</a></span>
            </li>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_SALE')">
            <li class="smr">
                <span><a href="../record/showmyrecord">购买记录</a></span>
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
            <span><a href="../goods/checkgoods">商品审核</a></span>
            <div class="list">
            </div>
        </li>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
        <li class="cha">
            <span><a href="">查看订单</a></span>
            <div class="list">
            </div>
        </li>
        </sec:authorize>
        <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
        <li class="want">
            <span><a href="../want/showwantlist">用户需求</a></span>
            <div class="list">
            </div>
        </li>
        </sec:authorize>
    </ul>
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
</script>
</body>
</html>
