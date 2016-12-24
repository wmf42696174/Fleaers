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
        .Search .SearchBar span{margin-left:70px;font-size:14px;display: inline-block;width:100px;height:100%;color: #fff;text-align: center;line-height: 30px;}
        .Search .SearchBar input{width:170px;height:20px;border-radius: 4px;border: 0;color:#fff;background: #7288a9;}
        .Search .SearchBar .submit{width:60px;height:20px;border-radius: 3px;display: inline-block;color: #fff;cursor: pointer;margin-left: 30px;}
    </style>
</head>
<body>
<div class="Search">
    <form action="../goods/showallgoods" method="post">
        <p class="SearchBar">
            <span>发布人:</span>
            <select name="userid" id="userid" style="width:90px;background: #7288a9;border-radius: 3px;color:#fff;">
                <option value="">全部</option>
                <c:forEach items="${userList}" var="User">
                    <option value="${User.id}">${User.userName}</option>
                </c:forEach>
            </select>
            <span>商品类型:</span>
            <select name="type" id="type" style="width:90px;background: #7288a9;border-radius: 3px;color:#fff;">
                <option value="0">全部</option>
                <c:forEach items="${typeList}" var="type">
                    <c:if test="${type==1}">
                        <option value="1" >学习用品</option>
                    </c:if>
                    <c:if test="${type==2}">
                        <option value="2" >生活用品</option>
                    </c:if>
                    <c:if test="${type==3}">
                        <option value="3" >电子设备</option>
                    </c:if>
                    <c:if test="${type==4}">
                        <option value="4" >其它</option>
                    </c:if>
                </c:forEach>
            </select>
            <span>商品名:</span>
            <input type="text" name="name" id="name"/>
            <input type="submit" class="submit" value="查找"/>
        </p>
    </form>
</div>
<div class="showflagedgoodslist">
    <%@include file="ShowFlagedGoodsList.jsp"%>
</div>
</body>
</html>
