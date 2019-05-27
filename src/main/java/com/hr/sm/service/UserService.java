package com.hr.sm.service;

import com.github.pagehelper.PageInfo;
import com.hr.sm.entity.User;

import java.util.List;

public interface UserService {
    List<User> findAll();
    User findbylogin(String login,String pwd);
    User findbyid(int id);
    int doadd(User user);
    int doreg(String yong ,String pass,int isMaster);
    User findlogin(String login);

    //修改个人资料
    void userupdate(User user);

    //后台用户管理
    PageInfo<User> findUser(String login,int pageNum, int pageSize);
    int addUser(User user);
    int updateUser(User user);
    int deleteUser(int id);
    User findByUser(int id);
}
