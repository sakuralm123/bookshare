<%--
  Created by IntelliJ IDEA.
  User: lm
  Date: 2018/11/22
  Time: 22:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8"  contentType="text/html;charset=UTF-8" language="java" %>
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

<!-- <body class="layui-bg-black"> -->

<body>

<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-raw">&nbsp;</div>
        <div class="layui-raw layui-col-space2">
            <div class="layui-col-md2">
                <a href="index.html"><img src="/user/LOGO.png"></a>
            </div>

           <%-- <div class="layui-col-md5">
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


        </div>--%>
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item">
                    <a href="${pageContext.request.contextPath}/beforlogin"><span id="login"><% String uid= (String) session.getAttribute("uid");
                        if (uid==null){
                            out.print("登录");
                        }%></span></a>
                </li>
                <!-- <li class="layui-nav-item">
                  <a href="bookupload.html">发布图书</a>
                </li> -->
                <li class="layui-nav-item">
                    <a href="${pageContext.request.contextPath}/beforusercentor"><%
                        if (uid!=null){
                            out.print("个人中心");
                        }%></a>
                    <dl class="layui-nav-child">
                        <%--<dd><a href="userupdate.jsp">修改信息</a></dd>--%>
                        <!-- <dd><a href="javascript:;">安全管理</a></dd> -->
                        <dd><a href="javascript:;">退了</a></dd>
                    </dl>
                </li>
            </ul>

    </div>

</div>


<div class="layui-raw">
    <div class="layui-col-md8 layui-col-md-offset2">

        <fieldset class="layui-elem-field">
            <legend>订单详情</legend>
            <div class="layui-field-box" style="height:500px">
                <div class="layui-raw layui-col-space10" style="padding:20px;margin: 10px">
                    <div class="layui-col-md5">
                        <fieldset class="layui-elem-field">
                            <legend>封面</legend>
                            <div class="layui-field-box">
                                <img src="${order.obpict}" style="width:300px;height: 320px;">
                            </div>
                        </fieldset>
                    </div>
                    <div class="layui-col-md7" style="height: 366px; padding:30px;">
                        <form class="layui-form" action="">
                            <div class="layui-form-item">
                                <label class="layui-form-label">书名</label>

                                <div class="layui-form-mid layui-word-aux">
                                    <h1>${order.obname}</h1>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">价格</label>

                                <div class="layui-form-mid layui-word-aux">${order.obprice}</div>
                            </div>


                            <hr>
                            <div class="layui-form-item">
                                <label class="layui-form-label">买家</label>

                                <div class="layui-form-mid layui-word-aux">${order.ouid}</div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">卖家</label>

                                <div class="layui-form-mid layui-word-aux">${order.obuid}</div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">交易时间</label>

                                <div class="layui-form-mid layui-word-aux">${order.otime}</div>
                            </div>
                            <hr>
                            <div class="layui-form-item" style=" padding:30px">
                                <div class="layui-input-inline">
                                    <a class="layui-btn layui-btn-lg layui-btn-danger" href="${pageContext.request.contextPath}/sureorder?oid=${order.oid}">确定购买</a>
                                </div>
                                <div class="layui-input-inline">
                                    <button class="layui-btn layui-btn-lg  layui-btn-primary" onclick="purchase();">取消</button>
                                </div>
                            </div>

                        </form>

                        <script>
                            //Demo
                            layui.use('form', function () {
                                var form = layui.form;

                                //监听提交
                                // form.on('submit(formDemo)', function (data) {
                                //     layer.msg(JSON.stringify(data.field));
                                //     return false;
                                // });
                            });
                        </script>
                    </div>

                </div>

                <!-- <div class="layui-raw" style="margin:30px">
                    <div class="layui-col-md12">
                        <fieldset class="layui-elem-field">
                            <legend>图书描述</legend>
                            <div class="layui-field-box">
                                钱多人傻戴，
                                美帝良心想，
                                宗教信仰果，
                                神船保平安。
                            </div>
                        </fieldset>
                    </div>

                </div> -->
            </div>
        </fieldset>

    </div>
</div>




<script>
    layui.use(['element', 'form', 'layer'], function () {
        var element = layui.element;
        var form = layui.form;
        var layer = layui.layer;
        //监听提交
        form.on('submit(fuzzysearch)', function (data) {
            layer.msg(JSON.stringify(data.field));
            return false;
        });

        $ = layui.jquery;

        /*$(document).on('click', '#purchase-btn', function () {
            $.post("url", { suggest: txt }, function () {
                layer.msg("购买");
            });
        });
    });
*/






</script>
</body>

</html>
