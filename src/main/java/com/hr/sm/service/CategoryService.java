package com.hr.sm.service;

import com.hr.sm.entity.ProductCategory;

import java.util.List;

public interface CategoryService {
    List<ProductCategory> findCParent(Integer parent_id);
    ProductCategory findById(int id);

    //后台商品分类
    List<ProductCategory> findByParentId(int parent_Id);
    List<ProductCategory> findAll();
    void  Pcadd(ProductCategory pc);
    void  Pcdelete(int id);
    void Pcupdate(ProductCategory pc);

}
