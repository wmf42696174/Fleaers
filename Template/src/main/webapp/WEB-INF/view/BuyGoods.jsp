<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="main.jsp"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/static/css/animate.css">
    <style type="text/css">
        .ChangeGoods{width:100%;height:100%;background:rgba(0,0,0,.5);position: absolute;}
        .ChangeGoods .C_Box{box-shadow:0px 0px 23px 2px #fff;width: 260px;height:360px;border-radius:4px;margin:20px auto;background: #333762;}
        .ChangeGoods .C_Box h1{width:100%;height:40px;color:#fff;text-align: center;line-height: 40px;font-size: 22px;}
        .ChangeGoods .C_Box p{width: 100%;height:40px;display:block;margin-top:10px;}
        .ChangeGoods .C_Box p span{display: inline-block;height:30px;color:#fff;text-align:center;width:80px;line-height: 30px;}
        .ChangeGoods .C_Box p input{padding-left:4px;background:#525898;color:#fff;display:inline-block;width:140px;height:22px;border-radius: 4px;border:none;}
        .ChangeGoods .C_Box p select{padding-left:4px;width:100px;color:#fff;height:22px;border-radius: 2px;background:#525898;}
        .ChangeGoods .C_Box p a{border-radius:4px;width:100px;height:22px;display:inline-block;background: #525898;text-decoration: none;color:#fff;text-align: center;line-height: 22px;}
    </style>
</head>
<body>
<div class="ChangeGoods">
    <div class="C_Box">
        <form action="<%=basePath%>/record/addrecord" method="post">
            <h1>购买商品</h1>
            <input type="hidden" name="id" id="id" value="${Goods.id}"/>
            <p><span>商品名:</span><input type="text" name="gname" id="gname" value="${Goods.name}"  readonly="true"/></p>
            <p><span>价格:</span><input type="text" name="gprice" id="gprice" value="${Goods.price}"  readonly="true"/></p>
            <p>
                <span>购买数量:</span>
                <input type="text" name="gnum" id="gnum" min="1" max="${Goods.num}" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" oninput="change(event)" onporpertychange="change(event)" />
            </p>
            <p>
                <span>应支付:</span>
                <input id="gsum" name="gsum" value=""  readonly="true"/>
            </p>
            <p style="padding-left: 30px;">
                <input type="submit" value="购买" class="buy" style="width:100px;background: #525891;cursor: pointer"/>
                <a href="<%=basePath%>/goods/Return">取消</a>
            </p>
        </form>
    </div>
</div>
<script type="text/javascript" src="/static/js/jquery.js"></script>
<script>
    $(function () {
        $(".C_Box").removeClass("animated bounceOutUp").show().addClass("animated bounceInDown");
    });
    function  change(event) {
        var num=document.getElementById("gnum").value;
        var price=document.getElementById("gprice").value;
        $("#gsum").val(num*price);
    }

</script>
</body>
</html>
