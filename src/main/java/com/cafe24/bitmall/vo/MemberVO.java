package com.cafe24.bitmall.vo;

public class MemberVO {
    private String id;
    private String password;
    private String name;
    private String birth;
    private String tel;
    private String phone;
    private String zipcode;
    private String address;
    private String email;
    private String classify;
    private String regDate;

    public String getId() {
	return id;
    }

    public void setId( String id ) {
	this.id = id;
    }

    public String getPassword() {
	return password;
    }

    public void setPassword( String password ) {
	this.password = password;
    }

    public String getName() {
	return name;
    }

    public void setName( String name ) {
	this.name = name;
    }

    public String getBirth() {
	return birth;
    }

    public void setBirth( String birth ) {
	this.birth = birth;
    }

    public String getTel() {
	return tel;
    }

    public void setTel( String tel ) {
	this.tel = tel;
    }

    public String getPhone() {
	return phone;
    }

    public void setPhone( String phone ) {
	this.phone = phone;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode( String zipcode ) {
        this.zipcode = zipcode;
    }

    public String getAddress() {
	return address;
    }

    public void setAddress( String address ) {
	this.address = address;
    }

    public String getEmail() {
	return email;
    }

    public void setEmail( String email ) {
	this.email = email;
    }

    public String getClassify() {
	return classify;
    }

    public void setClassify( String classify ) {
	this.classify = classify;
    }

    public String getRegDate() {
        return regDate;
    }

    public void setRegDate( String regDate ) {
        this.regDate = regDate;
    }

    @Override
    public String toString() {
	return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", birth=" + birth + ", tel=" + tel
		+ ", phone=" + phone + ", zipcode=" + zipcode + ", address=" + address + ", email=" + email
		+ ", classify=" + classify + ", regDate=" + regDate + "]";
    }

}
