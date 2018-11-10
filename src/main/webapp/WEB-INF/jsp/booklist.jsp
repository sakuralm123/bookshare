<%--
  Created by IntelliJ IDEA.
  User: lm
  Date: 2018/11/9
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Welcome to BookShare!</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="/layui/css/layui.css" />
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
    <script src="/layui/layui.js"></script>
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
                    <table class="layui-table">
                        <colgroup>
                            <col width="200">
                            <col width="200">
                            <col width="100">
                            <col width="150">
                            <col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>封面</th>
                            <th>书名</th>
                            <th>类别</th>
                            <th>所有者</th>
                            <th>描述</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${books}" var="book">
                            <tr>
                                <td>
                                    <div class="layui-row">
                                        <div class="layui-col-md-offset2">
                                            <a href="${pageContext.request.contextPath }/bookinfo?bid=${book.bid}">
                                                <img height="130px" width="100px" src="${book.bpict}">
                                            </a>
                                        </div>
                                    </div>

                                </td>
                                <td>${book.bname}</td>
                                <td>${book.bcate}</td>
                                <td>炫酷狗者</td>
                                <td>${book.bdesc}</td>
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
            , count: ${total} //数据总数，从服务端得到
            , jump: function (obj, first) {
                //obj包含了当前分页的所有参数，比如：
                console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                console.log(obj.limit); //得到每页显示的条数

                //首次不执行
                if (!first) {
                     do something
                     $.ajax({
                        type: "post",
                        url: "bookList",
                       async: false,
                        dataType: 'json',
                         data: {
                            "page": 2,
                             "size": 2
                         },
                        success: showList
                     });
                }
            }
        });

    });

</script>
</body>

</html>
