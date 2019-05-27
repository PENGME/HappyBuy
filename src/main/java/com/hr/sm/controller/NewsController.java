package com.hr.sm.controller;

import com.hr.sm.entity.News;
import com.hr.sm.service.NewsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class NewsController {
    private NewsService newsService;

    public NewsController(NewsService newsService) {
        this.newsService = newsService;
    }

    //后台首页进入新闻管理页面查询
    @RequestMapping("/news")
    public String news(ModelMap map){
        List<News> news = newsService.findAll();
        map.put("news",news);
        return "html/news";
    }

    //后台首页进入新闻管理页面添加
    @RequestMapping("/newsadd")
    public  String newsadd(News news){
        System.out.println(news);
        int newsadd = newsService.newsadd(news);
        return "redirect:/news";
    }

    //后台首页进入新闻管理页面删除
    @RequestMapping("/newsdelete")
    public  String newsdelete(int id){
        int newsdelete = newsService.newsdelete(id);
        return "redirect:/news";
    }

    //后台首页进入新闻管理页面修改
    @RequestMapping("/newsupdate")
    public  String newsupdate(News news){
        int newsupdate = newsService.newsupdate(news);
        return "redirect:/news";
    }

    //后台首页进入新闻管理页面修改的单值查询
    @RequestMapping("/findbyId")
    public  String findbyId(int id , ModelMap map){
        News news = newsService.findbyId(id);
        map.put("n",news);
        return "html/newsxg";
    }

    //后台首页进入新闻管理页面详情查询
    @RequestMapping("/findbyIdxq")
    public  String findbyIdxq(int id , ModelMap map){
        News news = newsService.findbyIdxq(id);
        map.put("n",news);
        return "html/newsxq";
    }
}
