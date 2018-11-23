<%--
  Created by IntelliJ IDEA.
  User: lm
  Date: 2018/11/22
  Time: 9:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8" contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

            <div class="layui-col-md5">
                <div class="layui-raw">
                    <form class="layui-form" action="${pageContext.request.contextPath}/fuzzysearch">
                        <div class="layui-raw">
                            <div class="layui-col-md9">
                                <div class="layui-input-block">
                                    <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="搜索图书" class="layui-input layui-bg-black">
                                </div>
                            </div>
                            <div class="layui-col-md3">
                                <div class="layui-form-item">
                                    <div class="layui-input-inline ">
                                        <%--<button class="layui-btn layui-bg-black" lay-submit="" lay-filter="fuzzysearch"><i class="layui-icon layui-icon-search"></i></button>--%>
                                        <input type="submit" class="layui-btn layui-bg-black" value="搜索">
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
    <hr>
    <div class="layui-raw layui-col-space10">
        <!--轮播-->
        <div class="layui-col-md3">
            <div class="layui-collapse" lay-accordion>
                <div class="layui-colla-item">
                    <h2 class="layui-colla-title">
              <span class="layui-breadcrumb">
                <a href="${pageContext.request.contextPath}/categorysearch?bcate=0">小说</a>
              </span>
                    </h2>
                </div>
                <div class="layui-colla-item">
                    <h2 class="layui-colla-title">
              <span class="layui-breadcrumb">
                <a href="${pageContext.request.contextPath}/categorysearch?bcate=1">计算机</a>

              </span>
                    </h2>
                </div>
                <div class="layui-colla-item">
                    <h2 class="layui-colla-title">
              <span class="layui-breadcrumb">
                <a href="${pageContext.request.contextPath}/categorysearch?bcate=2">文法</a>

              </span>
                    </h2>
                </div>
                <div class="layui-colla-item">
                    <h2 class="layui-colla-title">
              <span class="layui-breadcrumb">
                <a href="${pageContext.request.contextPath}/categorysearch?bcate=3">物理</a>

              </span>
                    </h2>
                </div>
                <div class="layui-colla-item">
                    <h2 class="layui-colla-title">
              <span class="layui-breadcrumb">
                <a href="${pageContext.request.contextPath}/categorysearch?bcate=4">化学</a>
                <
              </span>
                    </h2>
                </div>

            </div>

        </div>
        <div class="layui-col-md8">
            <div class="layui-carousel" id="test1">
                <div carousel-item>
                    <c:forEach items="${turnBook}" var="book">

                        <div>
                            <a href="${pageContext.request.contextPath}/bookinfo?bid=${book.bid}">
                                <img height=100% width="100%" src="${book.bpict}" alt="hi">
                            </a>
                        </div>
                    </c:forEach>


                </div>
            </div>
        </div>

    </div>



    <div class="layui-raw">
        <div class="layui-col-md12">
            <fieldset class="layui-elem-field layui-field-title ">
                <legend>图书导航</legend>
                <div class="layui-field-box">
                    <div class="layui-raw ">
                        <fieldset class="layui-elem-field layui-bg-black">
                            <legend>柴犬</legend>
                            <div class="layui-field-box">

                                    <c:forEach items="${books}" var="book">
                                        <div class="layui-col-md2">
                                            <div class="layui-card">
                                                <div class="layui-card-body ">
                                                    <a href="${pageContext.request.contextPath}/bookinfo?bid=${book.bid}">
                                                        <img src="${book.bpict}" height="250px" width="100%">
                                                    </a>
                                                </div>
                                                <div class="layui-card-header">${book.bname}</div>
                                            </div>
                                        </div>
                                    </c:forEach>

                                </div>
                        </fieldset>

                    </div>
                </div>
            </fieldset>
        </div>
    </div>

</div>

<script>

    layui.use(['element', 'form', 'carousel'], function () {
        var element = layui.element;
        var form = layui.form;

        /*//监听提交
        form.on('submit(fuzzysearch)', function (data) {
            layer.msg(JSON.stringify(data.field));
            return false;
        });*/

        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1'
            , width: '100%' //设置容器宽度
            , arrow: 'always' //始终显示箭头
            //,anim: 'updown' //切换动画方式
            , height: '388px'
        });
    });

</script>
</body>

</html>

