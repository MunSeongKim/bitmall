package com.cafe24.bitmall.vo;

public class CartVO {
    private String userId;
    private String productCode;
    private Integer suboptionNo;
    private Integer amount;
    private String regDate;

    public String getUserId() {
	return userId;
    }

    public void setUserId( String userId ) {
	this.userId = userId;
    }

    public String getProductCode() {
	return productCode;
    }

    public void setProductCode( String productCode ) {
	this.productCode = productCode;
    }

    public Integer getSuboptionNo() {
        return suboptionNo;
    }

    public void setSuboptionNo( Integer suboptionNo ) {
        this.suboptionNo = suboptionNo;
    }

    public Integer getAmount() {
	return amount;
    }

    public void setAmount( Integer amount ) {
	this.amount = amount;
    }

    public String getRegDate() {
	return regDate;
    }

    public void setRegDate( String regDate ) {
	this.regDate = regDate;
    }

    @Override
    public String toString() {
	return "CartVO [userId=" + userId + ", productCode=" + productCode + ", suboptionNo=" + suboptionNo
		+ ", amount=" + amount + ", regDate=" + regDate + "]";
    }

}
