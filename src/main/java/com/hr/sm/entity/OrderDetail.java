package com.hr.sm.entity;


import java.io.Serializable;

public class OrderDetail implements Serializable {

  private int id;
  private String product_name;
  private double product_price;
  private int product_count;
  private String order_id;
  private int product_id;

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getProduct_name() {
    return product_name;
  }

  public void setProduct_name(String product_name) {
    this.product_name = product_name;
  }

  public double getProduct_price() {
    return product_price;
  }

  public void setProduct_price(double product_price) {
    this.product_price = product_price;
  }

  public int getProduct_count() {
    return product_count;
  }

  public void setProduct_count(int product_count) {
    this.product_count = product_count;
  }

  public String getOrder_id() {
    return order_id;
  }

  public void setOrder_id(String order_id) {
    this.order_id = order_id;
  }

  public int getProduct_id() {
    return product_id;
  }

  public void setProduct_id(int product_id) {
    this.product_id = product_id;
  }
}
