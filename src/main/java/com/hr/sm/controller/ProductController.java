package com.hr.sm.controller;

import com.github.pagehelper.PageInfo;
import com.hr.sm.entity.Cart;
import com.hr.sm.entity.Product;
import com.hr.sm.entity.ProductCategory;
import com.hr.sm.entity.User;
import com.hr.sm.service.CartService;
import com.hr.sm.service.CategoryService;
import com.hr.sm.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
public class ProductController {
    private ProductService productService;
    private CategoryService categoryService;
    private CartService cartService;

    public ProductController(ProductService productService, CategoryService categoryService, CartService cartService) {
        this.productService = productService;
        this.categoryService = categoryService;
        this.cartService = cartService;
    }

    @RequestMapping("/findProduct")
    public String findProduct(String pname, String cate_id, ModelMap map){
        System.out.println("分类id"+cate_id);
        System.out.println("搜索"+pname);
        ProductCategory category=null;
        List<Product> products = null;
        if (cate_id!=null){
            category = categoryService.findById(Integer.parseInt(cate_id));
        }
        //System.out.println(category.getCategories().size());
        products = productService.findByCid(pname, category);
        if (cate_id!=null&&cate_id.equals("1")){
            products=productService.findAll1();
        }
        map.put("products",products);
        map.put("pCount",products.size());
        map.put("pname",pname);
        return "products";
    }

    @RequestMapping("/findByProduct")
    public String findByProduct(String id,ModelMap map){
        System.out.println("商品id"+id);
        Product product = productService.findById(Integer.parseInt(id));
        map.put("product",product);
        return "product";
    }
    //购物车添加
    @PostMapping("/doCartAdd")
    @ResponseBody
    public void CartAdd(String count,String pid,HttpServletRequest request){
        System.out.println("数量"+count+"pid"+pid);
        HttpSession session = request.getSession();
        User user=(User) session.getAttribute("user");
        if (count!=null&&Integer.parseInt(count)>0){
            Cart both = cartService.findBoth(user.getId(), Integer.parseInt(pid));
            if (both!=null){
                cartService.cartBoth(Integer.parseInt(count)+both.getCount(),both.getId());
            }else {
                Cart cart=new Cart();
                cart.setCount(Integer.parseInt(count));
                cart.setPid(Integer.parseInt(pid));
                cart.setUserid(user.getId());
                cartService.cartAdd(cart);
            }

        }

    }

    //后台商品
    @RequestMapping("/ProFindAll")
    public  String ProFindAll(ModelMap map,@RequestParam(required = false) String dim,
                              @RequestParam(required = false,defaultValue = "1") int pageNum,
                              @RequestParam(required = false,defaultValue = "5") int pageSize){
        PageInfo<Product> products = productService.ProFindAll(dim,pageNum,pageSize);
        List<ProductCategory> plist = categoryService.findAll();
        map.put("plist",plist);
        map.put("products",products);
        map.put("dim",dim);
        return "html/product";
    }

    @PostMapping("/productByParentId")
    public @ResponseBody
    List<ProductCategory> findByParentId(int id){
        return categoryService.findByParentId(id);
    }
    @RequestMapping("/toLook")
    public  @ResponseBody  Product ProFindByid(int id){
        return productService.ProFindByid(id);
    }


    @PostMapping("/Proupload")
    @ResponseBody
    public String upload(MultipartFile pic, HttpServletRequest request) throws IOException {

        String path = "/img/products/";

        path=request.getSession().getServletContext().getRealPath(path);

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


    @PostMapping("/Proadd")
    public  String Proadd(Product product){
        productService.Proadd(product);
        return "redirect:/ProFindAll";
    }

    @RequestMapping("/Prodelete")
    public String Prodelete(int  id){
        productService.Prodelete(id);
        return "redirect:/ProFindAll";
    }

    @RequestMapping(value = "/Proupdate",method = RequestMethod.POST)
    public String Proupdate(Product product){
        productService.Proupdate(product);
        return "redirect:/ProFindAll";
    }
}
