package com.cafe24.bitmall.vo;

public class ProductVO {
    private String code;
    private String name;
    private String maker;
    private Integer price;
    private String description;
    private String state;
    private Boolean newItem;
    private Boolean hitItem;
    private Boolean saleItem;
    private Integer discount;
    private String imagePath1;
    private String imagePath2;
    private String imagePath3;
    private String regDate;
    private Integer categoryNo;
    private Integer optionNo;

    public String getCode() {
	return code;
    }

    public void setCode( String code ) {
	this.code = code;
    }

    public String getName() {
	return name;
    }

    public void setName( String name ) {
	this.name = name;
    }

    public String getMaker() {
	return maker;
    }

    public void setMaker( String maker ) {
	this.maker = maker;
    }

    public Integer getPrice() {
	return price;
    }

    public void setPrice( Integer price ) {
	this.price = price;
    }

    public String getDescription() {
	return description;
    }

    public void setDescription( String description ) {
	this.description = description;
    }

    public String getState() {
	return state;
    }

    public void setState( String state ) {
	this.state = state;
    }

    public Boolean getNewItem() {
	return newItem;
    }

    public void setNewItem( Boolean newItem ) {
	this.newItem = newItem;
    }

    public Boolean getHitItem() {
	return hitItem;
    }

    public void setHitItem( Boolean hitItem ) {
	this.hitItem = hitItem;
    }

    public Boolean getSaleItem() {
	return saleItem;
    }

    public void setSaleItem( Boolean saleItem ) {
	this.saleItem = saleItem;
    }

    public Integer getDiscount() {
	return discount;
    }

    public void setDiscount( Integer discount ) {
	this.discount = discount;
    }

    public String getImagePath1() {
	return imagePath1;
    }

    public void setImagePath1( String imagePath1 ) {
	this.imagePath1 = imagePath1;
    }

    public String getImagePath2() {
	return imagePath2;
    }

    public void setImagePath2( String imagePath2 ) {
	this.imagePath2 = imagePath2;
    }

    public String getImagePath3() {
	return imagePath3;
    }

    public void setImagePath3( String imagePath3 ) {
	this.imagePath3 = imagePath3;
    }

    public String getRegDate() {
	return regDate;
    }

    public void setRegDate( String regDate ) {
	this.regDate = regDate;
    }

    public Integer getCategoryNo() {
	return categoryNo;
    }

    public void setCategoryNo( Integer categoryNo ) {
	this.categoryNo = categoryNo;
    }

    public Integer getOptionNo() {
	return optionNo;
    }

    public void setOptionNo( Integer optionNo ) {
	this.optionNo = optionNo;
    }

    @Override
    public String toString() {
	return "ProductVO [code=" + code + ", name=" + name + ", maker=" + maker + ", price=" + price + ", description="
		+ description + ", state=" + state + ", newItem=" + newItem + ", hitItem=" + hitItem + ", saleItem="
		+ saleItem + ", discount=" + discount + ", imagePath1=" + imagePath1 + ", imagePath2=" + imagePath2
		+ ", imagePath3=" + imagePath3 + ", regDate=" + regDate + ", categoryNo=" + categoryNo + ", optionNo="
		+ optionNo + "]";
    }
}
