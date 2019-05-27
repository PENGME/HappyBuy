package com.hr.sm.service;

import com.hr.sm.entity.Cart;
import com.hr.sm.entity.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartService {
    List<Cart> cartfindAll(int userid);
    Product findByPid(int pid);
    void  cartDelete(int id);
    Cart findbyid(int id);
    void cartAdd(Cart cart);
    Cart findBoth(int userid, int pid);
    void cartBoth(int count,int id);
}
