<%--
  Created by IntelliJ IDEA.
  User: lm
  Date: 2018/11/22
  Time: 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8" contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible">
    <title>用户信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="../../layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="../../css/index.css" />
    <script src="../../layui/layui.js"></script>
</head>

<body>
<div class="layui-raw" style="margin:30px">

    <div class="layui-col-md8 layui-col-md-offset2">
        <fieldset class="layui-elem-field layui-field-title item_div">
            <legend>个人信息</legend>
            <div class="layui-field-box layui-raw layui-col-space10" style="padding:20px">

                <div class="layui-col-md5">
                    <fieldset class="layui-elem-field">
                        <legend>头像</legend>
                        <div class="layui-field-box">
                            <img src="${user.uvavat}" style="width:300px;height: 320px;">
                        </div>
                    </fieldset>
                </div>
                <div class="layui-col-md7" style="padding:20px">
                    <form class="layui-form" action="">
                        <div class="layui-form-item" style="margin:20px">
                            <label class="layui-form-label">昵称</label>

                            <div class="layui-form-mid layui-word-aux">
                                <h1>${user.uname}</h1>
                            </div>
                        </div>
                        <div class="layui-form-item" style="margin:20px">
                            <label class="layui-form-label">性别</label>

                            <div class="layui-form-mid layui-word-aux">${user.usex}</div>
                        </div>
                        <div class="layui-form-item" style="margin:20px">
                            <label class="layui-form-label">年龄</label>

                            <div class="layui-form-mid layui-word-aux">${user.uage}</div>
                        </div>

                        <div class="layui-form-item" style="margin:20px">
                            <label class="layui-form-label">联系方式</label>

                            <div class="layui-form-mid layui-word-aux">${user.uconn}</div>
                        </div>
                        <!-- <hr> -->
                        <div class="layui-form-item" style="margin:20px">
                            <div class="layui-input-block">
                                <a href="${pageContext.request.contextPath}/var" class="layui-btn layui-btn-lg">修改信息</a>
                            </div>
                        </div>
                    </form>

                    <script>
                        //Demo
                        layui.use('form', function () {
                            var form = layui.form;

                            //监听提交
                            form.on('submit(formDemo)', function (data) {
                                layer.msg(JSON.stringify(data.field));
                                return false;
                            });
                        });
                    </script>
                </div>


            </div>
        </fieldset>

    </div>
</div>


</body>

</html>
