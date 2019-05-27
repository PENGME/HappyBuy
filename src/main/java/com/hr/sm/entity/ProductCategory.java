package com.hr.sm.entity;


import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class ProductCategory implements Serializable {

  private int id;
  private String name;
  private Integer parent_id;
  private List<ProductCategory> categories=new ArrayList<ProductCategory>();
  private ProductCategory productCategory;
  private List<ProductCategory> productCategoryList=new ArrayList<>();

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Integer getParent_id() {
    return parent_id;
  }

  public void setParent_id(Integer parent_id) {
    this.parent_id = parent_id;
  }

  public List<ProductCategory> getCategories() {
    return categories;
  }

  public void setCategories(List<ProductCategory> categories) {
    this.categories = categories;
  }

  public ProductCategory getProductCategory() {
    return productCategory;
  }

  public void setProductCategory(ProductCategory productCategory) {
    this.productCategory = productCategory;
  }

  public List<ProductCategory> getProductCategoryList() {
    return productCategoryList;
  }

  public void setProductCategoryList(List<ProductCategory> productCategoryList) {
    this.productCategoryList = productCategoryList;
  }
}
