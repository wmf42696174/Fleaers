<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@include file="ShowMyGoodsListIndex.jsp"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/static/css/animate.css">
    <style type="text/css">
        *{margin:0px;padding:0px;font-family:"幼圆"}
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
        <form action="<%=basePath%>/goods/changegoodsinfo" method="post">
            <h1>修改商品</h1>
            <input type="hidden" name="id" id="id" value="${Goods.id}"/>
            <p><span>商品名:</span><input type="text" name="name" id="name" value="${Goods.name}"/></p>
            <p><span>价格:</span><input type="text" name="price" id="price" value="${Goods.price}"/></p>
            <p>
                <span>数量:</span>
                <input type="text" name="num" id="num" value="${Goods.num}"/>
            </p>
            <p>
                <span>说明:</span>
                <input id="mark" name="mark" value="${Goods.mark}"/>
            </p>
            <p style="padding-left: 30px;">
                <input type="submit" value="修改" class="change" style="width:100px;background: #525891;cursor: pointer"/>
                <a href="<%=basePath%>/goods/Return">取消</a>
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
