package com.bookshare.mapper;

import com.bookshare.pojo.User;

public interface UserMapper {
    //登录
    String login(String uname,String upass);
    //显示信息
    User userInfo(String uid);
    //注册
    int register(User user);

    //修改信息
    int changeUserInfo(User user);

}
