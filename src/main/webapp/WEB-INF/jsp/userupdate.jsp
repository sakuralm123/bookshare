<%--
  Created by IntelliJ IDEA.
  User: lm
  Date: 2018/11/22
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8" contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible">
    <title>用户信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="../layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="../css/index.css" />
    <script src="../layui/layui.js"></script>
</head>

<body>
<div class="layui-raw" style="margin:30px">

    <div class="layui-col-md8 layui-col-md-offset2">
        <fieldset class="layui-elem-field layui-field-title item_div">
            <legend>个人信息</legend>
            <div class="layui-field-box layui-raw layui-col-space10" style="padding:20px">

                <form class="layui-form" action="${pageContext.request.contextPath}/changeuserinfo" method="post" enctype="multipart/form-data">
                    <div class="layui-col-md5">
                        <fieldset class="layui-elem-field">
                            <legend>头像</legend>
                            <div class="layui-field-box">
                                <img src="../resouce/img/doge.jpg" style="width:200px;height: 220px;">
                            </div>
                        </fieldset>

                        <div class="layui-form-item" >
                            <div class="layui-input-block">
                                <input type="file" name="uavat" />
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md7" style="padding:20px">
                        <div class="layui-form-item" style="margin:20px">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-block">
                                <input type="text" name="uname" required lay-verify="required" placeholder="请输入用户名"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item" style="margin:20px">
                            <label class="layui-form-label">性别</label>
                            <div class="layui-input-block">
                                <input type="radio" name="usex" value="男" title="男">
                                <input type="radio" name="usex" value="女" title="女" checked>
                            </div>
                        </div>
                        <div class="layui-form-item" style="margin:20px">
                            <label class="layui-form-label">年龄</label>
                            <div class="layui-input-block">
                                <input type="text" name="uage" required lay-verify="required" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>

                        <div class="layui-form-item" style="margin:20px">
                            <label class="layui-form-label">联系方式</label>
                            <div class="layui-input-block">
                                <input type="text" name="uconn" required lay-verify="required" autocomplete="off"
                                       class="layui-input">
                            </div>
                        </div>

                        <!-- <hr> -->
                        <div class="layui-form-item" style="margin:20px">
                            <div class="layui-input-block">
                                <input type="submit" class="layui-btn" value="确认修改">
                            </div>
                        </div>


                    </div>
                </form>


            </div>
        </fieldset>

    </div>
</div>

<script>
    //Demo
    layui.use(['layer', 'upload', 'form'], function () {
        var form = layui.form;
        var upload = layui.upload;
        var layer = layui.layer;
        //监听提交

        // form.on('submit(userupdate)', function (data) {
        //     layer.msg(JSON.stringify(data.field));
        //     return false;
        // });



    });
</script>
</body>

</html>