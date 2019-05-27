package com.hr.sm.controller;

import com.github.pagehelper.PageInfo;
import com.hr.sm.entity.*;
import com.hr.sm.service.AddressService;
import com.hr.sm.service.CartService;
import com.hr.sm.service.OrderService;
import com.hr.sm.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class OrderController {

    private OrderService orderService;
    private CartService cartService;
    private AddressService addressService;
    private ProductService productService;

    public OrderController(OrderService orderService, CartService cartService, AddressService addressService, ProductService productService) {
        this.orderService = orderService;
        this.cartService = cartService;
        this.addressService = addressService;
        this.productService = productService;
    }
    @RequestMapping("/mygou")
    public String findOrder(ModelMap map, HttpServletRequest request){
        User user=(User)request.getSession().getAttribute("user");
        List<Order> orders=null;
        if (user==null){
            return "redirect:/tologin";
        }else{
            orders = orderService.findbyUser(user.getId());
        }
        for (Order order : orders) {
            List<OrderDetail> orderDetails = orderService.findbyOrderid(order.getId());
            order.setDetails(orderDetails);
        }

        map.put("orders",orders);
        map.put("mysize",orders.size());
        return "order";
    }
    @RequestMapping("/order_delete")
    public String dodelete(String id){
        int i = orderService.dodelete(id);
        System.out.println("受影响行数"+i);
        return "redirect:/mygou";
    }
    @RequestMapping("/order_recive")
    public String doRecive(String id){
        int i = orderService.doRecive(id);
        System.out.println("受影响行数"+i);
        return "redirect:/mygou";
    }
    @PostMapping("/order_submit")
    public String doSave(String amount,String addr,HttpServletRequest request){
        System.out.println("总计"+amount+"add对象id"+addr);
        HttpSession session = request.getSession();
        User user=(User) session.getAttribute("user");
        List<Cart> carts=(List<Cart>)session.getAttribute("carts1");
        Address address = addressService.findbyid(Integer.parseInt(addr));
        Order order=new Order();
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String dateNowStr = sdf.format(d);
        order.setId(dateNowStr+ UUID.randomUUID().toString().replaceAll("-",""));
        order.setAddress(address.getAddress());
        order.setTel(address.getTel());
        order.setUser_id(user.getId());
        order.setUser_name(user.getName());
        order.setCreation_time(new Date());
        order.setTotal_amount(Double.parseDouble(amount));
        order.setStatus(0);
        order.setValid(1);
        orderService.doSaveOrder(order);
        for (Cart cart : carts) {
            Product product = cartService.findByPid(cart.getPid());

            OrderDetail detail=new OrderDetail();
            detail.setProduct_id(product.getId());
            detail.setProduct_name(product.getName());
            detail.setProduct_count(cart.getCount());
            detail.setProduct_price(product.getPrice());
            detail.setOrder_id(order.getId());
            orderService.doSaveDetail(detail);
        }
        for (Cart cart : carts) {
            Product product = cartService.findByPid(cart.getPid());
            int i = productService.ChaStock(product.getStock()-cart.getCount(), product.getId());

        }
        for (Cart cart : carts) {
            cartService.cartDelete(cart.getId());
        }
        return "redirect:/mygou";
    }
    //后台订单管理
    @RequestMapping("/toBackOrder")
    public String toBackOrder(@RequestParam(required = false,defaultValue = "1")int pageNum,
                              @RequestParam(required = false,defaultValue = "3")int pageSize,
                              ModelMap map){
        PageInfo<Order> orders = orderService.findPage(pageNum, pageSize);
        map.put("pageInfo",orders);
        return "html/order";
    }

    //后台订单状态修改
    @RequestMapping("/ChaStatus")
    public String chaStatus(String status,String id){
        System.out.println("状态"+status+"id"+id);
        int i = orderService.changeStatus(Integer.parseInt(status),id);
        System.out.println("受影响行数"+i);
        return "redirect:/toBackOrder";
    }
}
