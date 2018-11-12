<%--
  Created by IntelliJ IDEA.
  User: lm
  Date: 2018/11/2
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

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

<body class="layui-bg-black">

<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-raw">&nbsp;</div>
        <div class="layui-raw layui-col-space2">
            <div class="layui-col-md2">
                <img src="../resouce/img/LOGO.png">
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


    </div>

    <div class="layui-raw">
        <div class="layui-col-md12">
            <fieldset class="layui-elem-field">
                <legend>搜索结果</legend>
                <div class="layui-field-box">
                    <table id="booktable">
                    </table>
                </div>
            </fieldset>
        </div>
    </div>

</div>



<script>


    layui.use(['element', 'form', 'table'], function () {
        var element = layui.element;
        var form = layui.form;

        //监听提交
        form.on('submit(fuzzysearch)', function (data) {
            layer.msg(JSON.stringify(data.field));
            return false;
        });



        var table = layui.table;
        table.render({
            elem: '#booktable'
            , height: 312
            , url: 'http://localhost:8080/categorysearch' //数据接口
            , page: true //开启分页
            , cols: [[ //表头
                { field: 'bpict', title: '封面', width: 200, sort: true, fixed: 'left' }
                , { field: 'bname', title: '书名', width: 160 }
                , { field: 'bcate', title: '类别', width: 80, sort: true }
                , { field: 'buid', title: '所有者', width: 160 }
                , { field: 'bdesc', title: '描述', width: 177 }
            ]]
            ,request:{
                page:"page",
                limit:"size"

            }
        });

    });

</script>
</body>

</html>
