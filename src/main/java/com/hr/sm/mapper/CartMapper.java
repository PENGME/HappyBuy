package com.hr.sm.mapper;

import com.hr.sm.entity.Cart;
import com.hr.sm.entity.Product;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface CartMapper {


    @Select("select * from cart where userid=#{userid}")
    List<Cart> cartfindAll(int userid);

    @Select("select * from product where id=#{pid}")
    Product findByPid(int pid);

    //查看购物是否存在相同记录
    @Select("select * from cart where userid=#{userid} and pid=#{pid}")
    Cart findBoth(@Param("userid")int userid, @Param("pid")int pid);

    @Delete("delete from cart where id=#{id}")
    void  cartDelete(int id);

    @Select("select * from cart where  id=#{id}")
    Cart findbyid(int id);

    @Insert("INSERT INTO `cart`(pid,count,userid) VALUES (#{pid},#{count},#{userid})")
    void cartAdd(Cart cart);

    @Update("update cart set count=#{count} where id=#{id}")
    void cartBoth(@Param("count")int count,@Param("id")int id);
}
