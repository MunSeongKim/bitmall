package com.cafe24.bitmall.vo;

public class OrderProductVO {
    private Integer orderNo;
    private String productCode;
    private Integer amount;
    private Integer suboptionNo;

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo( Integer orderNo ) {
        this.orderNo = orderNo;
    }

    public String getProductCode() {
	return productCode;
    }

    public void setProductCode( String productCode ) {
	this.productCode = productCode;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount( Integer amount ) {
        this.amount = amount;
    }

    public Integer getSuboptionNo() {
	return suboptionNo;
    }

    public void setSuboptionNo( Integer suboptionNo ) {
	this.suboptionNo = suboptionNo;
    }

    @Override
    public String toString() {
	return "OrderProductVO [orderNo=" + orderNo + ", productCode=" + productCode + ", amount=" + amount
		+ ", suboptionNo=" + suboptionNo + "]";
    }
}
