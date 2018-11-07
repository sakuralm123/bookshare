package com.bookshare.service;

import com.bookshare.mapper.UserMapper;
import com.bookshare.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserMapper userMapper;
    @Override
    public String login(String uname, String upass) {
        return userMapper.login(uname,upass);
    }

    @Override
    public User userInfo(String uid) {
        return userMapper.userInfo(uid);
    }

    @Override
    public int register(User user) {
        return userMapper.register(user);
    }

    @Override
    public int changeUserInfo(User user) {
        return userMapper.changeUserInfo(user);
    }
}
