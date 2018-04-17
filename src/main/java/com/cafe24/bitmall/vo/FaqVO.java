package com.cafe24.bitmall.vo;

public class FaqVO {
    private Integer no;
    private String title;
    private String content;

    public Integer getNo() {
	return no;
    }

    public void setNo( Integer no ) {
	this.no = no;
    }

    public String getTitle() {
	return title;
    }

    public void setTitle( String title ) {
	this.title = title;
    }

    public String getContent() {
	return content;
    }

    public void setContent( String content ) {
	this.content = content;
    }

    @Override
    public String toString() {
	return "FaqVO [no=" + no + ", title=" + title + ", content=" + content + "]";
    }

}
