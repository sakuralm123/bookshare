package com.bookshare.controller;

import com.bookshare.pojo.User;
import com.bookshare.service.UserService;
import com.bookshare.utils.UUIDUtils;
import com.bookshare.utils.UploadUtils;
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

    @RequestMapping("/userinfo")
    public String userInfo(Model model,HttpServletRequest request){
        String uid= (String) request.getSession().getAttribute("uid");
        if (uid==null){
            return "login";
        }
        User user=userService.userInfo(uid);
        model.addAttribute("user",user);
        return "userinfo";
    }

    @RequestMapping("/register")
    public String register(Model model,HttpServletRequest request){
        User user=new User();
        String newpath= UploadUtils.uploadForm("user",user,request);
        user.setUid(UUIDUtils.getUUID());
        user.setUvavat(newpath);
        int flag=userService.register(user);
        if (flag==1){
            model.addAttribute("result","注册成功");
        }else{
            model.addAttribute("result","注册失败");
        }
        //返回到登录页面
        return "login";
    }

    @RequestMapping("/changeUserInfo")
    public String changeUserInfo(Model model,HttpServletRequest request){
        User user=new User();
        String uid= (String) request.getSession().getAttribute("uid");
        String newpath= UploadUtils.uploadForm("user",user,request);
        user.setUvavat(newpath);
        user.setUid(uid);
        int flag=userService.changeUserInfo(user);
        if (flag==1){
            model.addAttribute("result","注册成功");
        }else{
            model.addAttribute("result","注册失败");
        }
        return "userinfo";
    }
}
