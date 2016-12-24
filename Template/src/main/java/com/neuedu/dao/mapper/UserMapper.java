package com.neuedu.dao.mapper;

import com.neuedu.bean.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2016-12-15.
 */
@Repository
public interface UserMapper {

    public User CheckUser(String userName);
    public List<User> QueryAllUser(User user);
    public User QueryUserById(String id);
    public int ChangeUserInfo(User user);
    public int DeleteUserById(String id);
    public int ChangeMyInfo(User user);
    public List<User>QueryAllUserByType();
    public String QueryIdByUserName(String userName);
    public String QueryUserNameById(String id);

}
