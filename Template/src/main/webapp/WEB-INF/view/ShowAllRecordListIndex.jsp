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
    <form method="post" action="../record/showallrecordlist?pagenum=1">
        <p class="SearchBar">
            <span>开始时间:</span>
            <input type="datetime-local" name="begintime" id="begintime" value="${begintime}"/>
            <span>结束时间:</span>
            <input type="datetime-local" name="endtime" id="endtime" value="${endtime}"/>
            <input type="submit" class="submit" value="查找"/>
        </p>
    </form>
</div>
<div class="ShowAllRecordList">
    <%@include file="ShowAllRecordList.jsp"%>
</div>
</body>
</html>
