<%--
  Created by IntelliJ IDEA.
  User: lm
  Date: 2018/11/20
  Time: 17:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8" contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
                <legend>图书收藏</legend>
                <div class="layui-field-box">
                    <table class="layui-table">
                        <colgroup>
                            <col width="200">
                            <col width="200">
                            <col width="100">
                            <col >
                            <col width="100">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>封面</th>
                            <th>书名</th>
                            <th>类别</th>
                            <th>描述</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${books}" var="book">
                            <tr>
                                <td>
                                    <div class="layui-row">
                                        <div class="layui-col-md-offset2">
                                            <a href="${pageContext.request.contextPath}/bookinfo?bid=${book.bid}">
                                                <img height="130px" width="100px" src="${book.bpict}">
                                            </a>
                                        </div>
                                    </div>

                                </td>
                                <td>${book.bname}</td>
                                <td>${book.bcate}</td>
                                <td>${book.bdesc}</td>
                                <td><input type="button" value="取消收藏" class="layui-btn layui-btn-lg layui-btn-danger" onclick="delectCollection('${book.bid}')"></td>
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
    var pindex = "${pindex}";//当前页
    function delectCollection(data) {
        $.ajax({
            url:'${pageContext.request.contextPath}/delectcollection?bid='+data,
            data:{

            },
            success: function (data) {
                if(data==1){
                    window.location.href="http://localhost:8080/allcollection?page="+pindex+"&size="+4;//跳转链接
                }else {
                    alert("删除失败");
                }
            }
        })

    }

    // var pcountString= "${pcount}";
    //var psizeString= "${psize}";

    // 当前页

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
            cont:1
            ,elem: 'test1' //注意，这里的 test1 是 ID，不用加 # 号
            , count: ${total}//数据总数，从服务端得到
            ,limit:4
            ,curr:pindex
            , jump: function (obj, first) {
                //obj包含了当前分页的所有参数，比如：
                console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                console.log(obj.limit);//得到每页显示的条数
                //alert("aaa");

                //首次不执行
                if (!first) {

                    window.location.href="http://localhost:8080/allcollection?page="+obj.curr+"&size="+obj.limit;//跳转链接
                }
            }
        });

    });


</script>
</body>

</html>