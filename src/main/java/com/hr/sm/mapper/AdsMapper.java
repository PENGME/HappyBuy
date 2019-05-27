package com.hr.sm.mapper;

import com.hr.sm.entity.Ads;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface AdsMapper {
    //广告查询
    @Select("select * from ads")
    List<Ads> findAll();

    //广告添加
    @Insert("INSERT INTO ads(remark,img,url,target) VALUES(#{remark},#{img},#{url},#{target})")
    int adsadd(Ads ads);

    //广告删除
    @Delete("delete from ads where id=#{id}")
    int adsdelete(int id);

    //广告修改（做修改）
    @Update("update ads set img=#{img},url=#{url},target=#{target},remark=#{remark} where id=#{id}")
    int adsupdate(Ads ads);

    //广告单值查询（去修改）
    @Select("select * from ads where id=#{id}")
    Ads findbyIdads(int id);
}
