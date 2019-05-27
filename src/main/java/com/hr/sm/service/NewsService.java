package com.hr.sm.service;

import com.hr.sm.entity.News;

import java.util.List;

public interface NewsService {
    List<News> findAll();
    int newsadd(News news);
    int newsdelete(int id);
    int newsupdate(News news);
    News findbyId(int id);
    News findbyIdxq(int id);
}
