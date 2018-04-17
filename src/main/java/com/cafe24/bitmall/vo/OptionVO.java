package com.cafe24.bitmall.vo;

public class OptionVO {
    private Integer no;
    private String name;

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

    @Override
    public String toString() {
	return "OptionVO [no=" + no + ", name=" + name + "]";
    }
}
