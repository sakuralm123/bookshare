<%--
  Created by IntelliJ IDEA.
  User: lm
  Date: 2018/11/4
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Welcome to BookShare!</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="../layui/css/layui.css" />
    <script src="../layui/layui.js"></script>
</head>

<!-- <body class="layui-bg-black"> -->

<body>

<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-raw">&nbsp;</div>
        <div class="layui-raw layui-col-space2">
            <div class="layui-col-md2">
                <a href="index.html"><img src="../resouce/img/LOGO.png"></a>
            </div>

            <div class="layui-col-md5">
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
            </div>


        </div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="">发布图书</a>
            </li>
            <li class="layui-nav-item">
                <a href="usercentor.html"><img src="../resouce/img/doge.jpg" class="layui-nav-img">我</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">修改信息</a></dd>
                    <!-- <dd><a href="javascript:;">安全管理</a></dd> -->
                    <dd><a href="javascript:;">退了</a></dd>
                </dl>
            </li>
        </ul>

    </div>

</div>
<div class="layui-raw">
    <div class="layui-col-md8 layui-col-md-offset2">
        <div class="layui-raw layui-col-space10" style="padding:20px">
            <div class="layui-col-md5">
                <fieldset class="layui-elem-field">
                    <legend>封面</legend>
                    <div class="layui-field-box">
                        <img src="${book.bpict}" style="width:300px;height: 320px;">
                    </div>
                </fieldset>
            </div>
            <div class="layui-col-md7" style="padding:30px ">
                <form class="layui-form" action="">
                    <div class="layui-form-item">
                        <label class="layui-form-label">书名</label>

                        <div class="layui-form-mid layui-word-aux">
                            <h1>${boook.bname}</h1>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">类别</label>

                        <div class="layui-form-mid layui-word-aux">${book.bcate}</div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">价格</label>

                        <div class="layui-form-mid layui-word-aux">${book.bprice}</div>
                    </div>

                    <!-- <hr> -->
                    <hr>
                    <div class="layui-form-item" style="margin:10px; padding:20px" >
                        <div class="layui-input-inline">
                            <onclick="collection" class="layui-btn layui-btn-lg">加入收藏</>
                        </div>
                        <div class="layui-input-inline">
                            <a href="http://www.layui.com" class="layui-btn layui-btn-lg   layui-btn-danger">购买</a>
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
        <div class="layui-raw">
            <fieldset class="layui-elem-field">
                <legend>图书描述</legend>
                <div class="layui-field-box">
                    ${book.bdesc}
                </div>
            </fieldset>
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
