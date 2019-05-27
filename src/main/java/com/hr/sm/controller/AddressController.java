package com.hr.sm.controller;

import com.hr.sm.entity.Address;
import com.hr.sm.entity.User;
import com.hr.sm.service.AddressService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AddressController {
    private AddressService service;

    public AddressController(AddressService service) {
        this.service = service;
    }


    //收货地址查询所有
    @RequestMapping("/AddrfindAll")
    public  String  AddrfindAll(HttpServletRequest request , ModelMap map){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        List<Address> addresses = service.AddrfindAll(user.getId());
        System.out.println(addresses);
        int count = service.findCount(user.getId());
        map.put("count",count);
        map.put("addresses",addresses);
        return  "address";
    }

    //新增收货地址
    @PostMapping("/Addrinsert")
    public  String  Addrinsert(Address address, ModelMap map,HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Object carts1 = session.getAttribute("carts1");
        service.Addrinsert(address);
        if(carts1!=null){
            List<Address> addr = service.AddrfindAll(user.getId());
            session.removeAttribute("addr");
            session.setAttribute("addr",addr);
            return "order-confirm";
        }
        return  "redirect:/AddrfindAll";

    }

    //删除收货地址
    @RequestMapping("/Addrdelete")
    public  String Addrdelete(int id, ModelMap map){
        service.Addrdelete(id);
        return  "redirect:/AddrfindAll";
    }

    //去收货地址界面
    @RequestMapping("/toaddress")
    public  String  toaddress(){
        return "address";
    }

}
