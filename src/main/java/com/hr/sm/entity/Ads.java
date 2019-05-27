package com.hr.sm.entity;

import java.io.Serializable;

public class Ads  implements Serializable {
    //编号
    private  int id;
    //标题
    private  String title;
    //描述
    private  String remark;
    //图片
    private  String img;
    //路径
    private  String url;
    //目标
    private  String target;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    @Override
    public String toString() {
        return "Ads{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", remark='" + remark + '\'' +
                ", img='" + img + '\'' +
                ", url='" + url + '\'' +
                ", target='" + target + '\'' +
                '}';
    }
}
