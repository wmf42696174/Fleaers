package com.neuedu.service;

import com.neuedu.bean.User;
import com.neuedu.dao.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2016-12-15.
 */
@Service
public class UserService {


    @Autowired
    private UserMapper userMapper;


    public List<User> QueryAllUser(User user){
        return userMapper.QueryAllUser(user);
    }

    public User QueryUserById(String id){
        return userMapper.QueryUserById(id);
    }

    public int ChangeUserInfo(User user){
        return userMapper.ChangeUserInfo(user);
    }

    public int DeleteUserById(String id){
        return userMapper.DeleteUserById(id);
    }
    public int ChangeMyInfo(User user){return userMapper.ChangeMyInfo(user);}
    public List<User>QueryAllUserByType(){return userMapper.QueryAllUserByType();}
    public String QueryIdByUserName(String userName){return userMapper.QueryIdByUserName(userName);}
    public String QueryUserNameById(String id){return userMapper.QueryUserNameById(id);}
}
