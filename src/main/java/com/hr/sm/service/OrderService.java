package com.hr.sm.service;

import com.github.pagehelper.PageInfo;
import com.hr.sm.entity.Order;
import com.hr.sm.entity.OrderDetail;
import java.util.List;

public interface OrderService {
    List<Order> findAll();
    List<OrderDetail> findbyOrderid(String orderid);
    int dodelete(String id);
    int doRecive(String id);
    List<Order> findbyUser(int userId);
    int doSaveOrder(Order order);
    int doSaveDetail(OrderDetail orderDetail);

    //分页
    PageInfo<Order> findPage(int pageNum, int pageSize);

    //后台订单
    int changeStatus(int status, String id);
}
