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
    <style type="text/css">
        .box{width:80%;float:right;height:550px;border: 1px solid #fff;margin-right: 15px;}
        .box .b_title{width:100%;height:30px;border:2px solid #f318f7;border-top:none;background: #333762;}
        .box .b_title span{font-size:14px;display: inline-block; height:30px;text-align: center;color:#fff;line-height: 30px;}
        .box .b_title span.s1{width:100px;margin-left: 20px;}
        .box .b_title span.s2{width:60px;margin-left: 20px;}
        .box .b_title span.s3{width:50px;margin-left: 20px;}
        .box .b_title span.s4{width: 150px;margin-left: 40px;}
        .box .b_title span.s6{width:100px;margin-left: 20px;}
        .box .b_title span.s5{width:250px;margin-left: 20px;}
        .box .b_content{width:100%;height: 520px;}
        .box .b_content p{display: block;width:100%;height:30px;border-bottom: 1px solid #fff;}
        .box .b_content span{font-size:14px;display: inline-block; height:30px;text-align: center;color:#fff;line-height: 30px;}
        .box .b_content span a{text-decoration: none;color:#fff;margin-left: 20px;}
        .box .b_content span.c1{width:100px;margin-left: 20px;}
        .box .b_content span.c2{width:60px;margin-left: 20px;}
        .box .b_content span.c3{width:50px;margin-left: 20px;}
        .box .b_content span.c4{width: 150px;margin-left: 20px;}
        .box .b_content span.c5{width:250px;margin-left: 20px;}
        .box .b_content span.c6{width:100px;margin-left: 20px;}
    </style>
</head>
<body>
   <div class="box">
       <div class="b_title">
           <span class="s1">商品名</span>
           <span class="s2">数量</span>
           <span class="s3">价格</span>
           <span class="s4">审核结果</span>
           <span class="s6">类型</span>
           <span class="s5">商品说明</span>
       </div>
       <div class="b_content">
           <c:forEach items="${goodslist}" var="Goods">
               <p>
                   <span class="c1">${Goods.name}</span>
                   <span class="c2">${Goods.num}</span>
                   <span class="c3">${Goods.price}</span>
                   <c:if test="${Goods.flag==1}">
                       <span class="c4">通过</span>
                   </c:if>
                   <c:if test="${Goods.flag==2}">
                       <span class="c4">未通过</span>
                   </c:if>
                   <c:if test="${Goods.type==1}">
                       <span class="c6">学习用品</span>
                   </c:if>
                   <c:if test="${Goods.type==2}">
                       <span class="c6">生活用品</span>
                   </c:if>
                   <c:if test="${Goods.type==3}">
                       <span class="c6">电子设备</span>
                   </c:if>
                   <c:if test="${Goods.type==4}">
                       <span class="c6">其他</span>
                   </c:if>
                   <span class="c5">${Goods.mark}</span>
                   <span class="changegoods"><a href="<%=basePath%>/goods/changegoods?id=${Goods.id}">修改</a></span>
                   <span class="deletegoods"><a href="<%=basePath%>/goods/deletegoods?id=${Goods.id}">下架</a></span>
               </p>
           </c:forEach>
       </div>
   </div>
</body>
</html>
