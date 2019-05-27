package com.hr.sm.entity;


import java.io.Serializable;

public class Address implements Serializable {

  private int id;
  private String contacts;
  private String address;
  private String tel;
  private int user_Id;


  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }


  public String getContacts() {
    return contacts;
  }

  public void setContacts(String contacts) {
    this.contacts = contacts;
  }


  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }


  public String getTel() {
    return tel;
  }

  public void setTel(String tel) {
    this.tel = tel;
  }

  public int getUser_Id() {
    return user_Id;
  }

  public void setUser_Id(int user_Id) {
    this.user_Id = user_Id;
  }

  @Override
  public String toString() {
    return "Address{" +
            "id=" + id +
            ", contacts='" + contacts + '\'' +
            ", address='" + address + '\'' +
            ", tel='" + tel + '\'' +
            ", user_Id=" + user_Id +
            '}';
  }
}
