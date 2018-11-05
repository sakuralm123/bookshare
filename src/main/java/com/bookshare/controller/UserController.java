package com.bookshare.controller;

import com.bookshare.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(Model model, HttpServletResponse response, HttpServletRequest request){
        String uname=request.getParameter("uname");
        String upass=request.getParameter("upass");
        //根据uid是否为空来判断用户名和密码是否匹配
        String uid=userService.login(uname,upass);
        if(uid!=null&&uid!=""){
            model.addAttribute("result","登录成功");
            //将用户名添加到session
            request.getSession().setAttribute("uid",uid);
        }else{
            model.addAttribute("result","用户名或密码错误");
        }
        return "login";
    }
}
