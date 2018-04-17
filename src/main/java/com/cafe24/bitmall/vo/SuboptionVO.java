package com.cafe24.bitmall.vo;

public class SuboptionVO {
    private Integer no;
    private String name;
    private Integer optionNo;

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

    public Integer getOptionNo() {
	return optionNo;
    }

    public void setOptionNo( Integer optionNo ) {
	this.optionNo = optionNo;
    }

    @Override
    public String toString() {
	return "SuboptionVO [no=" + no + ", name=" + name + ", optionNo=" + optionNo + "]";
    }
}
