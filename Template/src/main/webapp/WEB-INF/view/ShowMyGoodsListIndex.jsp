<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="main.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        *{margin:0px;padding: 0px;font-family: "微软雅黑";}
        .Search{width:80%;height: 40px;border:1px solid #fff;background: #333762;margin-top:20px;float: right;margin-right: 15px;}
        .Search .SearchBar{width:100%;height:30px;margin-top:5px;}
        .Search .SearchBar span{margin-left:100px;font-size:14px;display: inline-block;width:100px;height:100%;color: #fff;text-align: center;line-height: 30px;}
        .Search .SearchBar input{width:170px;height:20px;border-radius: 4px;border: 0;color:#fff;background: #7288a9;}
        .Search .SearchBar .submit{width:60px;height:20px;border-radius: 3px;display: inline-block;color: #fff;cursor: pointer;margin-left: 30px;}
    </style>
</head>
<body>
   <div class="Search">
       <form action="../goods/showmygoodslist?pagenum=1" method="post">
           <p class="SearchBar">
               <span>商品名:</span>
               <input type="text" name="name" id="name" value="${goods.name}"/>
               <span>审核结果:</span>
               <select name="flag" id="flag" style="width:90px;background: #7288a9;border-radius: 3px;color:#fff;">
                   <option value="0">默认</option>
                   <c:choose>
                       <c:when test="${goods.flag==1}">
                           <option value="1" selected>通过</option>
                           <option value="2">未通过</option>
                       </c:when>
                       <c:when test="${goods.flag==2}">
                           <option value="1" >通过</option>
                           <option value="2" selected>未通过</option>
                       </c:when>
                       <c:otherwise>
                           <option value="1">通过</option>
                           <option value="2">未通过</option>
                       </c:otherwise>
                   </c:choose>
               </select>
               <input type="submit" class="submit" value="查找"/>
           </p>
       </form>
   </div>
   <div class="goodslist">
       <%@include file="ShowGoodsList.jsp"%>
   </div>
</body>
</html>
