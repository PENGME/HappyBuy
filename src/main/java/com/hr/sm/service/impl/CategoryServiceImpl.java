package com.hr.sm.service.impl;

import com.hr.sm.entity.ProductCategory;
import com.hr.sm.mapper.CategoryMapper;
import com.hr.sm.service.CategoryService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {
    private CategoryMapper mapper;

    public CategoryServiceImpl(CategoryMapper mapper) {
        this.mapper = mapper;
    }


    @Override
    public List<ProductCategory> findCParent(Integer parent_id) {
        return mapper.findCParent(parent_id);
    }

    @Override
    public ProductCategory findById(int id) {
        return mapper.findById(id);
    }

    //后台商品分类
    @Override
    public List<ProductCategory> findByParentId(int parent_Id) {
        return mapper.findByParentId(parent_Id);
    }

    @Override
    public List<ProductCategory> findAll() {
        return mapper.findAll();
    }

    @Override
    public void Pcadd(ProductCategory pc) {
        mapper.Pcadd(pc);
    }

    @Override
    public void Pcdelete(int id) {
        mapper.Pcdelete(id);
    }

    @Override
    public void Pcupdate(ProductCategory pc) {
        mapper.Pcupdate(pc);
    }
}
