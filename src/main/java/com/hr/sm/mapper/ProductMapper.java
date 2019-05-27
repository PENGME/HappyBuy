package com.hr.sm.mapper;

import com.hr.sm.entity.Product;
import com.hr.sm.entity.ProductCategory;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.jdbc.SQL;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

public interface ProductMapper {
    @Select("select * from product limit 8")
    List<Product> findAll();
    @Select("select * from product")
    List<Product> findAll1();

    @Select("select * from product where id=#{id}")
    Product findById(int id);

    //改变库存
    @Update("update product set stock=#{stock} where id=#{id}")
    int ChaStock(@Param("stock")int stock,@Param("id")int id);

    @SelectProvider(type = ProductMapperProvider.class,method = "findCategory")
    List<Product> findByCid(@Param("name")String name, @Param("category")ProductCategory category);

    class ProductMapperProvider{
        public String findCategory(Map map){
            SQL sql=new SQL();
            String name=(String) map.get("name");
            ProductCategory category=(ProductCategory) map.get("category");
            sql.SELECT("*").FROM("product");

            if (!StringUtils.isBlank(name)){
                sql.WHERE("name like #{name}");
            }else{
                if(category.getParent_id()==null){
                    List<ProductCategory> categories = category.getCategories();

                    String str="category_id in(";for (int i = 0; i <categories.size() ; i++) {
                        str+="#{category.categories["+i+"].id}";
                        if(i<categories.size()-1){
                            str+=",";
                        }
                    }
                    str+=")";
                    System.out.println(str);
                    sql.WHERE(str);
                }else {
                    sql.WHERE("category_id=#{category.id}");
                }
            }
            return sql.toString();
        }

        //后台商品
        public String ProFindAll(String dim) {
            String sql = "select * from product ";
            if (!StringUtils.isBlank(dim)) {
                sql += " where name like #{param1}";
            }
            return sql;
        }
    }

    //后台商品
    @Results(id="product_map",value = {
            @Result(property = "productCategory",column = "category_id",one = @One(select = "com.hr.sm.mapper.CategoryMapper.findByid"))
    })
    @SelectProvider(type = ProductMapperProvider.class, method = "ProFindAll")
    List<Product> ProFindAll(String dim);


    @ResultMap("product_map")
    @Select("select * from product where id=#{id}")
    Product ProFindByid(int id);



    @Insert("insert into product values (default,#{name},#{url},#{price},#{stock},#{detail},#{category_id})")
    void  Proadd(Product product);


    @Delete("delete from product where id=#{id}")
    void  Prodelete(int  id);


    @Update("update product set name=#{name},url=#{url},price=#{price},stock=#{stock},detail=#{detail},category_id=#{category_id}  where id=#{id} ")
    void   Proupdate(Product product);


}
