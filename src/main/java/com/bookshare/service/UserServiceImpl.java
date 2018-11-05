package com.bookshare.service;

import com.bookshare.mapper.UserMapper;
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
}
