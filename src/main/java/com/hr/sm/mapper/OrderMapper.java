package com.hr.sm.mapper;

import com.hr.sm.entity.Order;
import com.hr.sm.entity.OrderDetail;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface OrderMapper {
    //分页
    @Results(id = "orderMap",value = {
            @Result(property = "id",column = "id"),
            @Result(property = "details",column = "id",one = @One(select = "com.hr.sm.mapper.DetailMapper.findOrderId"))
    })
    @Select("SELECT *From `order` where valid=1")
    List<Order> findPage();

    @Select("SELECT *From `order` where valid=1")
    List<Order> findAll();
    @Select("SELECT *From `order` where valid=1 and user_id=#{user_id}")
    List<Order> findbyUser(int userId);
    @Select("select * from order_detail where order_id=#{order_id}")
    List<OrderDetail> findbyOrderid(String orderid);
    @Update("update `order` set valid=0 where id=#{id}")
    int dodelete(String id);
    @Update("update `order` set status=3 where id=#{id}")
    int doRecive(String id);
    @Insert("INSERT INTO `order` VALUES (#{id}, #{user_name}, #{address}, #{creation_time}, #{tel}, #{total_amount}, #{status}, #{user_id}, #{valid});")
    int doSaveOrder(Order order);
    @Insert("INSERT INTO `order_detail`(product_name, product_price, product_count, order_id, product_id) VALUES (#{product_name}, #{product_price}, #{product_count}, #{order_id}, #{product_id});")
    int doSaveDetail(OrderDetail orderDetail);

    //后台订单
    @Update("update `order` set status=#{status} where id=#{id}")
    int changeStatus(@Param("status") int status,@Param("id")String id);
}
