package com.cafe24.bitmall.vo;

public class AccountVO {
    private Integer orderNo;
    private String accountBank;
    private String name;

    public Integer getOrderNo() {
	return orderNo;
    }

    public void setOrderNo( Integer orderNo ) {
	this.orderNo = orderNo;
    }

    public String getAccountBank() {
	return accountBank;
    }

    public void setAccountBank( String accountBank ) {
	this.accountBank = accountBank;
    }

    public String getName() {
	return name;
    }

    public void setName( String name ) {
	this.name = name;
    }

    @Override
    public String toString() {
	return "AccountVO [orderNo=" + orderNo + ", accountBank=" + accountBank + ", name=" + name + "]";
    }

}
