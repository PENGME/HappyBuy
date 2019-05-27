package com.hr.sm.service;

import com.github.pagehelper.PageInfo;
import com.hr.sm.entity.Product;
import com.hr.sm.entity.ProductCategory;

import java.util.List;

public interface ProductService {
    List<Product> findAll();
    List<Product> findByCid(String name,ProductCategory category);
    Product findById(int id);
    int ChaStock(int stock,int id);
    List<Product> findAll1();

    //后台商品
    PageInfo<Product> ProFindAll(String dim, int pageNum, int pageSize);
    Product ProFindByid(int id);
    void  Proadd(Product product);
    void  Prodelete(int  id);
    void   Proupdate(Product product);
}
