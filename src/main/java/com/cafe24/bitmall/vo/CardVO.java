package com.cafe24.bitmall.vo;

public class CardVO {
    private Integer orderNo;
    private String no;
    private String cardBank;
    private String dueDate;
    private Integer password;
    private Integer installment;

    public Integer getOrderNo() {
	return orderNo;
    }

    public void setOrderNo( Integer orderNo ) {
	this.orderNo = orderNo;
    }

    public String getNo() {
	return no;
    }

    public void setNo( String no ) {
	this.no = no;
    }

    public String getCardBank() {
	return cardBank;
    }

    public void setCardBank( String cardBank ) {
	this.cardBank = cardBank;
    }

    public String getDueDate() {
	return dueDate;
    }

    public void setDueDate( String dueDate ) {
	this.dueDate = dueDate;
    }

    public Integer getPassword() {
	return password;
    }

    public void setPassword( Integer password ) {
	this.password = password;
    }

    public Integer getInstallment() {
	return installment;
    }

    public void setInstallment( Integer installment ) {
	this.installment = installment;
    }

    @Override
    public String toString() {
	return "CardVO [orderNo=" + orderNo + ", no=" + no + ", cardBank=" + cardBank + ", dueDate=" + dueDate
		+ ", password=" + password + ", installment=" + installment + "]";
    }
}
