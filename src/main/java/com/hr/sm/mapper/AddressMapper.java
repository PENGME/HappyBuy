package com.hr.sm.mapper;

import com.hr.sm.entity.Address;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface AddressMapper {
    @Select("select * from address where user_Id=#{arg0}")
    List<Address> AddrfindAll(int user_id);

    @Select("select * from address where id=#{id}")
    Address findbyid(int id);

    @Select("select count(*) from address where user_Id=#{arg0}")
    int findCount(int   user_id);


    @Insert("insert into address(contacts,tel,address,user_Id)  values(#{contacts},#{tel},#{address},#{user_Id})")
    void Addrinsert(Address address);

    @Delete("delete from  address  where id=#{id}")
    void Addrdelete(int id);
}
