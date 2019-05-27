package com.hr.sm.controller;

import com.hr.sm.entity.Ads;
import com.hr.sm.service.AdsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
public class AdsController {
    private AdsService adsService;

    public AdsController(AdsService adsService) {
        this.adsService = adsService;
    }

    //后台首页进入广告管理页面查询
    @RequestMapping("/ads")
    public String ads(ModelMap map){
        List<Ads> ads = adsService.findAll();
        map.put("ads",ads);
        return "html/ads";
    }

    @RequestMapping("/adsadd")
    public  String adsadd(Ads ads){
        System.out.println(ads);
        int adsadd = adsService.adsadd(ads);
        return "redirect:/ads";
    }

    @RequestMapping("/adsdelete")
    public  String adsdelete(int id){
        int adsdelete = adsService.adsdelete(id);
        return "redirect:/ads";
    }

    @RequestMapping("/adsupdate")
    public  String adsupdate(Ads ads){
        int adsupdate = adsService.adsupdate(ads);
        return "redirect:/ads";
    }

    @RequestMapping("/findbyIdads")
    public String findbyIdads(int id ,ModelMap map){
        Ads ads = adsService.findbyIdads(id);
        map.put("ads",ads);
        return "html/adsxg";
    }

    /*-------------------文件上传(图片加入)-----------------------------*/
    @RequestMapping("/upimg")
    @ResponseBody
    public String upload(MultipartFile pic, HttpServletRequest request) throws IOException {
        //上传的图片保存在当前网站中的img目录下
        String path = "/img/slides/";
        path = request.getSession().getServletContext().getRealPath(path);
        //request.getSession().getServletContext().getRealPath();
        String name = String.format("%s%s",
                UUID.randomUUID(),
                pic.getOriginalFilename());

        File dir = new File(path);
        if (!dir.exists())
            dir.mkdirs();

        File dest = new File(dir, name);
        pic.transferTo(dest);

        return name;
    }
}
