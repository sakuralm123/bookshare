package com.bookshare.controller;

import com.bookshare.pojo.User;
import com.bookshare.service.UserService;
import com.bookshare.utils.UUIDUtils;
import com.bookshare.utils.UploadUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

@Controller
@SessionAttributes(value ={"uid"})
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/login")

    public void  login(Model model, HttpServletResponse response, HttpServletRequest request,HttpSession session) throws IOException {

        request.setCharacterEncoding("UTF-8");
        String uname=request.getParameter("uname");
        System.out.println(uname);
        String upass=request.getParameter("upass");
        System.out.println(upass);
        //根据uid是否为空来判断用户名和密码是否匹配
        String uid=userService.login(uname,upass);
        System.out.println(uid);
        if(uid!=null&&uid!=""){
            model.addAttribute("result","登录成功");
            //将用户名添加到session
            //session.setAttribute("uids",uid);
            //System.out.println(session.getId());
            model.addAttribute("uid",uid);
              response.sendRedirect("/index");

        }else{
            response.sendRedirect("/tologin");
        }

    }

    @RequestMapping("/userinfo")
    public String userInfo(Model model,HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String uid= (String) session.getAttribute("uid");
        if (uid==null){
            return "login";
        }

        User user=userService.userInfo(uid);
        System.out.println(user);
        model.addAttribute("user",user);
        return "userinfo";
    }

    @RequestMapping("/register")
    @ResponseBody
    public int register(Model model,HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        User user=new User();
        //String newpath= UploadUtils.uploadForm("user",user,request);
        user.setUid(UUIDUtils.getUUID());
        //user.setUvavat(newpath);
        user.setUpass(request.getParameter("upass"));
        user.setUname(request.getParameter("uname"));
        user.setUvavat("/user/images.jpg");
        user.setUconn("#");
        System.out.println(user);
        int flag=userService.register(user);
        /*if (flag==1){
            model.addAttribute("result","注册成功");
        }else{
            model.addAttribute("result","注册失败");
        }
        //返回到登录页面
        return "login";*/

        return flag;
    }

    @RequestMapping("/changeuserinfo")

    public void changeUserInfo(Model model,HttpServletRequest request,HttpSession session,HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        System.out.println("changwuserinfo");
        User user=new User();
        String uid= (String)session.getAttribute("uid");
       String newpath= UploadUtils.uploadForm("user",user,request);
        String[] strings=newpath.split("/");
        newpath="/user/"+strings[strings.length-1];
        user.setUid(uid);
        int flag=userService.changeUserInfo(user);
        response.sendRedirect("/userinfo");
    }


    /**
     * 判断用户名是否存在
     * @param request
     * @return
     */
    @RequestMapping("/users")
    @ResponseBody
    public int users(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String uname=request.getParameter("uname");
        int flag=userService.users(uname);
        return flag;
    }
    @RequestMapping("/var")
    public String var(){
        System.out.println("here");
        return "userupdate";
    }

    @RequestMapping("/beforregister")
    public String beforregister(){
        return "register";
    }

    @RequestMapping("tologin")
    public String tologin(){
        return "login";
    }
}
