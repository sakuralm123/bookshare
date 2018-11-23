<%--
  Created by IntelliJ IDEA.
  User: lm
  Date: 2018/11/23
  Time: 0:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE  html>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Welcome to BookShare!</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="../layui/css/layui.css" />
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
    <script src="../layui/layui.js"></script>
</head>

<body>

<div class="layui-layout layui-layout-admin" style="margin:30px">


    <div class="layui-raw">
        <div class="layui-col-md12">
            <fieldset class="layui-elem-field">
                <legend>正在进行</legend>
                <div class="layui-field-box">
                    <table class="layui-table">
                        <colgroup>
                            <col width="100">
                            <col width="100">
                            <col width="100">
                            <col width="50">
                            <col width="100">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>买家昵称</th>
                            <th>卖家昵称</th>
                            <th>图书名称</th>
                            <th>订单价格</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${orders}" var="order">
                            <tr>
                                <td>${order.ouid}</td>
                                <td>${order.obuid}</td>
                                <td>${order.obname}</td>
                                <td>${order.obprice}元</td>
                                <td><a class="layui-btn layui-btn-lg layui-btn-danger" href="${pageContext.request.contextPath}/comorder?oid=${order.oid}">完成订单</a></td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </fieldset>
        </div>
    </div>
    <div id="test1"></div>
</div>



<script>


    layui.use(['element', 'form', 'laypage'], function () {
        var element = layui.element;
        var form = layui.form;

        //监听提交
        form.on('submit(fuzzysearch)', function (data) {
            layer.msg(JSON.stringify(data.field));
            return false;
        });

        var laypage = layui.laypage;

        //执行一个laypage实例
        laypage.render({
            elem: 'test1' //注意，这里的 test1 是 ID，不用加 # 号
            , count: 50 //数据总数，从服务端得到
            , jump: function (obj, first) {
                //obj包含了当前分页的所有参数，比如：
                console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                console.log(obj.limit); //得到每页显示的条数

                //首次不执行
                if (!first) {
                    // do something
                    // $.ajax({
                    //     type: "post",
                    //     url: "bookList",
                    //     async: false,
                    //     dataType: 'json',
                    //     data: {
                    //          "page": page,
                    //          "size": size,
                    //     },
                    //     success: showList
                    // });
                }
            }
        });

    });

</script>
</body>

</html>