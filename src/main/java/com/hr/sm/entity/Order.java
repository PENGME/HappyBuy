package com.hr.sm.entity;


import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Order implements Serializable {

  private String id;
  private String user_name;
  private String address;
  private java.util.Date creation_time;
  private String tel;
  private double total_amount;
  private int status;
  private int user_id;
  private int valid;
  private List<OrderDetail> details;

  public Order() {
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getUser_name() {
    return user_name;
  }

  public void setUser_name(String user_name) {
    this.user_name = user_name;
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

  public int getStatus() {
    return status;
  }

  public void setStatus(int status) {
    this.status = status;
  }

  public int getUser_id() {
    return user_id;
  }

  public void setUser_id(int user_id) {
    this.user_id = user_id;
  }

  public int getValid() {
    return valid;
  }

  public void setValid(int valid) {
    this.valid = valid;
  }

  public java.util.Date getCreation_time() {
    return creation_time;
  }

  public void setCreation_time(Date creation_time) {
    this.creation_time = creation_time;
  }

  public double getTotal_amount() {
    return total_amount;
  }

  public void setTotal_amount(double total_amount) {
    this.total_amount = total_amount;
  }


  public List<OrderDetail> getDetails() {
    return details;
  }

  public void setDetails(List<OrderDetail> details) {
    this.details = details;
  }
}
