package com.bookshare.service;

import com.bookshare.pojo.User;
import org.springframework.stereotype.Service;

@Service
public interface UserService {
    String login(String uname,String upass);
    User userInfo(String uid);
    int register(User user);
    int changeUserInfo(User user);

    int users(String uname);
}
