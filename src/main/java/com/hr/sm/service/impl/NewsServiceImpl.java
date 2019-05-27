package com.hr.sm.service.impl;

import com.hr.sm.entity.News;
import com.hr.sm.mapper.NewsMapper;
import com.hr.sm.service.NewsService;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {
    private NewsMapper newsMapper;

    public NewsServiceImpl(NewsMapper newsMapper) {
        this.newsMapper = newsMapper;
    }

    @Override
    public List<News> findAll() {
        return newsMapper.findAll();
    }

    @Override
    public int newsadd(News news) {
        news.setCreation_time(new Date());
        System.out.println(news);
        return newsMapper.newsadd(news);
    }

    @Override
    public int newsdelete(int id) {
        return newsMapper.newsdelete(id);
    }

    @Override
    public int newsupdate(News news) {
        return newsMapper.newsupdate(news);
    }

    @Override
    public News findbyId(int id) {
        return newsMapper.findbyId(id);
    }

    @Override
    public News findbyIdxq(int id) {
        return newsMapper.findbyIdxq(id);
    }
}
