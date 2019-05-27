package com.hr.sm.mapper;

import com.hr.sm.entity.OrderDetail;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface DetailMapper {
    @Select("select * from order_detail where order_id=#{order_id}")
    List<OrderDetail> findOrderId(String orderid);
}
