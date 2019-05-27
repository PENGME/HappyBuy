package com.hr.sm.controller;

import com.hr.sm.entity.Address;
import com.hr.sm.entity.Cart;
import com.hr.sm.entity.Product;
import com.hr.sm.entity.User;
import com.hr.sm.service.AddressService;
import com.hr.sm.service.CartService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class CartController {
    private AddressService addressService;
    private CartService service;
    public CartController(CartService service, AddressService addressService) {
        this.service = service;
        this.addressService = addressService;
    }



    @RequestMapping("/tocart")
    public  String toCart(String count,String pid,HttpServletRequest request){
        HttpSession session = request.getSession();
        User user=(User) session.getAttribute("user");
        if (user==null){
            return "redirect:/tologin";
        }
        System.out.println("数量"+count+"商品id"+pid+"用户id"+user.getId());
        if (count!=null&&Integer.parseInt(count)>0){
            Cart both = service.findBoth(user.getId(), Integer.parseInt(pid));
            if (both!=null){
                service.cartBoth(Integer.parseInt(count)+both.getCount(),both.getId());
            }else {
                Cart cart=new Cart();
                cart.setCount(Integer.parseInt(count));
                cart.setPid(Integer.parseInt(pid));
                cart.setUserid(user.getId());
                service.cartAdd(cart);
            }

        }
        return "redirect:/cartfindAll";
    }



    //购物车查询所有
    @RequestMapping("/cartfindAll")
    public  String cartfindAll(HttpServletRequest request, ModelMap map){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user==null){
            return "redirect:/tologin";
        }
        List<Cart> carts = service.cartfindAll(user.getId());
        int sum=0;
        for (Cart cart : carts) {
            Product product = service.findByPid(cart.getPid());
            cart.setProduct(product);
            double price = cart.getProduct().getPrice();
            int count = cart.getCount();
            sum+=price*count;
        }
        map.put("sum",sum);
        map.put("carts",carts);
        map.put("count",carts.size());
        return  "cart";
    }

    //购物车删除
    @RequestMapping("/cartDelete")
    public  String  cartDelete(String id){

        service.cartDelete(Integer.parseInt(id));
        return "redirect:/cartfindAll";
    }

    //去确认提交界面
    @PostMapping("/toorder-confirm")
    public  String toorder_confirm(String[] subCheckbox, ModelMap map, HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        List<Cart> carts=new ArrayList<Cart>();
        int sum=0;
        if (subCheckbox.length>0){
            for (int i = 0; i <subCheckbox.length ; i++) {
                Cart cart = service.findbyid(Integer.parseInt(subCheckbox[i]));
                cart.setProduct(service.findByPid(cart.getPid()));
                double price = cart.getProduct().getPrice();
                int count = cart.getCount();
                sum+=price*count;
                carts.add(cart);
            }
            List<Address> addr = addressService.AddrfindAll(user.getId());
            int count = addressService.findCount(user.getId());
            session.setAttribute("count1",count);
            session.setAttribute("addr",addr);
            session.setAttribute("sum1",sum);
            session.setAttribute("carts1",carts);
            return "order-confirm";
        }else {
            return "redirect:/cartfindAll";
        }

    }



}
