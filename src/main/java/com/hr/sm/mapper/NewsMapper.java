package com.hr.sm.mapper;

import com.hr.sm.entity.News;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface NewsMapper {
    @Select("select * from news")
    List<News> findAll();
    @Insert("INSERT INTO NEWS (title,content,creation_time) VALUES(#{title},#{content},#{creation_time})")
    int newsadd(News news);

    @Delete("delete from news where id=#{id}")
    int newsdelete(int id);
    @Update("update news set title=#{title},content=#{content} where id=#{id}")
    int newsupdate(News news);
    @Select("select * from news where id=#{id}")
    News findbyId(int id);
    @Select("select * from news where id=#{id}")
    News findbyIdxq(int id);
}
