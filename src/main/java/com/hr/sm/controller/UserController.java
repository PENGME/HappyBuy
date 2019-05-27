package com.hr.sm.controller;

import com.github.pagehelper.PageInfo;
import com.hr.sm.entity.*;
import com.hr.sm.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.UUID;

@Controller
public class UserController {
    private UserService userService;
    private CategoryService categoryService;
    private ProductService productService;

    public UserController(UserService userService, CategoryService categoryService, ProductService productService) {
        this.userService = userService;
        this.categoryService = categoryService;
        this.productService = productService;
    }

    @RequestMapping("/")
    public String findAll(ModelMap map,HttpServletRequest request){
        HttpSession session = request.getSession();
        List<ProductCategory> categories = categoryService.findCParent(null);
        List<Product> products = productService.findAll();
        session.setAttribute("categories",categories);
        map.put("products",products);
        return "index";
    }
    @RequestMapping("/tologin")
    public String toLogin(){
        return "login";
    }
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        return "redirect:/";
    }
    @PostMapping("/dologin")
    public String doLogin(String zhang, String pass, String code,HttpServletRequest request,
                          ModelMap map){
        HttpSession session = request.getSession();
        System.out.println(zhang+"  "+pass+"  "+code);
        String yzm = (String) session.getAttribute("yzm");
        User user = userService.findbylogin(zhang, pass);
        if (yzm.equalsIgnoreCase(code)){
            if (user!=null){
                session.setAttribute("user",user);
                return "redirect:/";
            }else {
                map.put("err","*用户名或密码错误");
                map.put("zhang",zhang);
                return "login";
            }
        }else {
            map.put("error","*验证码有误");
            return "login";
        }
    }

    //进入注册页面
    @RequestMapping("/toregister")
    public String toregister(){return "register";}

    //注册
    @PostMapping("/doregister")
    public  String doRegister(String yong, String pass,String newpass ,String code,HttpServletRequest request,
                              ModelMap map){
        HttpSession session = request.getSession();
        // System.out.println(yong+"  "+pass+"  "+code);
        String yzm = (String) session.getAttribute("yzm");
        User user = userService.findlogin(yong);
        if (user==null){
            if (yzm.equalsIgnoreCase(code)){
                System.out.println(pass+"-----"+newpass);
                if (pass.equals(newpass)){
                    int doadd = userService.doreg(yong, pass,0);
                    return "login";
                }else {
                    map.put("error3","*确认密码有误");
                    map.put("yong",yong);
                    return "register";
                }
            }else {
                map.put("error2","*验证码有误");
                return "register";
            }
        }else{
            map.put("error1","*用户名已存在");
            return "register";
        }
    }

    //注册判断用户名是否存在
    @PostMapping("/yongHu")
    public @ResponseBody int yongHu(String login){
        System.out.println("用户名"+login);

        if(userService.findlogin(login)!=null){
            return 1;
        }
        return 0;
    }
    //去个人资料界面
    @RequestMapping("/tomy")
    public  String  tomy(HttpServletRequest request){
        HttpSession session = request.getSession();
        if((User)session.getAttribute("user")!=null){
            return "my";
        }else {
            return "redirect:/tologin";
        }
    }
    //更新个人资料
    @PostMapping("/userupdate")
    public  String userupdate(User user,HttpServletRequest request){
        HttpSession session = request.getSession();
        userService.userupdate(user);

        User user1 = userService.findlogin(user.getLogin());
        session.removeAttribute("user");

        session.setAttribute("user",user1);
        return "redirect:/";
    }


    @PostMapping("/upload")
    @ResponseBody
    public String upload(MultipartFile pic, HttpServletRequest request) throws IOException {

        String path = "/img/users/";

        path = request.getSession().getServletContext().getRealPath(path);

        String name = String.format("%s%s",
                UUID.randomUUID(),
                pic.getOriginalFilename());

        File dir = new File(path);
        if(!dir.exists())
            dir.mkdirs();

        File dest = new File(dir, name);
        pic.transferTo(dest);

        return name;
    }

    //去后台
    @RequestMapping("/toBack")
    public String toBack(){
        return "html/index";
    }

    //后台用户管理
    //后台首页进入后台用户管理查询
    @RequestMapping("/douser")
    public String douser(@RequestParam(required = false,defaultValue = "1")int pageNum,
                         @RequestParam(required = false,defaultValue = "3")int pageSize,
            ModelMap map,@RequestParam(required = false)String login) {
        PageInfo<User> users = userService.findUser(login,pageNum,pageSize);
        map.put("pageInfo", users);
        return "html/user";
    }

    //后台用户管理添加
    @PostMapping("/adduser")
    public String adduser(User user) {
        user.setPwd("123");
        int adduser = userService.addUser(user);
        return "redirect:/douser";
    }

    //后台用户管理修改
    @RequestMapping("/updateuser")
    public  String updateuser(User user){
        int updateuser = userService.updateUser(user);
        System.out.println(updateuser+"-----------------");
        System.out.println(user);
        return "redirect:/douser";
    }

    //后台用户管理id查询
    @RequestMapping("/findbyuser")
    public  String findbyuser(int id,ModelMap map){
        User findbyuser = userService.findByUser(id);
        map.put("use",findbyuser);
        return "html/userxg";
    }

    //后台用户管理删除
    @RequestMapping("/deleteuser")
    public  String deleteuser(int id){
        int deleteuser = userService.deleteUser(id);
        return "redirect:/douser";
    }

    @GetMapping("/dzuser")
    public String dzuser(ModelMap map, String login,HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("utf-8");
        // System.out.println(login);
        User user = userService.findlogin(login);
        map.put("use", user);
        return "html/userxq";
    }
}
