<%--
  Created by IntelliJ IDEA.
  User: lm
  Date: 2018/11/5
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible">
    <title>图书上传</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="../layui/css/layui.css" />
    <link rel="stylesheet" type="text/css" href="../css/index.css" />
    <script src="../layui/layui.js"></script>
</head>

<body>



<div class="layui-raw" style="margin:30px">
    <div class="layui-col-md8 layui-col-md-offset2">
        <fieldset class="layui-elem-field layui-field-title item_div">
            <legend>上传图书</legend>
            <div class="layui-field-box layui-raw">

                <div class=" layui-col-md6">
                    <form class="layui-form" action="${pageContext.request.contextPath}/upload">
                        <div class="layui-form-item">
                            <label class="layui-form-label">书名</label>
                            <div class="layui-input-block">
                                <input type="text" name="bname" required lay-verify="required" placeholder="请输入标题"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <!-- <div class="layui-form-item">
                                        <label class="layui-form-label">密码框</label>
                                        <div class="layui-input-inline">
                                            <input type="password" name="password" required lay-verify="required" placeholder="请输入密码"
                                                autocomplete="off" class="layui-input">
                                        </div>
                                        <div class="layui-form-mid layui-word-aux">辅助文字</div>
                                    </div> -->
                        <div class="layui-form-item">
                            <label class="layui-form-label">类别</label>
                            <div class="layui-input-inline">
                                <select name="bcate" lay-verify="required">
                                    <option value=""></option>
                                    <option value="0">小说</option>
                                    <option value="1">计算机</option>
                                    <option value="2">文法</option>
                                    <option value="3">物理</option>
                                    <option value="4">化学</option>
                                </select>
                            </div>

                        </div>
                        <div class="layui-form-item">
                            <div class=" layui-input-block">
                                <button type="button" class="layui-btn" id="bpict">
                                    <i class="layui-icon ">&#xe67c;</i>上传图片
                                </button>
                            </div>
                        </div>

                        <!-- <div class="layui-form-item">
                                        <label class="layui-form-label">单选框</label>
                                        <div class="layui-input-block">
                                            <input type="radio" name="sex" value="男" title="男">
                                            <input type="radio" name="sex" value="女" title="女" checked>
                                        </div>
                                    </div> -->
                        <div class="layui-form-item layui-form-text">
                            <label class="layui-form-label">图书描述</label>
                            <div class="layui-input-block">
                                <textarea name="bdesc" placeholder="请输入内容" class="layui-textarea"></textarea>
                            </div>
                        </div>

                        <div class="layui-form-item" style="margin:30px">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit lay-filter="bookupload">立即提交</button>
                            </div>
                        </div>
                    </form>

                    <script>
                        //Demo
                        layui.use(['form', 'upload'], function () {
                            var form = layui.form;

                            //监听提交
                            form.on('submit(bookupload)', function (data) {
                                layer.msg(JSON.stringify(data.field));
                                return false;
                            });

                            var upload = layui.upload;

                            //执行实例
                            var uploadInst = upload.render({
                                elem: '#bpict' //绑定元素
                                , url: '/upload/' //上传接口
                                , done: function (res) {
                                    //上传完毕回调
                                }
                                , error: function () {
                                    //请求异常回调
                                }
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
