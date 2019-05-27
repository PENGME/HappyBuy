package com.hr.sm.mapper;

import com.hr.sm.entity.User;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.jdbc.SQL;
import org.springframework.stereotype.Service;

import java.util.List;

public interface UserMapper {
    @Select("select * from user")
    List<User> findAll();
    @Select("select * from user where login=#{login} and pwd=#{pwd}")
    User findbylogin(@Param("login")String login, @Param("pwd")String pwd);
    @Select("select * from user where id=#{id}")
    User findbyid(int id);
    @Insert("INSERT INTO user VALUES (#{id}, #{login}, #{name}, #{pwd}, #{sex}, #{phone}, #{photo}, #{birthday}, #{isMaster})")
    int doadd(User user);
    @Insert("INSERT INTO user(login,pwd,isMaster) VALUES ( #{arg0}, #{arg1},#{arg2})")
    int doreg(String yong ,String pass,int isMaster);
    @Select("select * from user where login=#{login}")
    User findlogin(String login);

    //修改个人资料
    @UpdateProvider(type = UserMapperProvider.class,method = "update")
    void userupdate(User user);

//    @Select("select * from  user where login=#{login}")
//    User findByid(String login);

    class  UserMapperProvider{
        public String update(final User user){
            return new SQL(){
                {
                    UPDATE("user");
                    if(user.getName()!=""){
                        SET("name=#{name}");
                    }
                    if(user.getPwd()!=""){
                        SET("pwd=#{pwd}");
                    }
                    if(user.getSex()!= ""){
                        SET("sex=#{sex}");
                    }
                    if(user.getBirthday()!= null){
                        SET("birthday=#{birthday}");
                    }
                    if(user.getPhone()!= ""){
                        SET("phone=#{phone}");
                    }
                    if(user.getPhoto()!= ""){
                        SET("photo=#{photo}");
                    }
                    WHERE("login=#{login}");
                }
            }.toString();
        }
        //后台用户查询
        public String findUser(String login){
            String sql="select * from user where 1=1";
            if (!StringUtils.isBlank(login)){
                sql+=" and login like #{login}";
            }
            return sql;
        }
    }

    //后台用户管理
    @SelectProvider(type = UserMapperProvider.class,method = "findUser")
    List<User> findUser(String login);
    @Insert("insert into user values(null,#{login},#{name},#{pwd},#{sex},#{phone},#{photo},#{birthday},#{isMaster})")
    int addUser(User user);
    @Update("update user set name=#{name},sex=#{sex},photo=#{photo},birthday=#{birthday},isMaster=#{isMaster} where id=#{id}")
    int updateUser(User user);
    @Delete("delete from user where id=#{id}")
    int deleteUser(int id);
    @Select("select * from user where id=#{id}")
    User findByUser(int id);
}
