<%--
  Created by IntelliJ IDEA.
  User: lm
  Date: 2018/11/22
  Time: 6:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8"%>

<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Welcome to BookShare!</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="../layui/css/layui.css" />
    <script src="../layui/layui.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
</head>

<body class="layui-bg-black">

<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-raw">&nbsp;</div>
        <div class="layui-raw layui-col-space2">
            <div class="layui-col-md2">
                <img src="/user/LOGO.png">
            </div>

            <%--<div class="layui-col-md5">
                <div class="layui-raw">
                    <form class="layui-form" action="">
                        <div class="layui-raw">
                            <div class="layui-col-md9">
                                <div class="layui-input-block">
                                    <input type="text" name="title" lay-verify="title" autocomplete="off"
                                           placeholder="搜索图书" class="layui-input layui-bg-black">
                                </div>
                            </div>
                            <div class="layui-col-md3">
                                <div class="layui-form-item">
                                    <div class="layui-input-inline ">
                                        <button class="layui-btn layui-bg-black" lay-submit="" lay-filter="fuzzysearch"><i
                                                class="layui-icon layui-icon-search"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </form>
                </div>
            </div>--%>


        </div>


    </div>


    <div class="layui-raw">
        <div class="layui-col-md6 layui-col-md-offset3" style="padding:50px">
            <div>
                <fieldset class="layui-elem-field"  style="padding:30px">
                    <legend>登录</legend>
                    <div class="layui-field-box">
                        <form class="layui-form"  action="${pageContext.request.contextPath}/login" method="post">
                            <div class="layui-form-item" style="margin:20px">
                                <label class="layui-form-label">账号</label>
                                <div class="layui-input-block">
                                    <input type="text" name="uname" required lay-verify="required" placeholder="请输入账号"
                                           autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item" style="margin:20px">
                                <label class="layui-form-label">密码</label>
                                <div class="layui-input-block">
                                    <input type="password" name="upass" required lay-verify="required"
                                           placeholder="请输入密码" autocomplete="off" class="layui-input">
                                </div>

                            </div>

                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <input type="submit" class="layui-btn layui-btn-lg" lay-submit lay-filter="login" value="登录"/>
                                    <a href="${pageContext.request.contextPath}/beforregister" class="layui-btn layui-btn-lg layui-btn-primary">注册</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </fieldset>
            </div>
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

        /*form.on('submit(login)', function (data) {
            $.ajax({
                url:'${pageContext.request.contextPath}/login',
                data:data.field,
                dataType:'text',
                type:'post',
                async:false,
                success:function (data) {
                    if (data == 1){
                        window.location.href="${pageContext.request.contextPath}/index";//跳转链接
                    }else{
                        layer.msg('登录名或密码错误');
                    }
                }
            })
        });*/

    });

</script>
</body>

</html>