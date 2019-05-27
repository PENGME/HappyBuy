package com.hr.sm.entity;


import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {

  private int id;
  private String login;
  private String name;
  private String pwd;
  private String sex;
  private String phone;
  private String photo;
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date birthday;
  private int isMaster;


  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }


  public String getLogin() {
    return login;
  }

  public void setLogin(String login) {
    this.login = login;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getPwd() {
    return pwd;
  }

  public void setPwd(String pwd) {
    this.pwd = pwd;
  }


  public String getSex() {
    return sex;
  }

  public void setSex(String sex) {
    this.sex = sex;
  }


  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }


  public String getPhoto() {
    return photo;
  }

  public void setPhoto(String photo) {
    this.photo = photo;
  }


  public Date getBirthday() {
    return birthday;
  }

  public void setBirthday(Date birthday) {
    this.birthday = birthday;
  }


  public int getIsMaster() {
    return isMaster;
  }

  public void setIsMaster(int isMaster) {
    this.isMaster = isMaster;
  }

}
