package com.hr.sm.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hr.sm.entity.Product;
import com.hr.sm.entity.ProductCategory;
import com.hr.sm.mapper.ProductMapper;
import com.hr.sm.service.ProductService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    private ProductMapper mapper;

    public ProductServiceImpl(ProductMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public List<Product> findAll() {
        return mapper.findAll();
    }

    @Override
    public List<Product> findByCid(String name, ProductCategory category) {
        if(!StringUtils.isBlank(name)){
            name='%'+name+'%';
        }
        return mapper.findByCid(name,category);
    }

    @Override
    public Product findById(int id) {

        return mapper.findById(id);
    }

    @Override
    public int ChaStock(int stock, int id) {
        return mapper.ChaStock(stock, id);
    }

    @Override
    public List<Product> findAll1() {
        return mapper.findAll1();
    }

    //后台商品
    @Override
    public PageInfo<Product> ProFindAll(String dim, int pageNum, int pageSize) {
        if(!StringUtils.isBlank(dim)){
            dim='%'+dim+'%';
        }
        Page<Product> page = PageHelper.startPage(pageNum, pageSize);
        mapper.ProFindAll(dim) ;
        PageInfo<Product> pageInfo=new PageInfo<>(page);
        return pageInfo;
    }

    @Override
    public Product ProFindByid(int id) {
        return mapper.ProFindByid(id);
    }

    @Override
    public void Proadd(Product product) {
        mapper.Proadd(product);
    }

    @Override
    public void Prodelete(int id) {
        mapper.Prodelete(id);
    }

    @Override
    public void Proupdate(Product product) {
        mapper.Proupdate(product);
    }
}
