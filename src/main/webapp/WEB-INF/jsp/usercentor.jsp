<%--
  Created by IntelliJ IDEA.
  User: lm
  Date: 2018/11/22
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" isELIgnored="false" %>

<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Welcome to BookShare!</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="../layui/css/layui.css" />
    <script src="../layui/layui.js"></script>
</head>

<body class="layui-bg-black">

<div class="layui-layout layui-layout-admin">
    <div class="layui-raw">
        <div class="layui-header">
            <div class="layui-raw">&nbsp;</div>
            <div class="layui-raw layui-col-space2">
                <div class="layui-col-md2">
                    <a href="index.html"><img src="/user/LOGO.png"></a>
                </div>

                <div class="layui-col-md5">
                    <div class="layui-raw">
                        <%--<form class="layui-form" action="">--%>
                            <%--<div class="layui-raw">--%>
                                <%--<div class="layui-col-md9">--%>
                                    <%--<div class="layui-input-block">--%>
                                        <%--<input type="text" name="title" lay-verify="title" autocomplete="off"--%>
                                               <%--placeholder="搜索图书" class="layui-input layui-bg-black">--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="layui-col-md3">--%>
                                    <%--<div class="layui-form-item">--%>
                                        <%--<div class="layui-input-inline ">--%>
                                            <%--<button class="layui-btn layui-bg-black" lay-submit="" lay-filter="fuzzysearch"><i--%>
                                                    <%--class="layui-icon layui-icon-search"></i></button>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>


                        <%--</form>--%>
                    </div>
                </div>


            </div>


        </div>
    </div>

    <div class="layui-side">
        <ul class="layui-nav layui-nav-tree" lay-filter="test">
            <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
            <li class="layui-nav-item">
                <a href="${pageContext.request.contextPath}/userinfo" target="usernav">个人信息</a>
            </li>
            <li class="layui-nav-item layui-nav-itemed">
                <a href="javascript:;">订单</a>
                <dl class="layui-nav-child">
                    <dd><a href="${pageContext.request.contextPath}/befororder" target="usernav">正在进行</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/befororderd" target="usernav">已完成</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/allcollection" target="usernav">图书收藏</a></li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/beforupload" target="usernav">发布商品</a></li>
        </ul>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <iframe style="background-color:white" name="usernav" src="userinfo.html" height="95%" width="100%"></iframe>
        </div>
    </div>


</div>



<script>
    layui.use(['element', 'form'], function () {
        var element = layui.element;
        var form = layui.form;

        //监听提交
        form.on('submit(fuzzysearch)', function (data) {
            layer.msg(JSON.stringify(data.field));
            return false;
        });

    });

</script>
</body>

</html>