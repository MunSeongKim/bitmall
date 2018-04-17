package com.cafe24.bitmall.vo;

public class OrderVO {
    // -- order table
    private Integer no;
    private String orderName;
    private String orderTel;
    private String orderPhone;
    private String orderEmail;
    private String orderZipcode;
    private String orderAddress;
    private String rcvName;
    private String rcvTel;
    private String rcvPhone;
    private String rcvEmail;
    private String rcvZipcode;
    private String rcvAddress;
    private String require;
    private String payType;
    private String state;
    private Integer totPrice;
    private String regDate;
    private String userId;

    public Integer getNo() {
	return no;
    }

    public void setNo( Integer no ) {
	this.no = no;
    }

    public String getOrderName() {
	return orderName;
    }

    public void setOrderName( String orderName ) {
	this.orderName = orderName;
    }

    public String getOrderTel() {
	return orderTel;
    }

    public void setOrderTel( String orderTel ) {
	this.orderTel = orderTel;
    }

    public String getOrderPhone() {
	return orderPhone;
    }

    public void setOrderPhone( String orderPhone ) {
	this.orderPhone = orderPhone;
    }

    public String getOrderEmail() {
	return orderEmail;
    }

    public void setOrderEmail( String orderEmail ) {
	this.orderEmail = orderEmail;
    }

    public String getOrderAddress() {
	return orderAddress;
    }

    public void setOrderAddress( String orderAddress ) {
	this.orderAddress = orderAddress;
    }

    public String getRcvName() {
	return rcvName;
    }

    public void setRcvName( String rcvName ) {
	this.rcvName = rcvName;
    }

    public String getRcvTel() {
	return rcvTel;
    }

    public void setRcvTel( String rcvTel ) {
	this.rcvTel = rcvTel;
    }

    public String getRcvPhone() {
	return rcvPhone;
    }

    public void setRcvPhone( String rcvPhone ) {
	this.rcvPhone = rcvPhone;
    }

    public String getRcvEmail() {
	return rcvEmail;
    }

    public void setRcvEmail( String rcvEmail ) {
	this.rcvEmail = rcvEmail;
    }

    public String getRcvAddress() {
	return rcvAddress;
    }

    public void setRcvAddress( String rcvAddress ) {
	this.rcvAddress = rcvAddress;
    }

    public String getRequire() {
	return require;
    }

    public void setRequire( String require ) {
	this.require = require;
    }

    public String getPayType() {
	return payType;
    }

    public void setPayType( String payType ) {
	this.payType = payType;
    }

    public String getState() {
	return state;
    }

    public void setState( String state ) {
	this.state = state;
    }

    public Integer getTotPrice() {
        return totPrice;
    }

    public void setTotPrice( Integer totPrice ) {
        this.totPrice = totPrice;
    }

    public String getRegDate() {
	return regDate;
    }

    public void setRegDate( String regDate ) {
	this.regDate = regDate;
    }

    public String getUserId() {
	return userId;
    }

    public void setUserId( String userId ) {
	this.userId = userId;
    }

    public String getOrderZipcode() {
	return orderZipcode;
    }

    public void setOrderZipcode( String orderZipcode ) {
	this.orderZipcode = orderZipcode;
    }

    public String getRcvZipcode() {
	return rcvZipcode;
    }

    public void setRcvZipcode( String rcvZipcode ) {
	this.rcvZipcode = rcvZipcode;
    }

    @Override
    public String toString() {
	return "OrderVO [no=" + no + ", orderName=" + orderName + ", orderTel=" + orderTel + ", orderPhone="
		+ orderPhone + ", orderEmail=" + orderEmail + ", orderZipcode=" + orderZipcode + ", orderAddress="
		+ orderAddress + ", rcvName=" + rcvName + ", rcvTel=" + rcvTel + ", rcvPhone=" + rcvPhone
		+ ", rcvEmail=" + rcvEmail + ", rcvZipcode=" + rcvZipcode + ", rcvAddress=" + rcvAddress + ", require="
		+ require + ", payType=" + payType + ", state=" + state + ", totPrice=" + totPrice + ", regDate="
		+ regDate + ", userId=" + userId + "]";
    }

}
