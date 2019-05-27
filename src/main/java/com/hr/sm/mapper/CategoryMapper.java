package com.hr.sm.mapper;

import com.hr.sm.entity.ProductCategory;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.jdbc.SQL;

import java.util.List;

public interface CategoryMapper {


    @Results(id = "cateMap",value = {
            @Result(property = "id",column = "id"),
            @Result(property = "categories",column = "id",one =@One(select = "com.hr.sm.mapper.CategoryMapper.findSon"))
    })
    @SelectProvider(type = CategoryMapperProvider.class,method = "findParent")
    List<ProductCategory> findCParent(Integer parent_id);
    @Select("select * from product_category where parent_id=#{id}")
    List<ProductCategory> findSon(int id);

    @ResultMap("cateMap")
    @Select("select * from product_category where id=#{id}")
    ProductCategory findById(int id);

    class CategoryMapperProvider{
        public String findParent(Integer parent_id){
            SQL sql=new SQL();
            sql.SELECT("*").FROM("product_category");
            if(parent_id==null){
                sql.WHERE("parent_id is null");
            }else {
                sql.WHERE("id=#{id}");
            }
            return sql.toString();
        }
    }

    //后台商品分类
    @Results(id="pro_map",value = {
            @Result(column = "id",property = "id"),
            @Result(property = "productCategoryList",column = "id",many = @Many(select = "com.hr.sm.mapper.CategoryMapper.findByParentId")),
            @Result(column = "parent_id",property = "parent_id"),
            @Result(column = "parent_id",property = "productCategory",one =@One(select = "com.hr.sm.mapper.CategoryMapper.findByid"))
    })
    @Select("select * from product_category where id=#{id}")
    ProductCategory findByid(int id);

    @Select("select * from product_category where parent_id=#{parent_id}")
    List<ProductCategory> findByParentId(int parent_id);

    @ResultMap("pro_map")
    @Select("select * from product_category")
    List<ProductCategory> findAll();


    @Insert("insert into product_category values (default,#{name},#{parent_id})")
    void  Pcadd(ProductCategory pc);

    @Delete("delete  from  product_category where id=#{id}")
    void  Pcdelete(int id);

    @Update("update product_category set name=#{name},parent_id=#{parent_id} where id=#{id}")
    void Pcupdate(ProductCategory pc);
}
