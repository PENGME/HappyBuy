package com.hr.sm.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hr.sm.entity.User;
import com.hr.sm.mapper.UserMapper;
import com.hr.sm.service.UserService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    private UserMapper userMapper;

    public UserServiceImpl(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public List<User> findAll() {
        return userMapper.findAll();
    }

    @Override
    public User findbylogin(String login, String pwd) {
        return userMapper.findbylogin(login,pwd);
    }

    @Override
    public User findbyid(int id) {
        return userMapper.findbyid(id);
    }

    @Override
    public int doadd(User user) {
        return userMapper.doadd(user);
    }

    @Override
    public int doreg(String yong, String pass,int isMaster) {
        return userMapper.doreg(yong, pass,isMaster);
    }

    @Override
    public User findlogin(String login) {
        return userMapper.findlogin(login);
    }

    @Override
    public void userupdate(User user) {
        userMapper.userupdate(user);
    }

    //后台用户管理
    @Override
    public PageInfo<User> findUser(String login,int pageNum, int pageSize) {
        Page<User> page=PageHelper.startPage(pageNum, pageSize);
        userMapper.findUser(login);
        return new PageInfo<>(page);
    }

    @Override
    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public int deleteUser(int id) {
        return userMapper.deleteUser(id);
    }

    @Override
    public User findByUser(int id) {
        return userMapper.findByUser(id);
    }

}
