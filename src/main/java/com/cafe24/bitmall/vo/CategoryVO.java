package com.cafe24.bitmall.vo;

public class CategoryVO {
    private Integer no;
    private String name;
    private String imagePath;

    public Integer getNo() {
	return no;
    }

    public void setNo( Integer no ) {
	this.no = no;
    }

    public String getName() {
	return name;
    }

    public void setName( String name ) {
	this.name = name;
    }

    public String getImagePath() {
	return imagePath;
    }

    public void setImagePath( String imagePath ) {
	this.imagePath = imagePath;
    }

    @Override
    public String toString() {
	return "CategoryVO [no=" + no + ", name=" + name + ", imagePath=" + imagePath + "]";
    }
}
