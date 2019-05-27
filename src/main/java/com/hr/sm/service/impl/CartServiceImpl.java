package com.hr.sm.service.impl;

import com.hr.sm.entity.Cart;
import com.hr.sm.entity.Product;
import com.hr.sm.mapper.CartMapper;
import com.hr.sm.service.CartService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {
    private CartMapper mapper;

    public CartServiceImpl(CartMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public List<Cart> cartfindAll(int userid) {
        return mapper.cartfindAll(userid);
    }

    @Override
    public Product findByPid(int pid) {
        return mapper.findByPid(pid);
    }

    @Override
    public void cartDelete(int id) {
        mapper.cartDelete(id);
    }

    @Override
    public Cart findbyid(int id) {
        return mapper.findbyid(id);
    }

    @Override
    public void cartAdd(Cart cart) {
        mapper.cartAdd(cart);
    }

    @Override
    public Cart findBoth(int userid, int pid) {
        return mapper.findBoth(userid,pid);
    }

    @Override
    public void cartBoth(int count, int id) {
        mapper.cartBoth(count, id);
    }
}
