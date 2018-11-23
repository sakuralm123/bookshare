<%--
  Created by IntelliJ IDEA.
  User: lm
  Date: 2018/11/22
  Time: 8:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
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
    <div class="layui-header">
        <div class="layui-raw">&nbsp;</div>
        <div class="layui-raw layui-col-space2">
            <div class="layui-col-md2">
                <a href="index.html"><img src="/user/LOGO.png"></a>
            </div>




        </div>


    </div>


    <div class="layui-raw">
        <div class="layui-col-md6 layui-col-md-offset3" style="padding:50px">
            <div>
                <fieldset class="layui-elem-field" style="padding:30px">
                    <legend>注册</legend>
                    <div class="layui-field-box">

                        <form class="layui-form">
                            <div class="layui-form-item">
                                <label class="layui-form-label">账户</label>
                                <div class="layui-input-block">
                                    <!-- 用户名 -->
                                    <div class="layui-inline" style="width: 85%">
                                        <input type="text" id="user" name="uname" required lay-verify="required"
                                               placeholder="请输入用户名" autocomplete="off" class="layui-input">
                                    </div>
                                    <!-- 对号 -->
                                    <div class="layui-inline">
                                        <i class="layui-icon" id="ri" style="color: green;font-weight: bolder;"
                                           hidden></i>
                                    </div>
                                    <!-- 错号 -->
                                    <div class="layui-inline">
                                        <i class="layui-icon" id="wr" style="color: red; font-weight: bolder;"
                                           hidden>ဆ</i>
                                    </div>
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <label class="layui-form-label">密码</label>
                                <!-- 密码 -->

                                <div class="layui-input-block">
                                    <div class="layui-inline" style="width: 85%">
                                        <input type="password" id="pwd" name="upass" required lay-verify="required"
                                               placeholder="请输入密码" autocomplete="off" class="layui-input">
                                    </div>
                                    <!-- 对号 -->
                                    <div class="layui-inline">
                                        <i class="layui-icon" id="pri" style="color: green;font-weight: bolder;"
                                           hidden></i>
                                    </div>
                                    <!-- 错号 -->
                                    <div class="layui-inline">
                                        <i class="layui-icon" id="pwr" style="color: red; font-weight: bolder;"
                                           hidden>ဆ</i>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">确认密码</label>
                                <!-- 确认密码 -->
                                <div class="layui-input-block">
                                    <div class="layui-inline" style="width: 85%">
                                        <input type="password" id="rpwd" name="repassword" required lay-verify="required"
                                               placeholder="请确认密码" autocomplete="off" class="layui-input">
                                    </div>
                                    <!-- 对号 -->
                                    <div class="layui-inline">
                                        <i class="layui-icon" id="rpri" style="color: green;font-weight: bolder;"
                                           hidden></i>
                                    </div>
                                    <!-- 错号 -->
                                    <div class="layui-inline">
                                        <i class="layui-icon" id="rpwr" style="color: red; font-weight: bolder;"
                                           hidden>ဆ</i>
                                    </div>
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <div class="layui-input-block login-btn" style="width: 85%">
                                    <button type="submit" lay-submit lay-filter="sub" class="layui-btn layui-btn-lg">注册</button>
                                </div>
                            </div>
                            <hr style="width: 85%" />
                            <p style="width: 85%"><a href="login.html" class="fl">已有账号？立即登录</a><a href="javascript:;"
                                                                                                  class="fr">忘记密码？</a></p>
                        </form>



                    </div>
                </fieldset>
            </div>
        </div>
    </div>
</div>



<script>
    layui.use(['element', 'form', 'jquery', 'layer'], function () {
        var element = layui.element;
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;

        //监听提交

        form.on('submit(regist)', function (data) {
            layer.msg(JSON.stringify(data.field));
            return false;
        });

        $('#user').blur(function () {
            var user = $(this).val();

            //alert(user);
            $.ajax({
                url:'${pageContext.request.contextPath}/users',
                type: 'post',
                dataType: 'text',
                data: { uname: user },
                //验证用户名是否可用
                success: function (data) {
                    if (data == 0) {
                        $('#ri').removeAttr('hidden');
                        $('#wr').attr('hidden', 'hidden');


                    } else {
                        $('#wr').removeAttr('hidden');
                        $('#ri').attr('hidden', 'hidden');
                        layer.msg('当前用户名已被占用! ')

                    }

                }
            })

        });

        // you code ...
        // 为密码添加正则验证
        $('#pwd').blur(function () {
            var reg = /^[\w]{6,12}$/;
            if (!($('#pwd').val().match(reg))) {
                //layer.msg('请输入合法密码');
                $('#pwr').removeAttr('hidden');
                $('#pri').attr('hidden', 'hidden');
                layer.msg('请输入合法密码');
            } else {
                $('#pri').removeAttr('hidden');
                $('#pwr').attr('hidden', 'hidden');
            }
        });

        //验证两次密码是否一致
        $('#rpwd').blur(function () {
            if ($('#pwd').val() != $('#rpwd').val()) {
                $('#rpwr').removeAttr('hidden');
                $('#rpri').attr('hidden', 'hidden');
                layer.msg('两次输入密码不一致!');
            } else {
                $('#rpri').removeAttr('hidden');
                $('#rpwr').attr('hidden', 'hidden');
            };
        });

        //
        //添加表单监听事件,提交注册信息
        form.on('submit(sub)', function () {
            $.ajax({
                url: '${pageContext.request.contextPath}/register',
                type: 'post',
                dataType: 'text',
                data: {
                    uname: $('#user').val(),
                    upass: $('#pwd').val(),
                },
                success: function (data) {
                    if (data == 1) {
                        layer.msg('注册成功');
                        window.location.href="${pageContext.request.contextPath}/tologin";
                    } else {
                        layer.msg('注册失败');
                    }
                }
            })
            //防止页面跳转
            return false;
        });

    });

</script>
</body>

</html>