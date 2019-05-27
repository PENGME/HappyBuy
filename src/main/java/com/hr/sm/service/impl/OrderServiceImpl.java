package com.hr.sm.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hr.sm.entity.Order;
import com.hr.sm.entity.OrderDetail;
import com.hr.sm.mapper.OrderMapper;
import com.hr.sm.service.OrderService;
import org.springframework.stereotype.Service;

import java.util.EmptyStackException;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    private OrderMapper orderMapper;

    public OrderServiceImpl(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    @Override
    public List<Order> findAll() {
        return orderMapper.findAll();
    }

    @Override
    public List<OrderDetail> findbyOrderid(String orderid) {
        return orderMapper.findbyOrderid(orderid);
    }

    @Override
    public int dodelete(String id) {
        return orderMapper.dodelete(id);
    }

    @Override
    public int doRecive(String id) {
        return orderMapper.doRecive(id);
    }

    @Override
    public List<Order> findbyUser(int userId) {
        return orderMapper.findbyUser(userId);
    }

    @Override
    public int doSaveOrder(Order order) {
        return orderMapper.doSaveOrder(order);
    }

    @Override
    public int doSaveDetail(OrderDetail orderDetail) {
        return orderMapper.doSaveDetail(orderDetail);
    }

    @Override
    public PageInfo<Order> findPage(int pageNum, int pageSize){
        Page<Order> page = PageHelper.startPage(pageNum, pageSize);
        orderMapper.findPage();
        return new PageInfo<>(page);
    }

    @Override
    public int changeStatus(int status, String id) {
        return orderMapper.changeStatus(status, id);
    }

}
