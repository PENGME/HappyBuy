package com.hr.sm.controller;

import com.hr.sm.entity.ProductCategory;
import com.hr.sm.service.CategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class CategoryController {
    private CategoryService categoryService;

    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    //后台分类管理
    @RequestMapping("/ProCateFindAll")
    public  String ProCateFindAll(ModelMap map){
        List<ProductCategory> procatelist = categoryService.findAll();
        map.put("procatelist",procatelist);
        return "html/product-category";
    }

    @PostMapping("/Pcadd")
    public  String Pcadd(ProductCategory pc){
        categoryService.Pcadd(pc);
        return "redirect:/ProCateFindAll";
    }


    @RequestMapping("/Pcdelete")
    public  String Pcdelete(int  id){
        categoryService.Pcdelete(id);
        return "redirect:/ProCateFindAll";
    }

    @PostMapping("/Pcupdate")
    public  String Pcupdate(ProductCategory pc){
        categoryService.Pcupdate(pc);
        return "redirect:/ProCateFindAll";
    }
}
