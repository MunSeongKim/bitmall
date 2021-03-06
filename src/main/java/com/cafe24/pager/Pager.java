package com.cafe24.pager;

import java.util.Map;

public class Pager {
    /**
     *   startPageNumber - 한 화면의 시작 페이지 번호
     *     endPageNumber - 한 화면의 끝 페이지 번호
     *     leftNavigator - 왼쪽 페이지 리스트 네비게이션 유/무
     *    rightNavigator - 오른쪽 페이지 리스트 네비게이션 유/무
     *         postCount - 한 화면의 출력할 게시글 수
     *         pageCount - 한 화면의 출력할 페이지 개수
     *    totalPageCount - 전체 게시글의 개수
     * currentPageNumber - 현재 페이지 번호
     *   startLimitIndex - SELECT Query의 LIMIT 시작 번호
     *         numerable - readCount()를 구현한 Repository 객체
     */

    private int startPageNumber;
    private int endPageNumber;
    private boolean leftNavigator;
    private boolean rightNavigator;
    private int startPostNumber;
    private int postCount;
    private int pageCount;
    private int totalPageCount;
    private int currentPageNumber;
    private int startLimitIndex;
    private Numerable numerable;

    public Pager() {
	this.startPageNumber = 1;
	this.endPageNumber = 5;
	this.leftNavigator = false;
	this.postCount = 5;
	this.pageCount = 5;
	this.currentPageNumber = 1;
    }
    
    public Pager(int start, int end, int postCount, int pageCount) {
	this.startPageNumber = start;
	this.endPageNumber = end;
	this.leftNavigator = false;
	this.postCount = postCount;
	this.pageCount = pageCount;
	this.currentPageNumber = 1;
    }

    public int getStartPageNumber() {
	return startPageNumber;
    }

    public void setStartPageNumber( int startPageNumber ) {
	this.startPageNumber = startPageNumber;
    }

    public int getEndPageNumber() {
	return endPageNumber;
    }

    public void setEndPageNumber( int endPageNumber ) {
	this.endPageNumber = endPageNumber;
    }

    public boolean isLeftNavigator() {
	return leftNavigator;
    }

    public void setLeftNavigator( boolean leftNavigator ) {
	this.leftNavigator = leftNavigator;
    }

    public boolean isRightNavigator() {
	return rightNavigator;
    }

    public void setRightNavigator( boolean rightNavigator ) {
	this.rightNavigator = rightNavigator;
    }

    public int getStartPostNumber() {
	return startPostNumber;
    }

    public void setStartPostNumber( int startPostNumber ) {
	this.startPostNumber = startPostNumber;
    }

    public int getPostCount() {
	return postCount;
    }

    public void setPostCount( int postCount ) {
	this.postCount = postCount;
    }

    public int getPageCount() {
	return pageCount;
    }

    public void setPageCount( int pageCount ) {
	this.pageCount = pageCount;
    }

    public int getTotalPageCount() {
	return totalPageCount;
    }

    public void setTotalPageCount( int totalPageCount ) {
	this.totalPageCount = totalPageCount;
    }

    public int getCurrentPageNumber() {
	return currentPageNumber;
    }

    public void setCurrentPageNumber( int currentPageNumber ) {
	this.currentPageNumber = currentPageNumber;
    }

    public int getStartLimitIndex() {
        return startLimitIndex;
    }

    public void setStartLimitIndex( int startLimitIndex ) {
        this.startLimitIndex = startLimitIndex;
    }
    
    public void setNumerable( Numerable numerable ) {
        this.numerable = numerable;
    }

    @Override
    public String toString() {
	return "Pager [startPageNumber=" + startPageNumber + ", endPageNumber=" + endPageNumber + ", leftNavigator="
		+ leftNavigator + ", rightNavigator=" + rightNavigator + ", startPostNumber=" + startPostNumber
		+ ", postCount=" + postCount + ", pageCount=" + pageCount + ", totalPageCount=" + totalPageCount
		+ ", currentPageNumber=" + currentPageNumber + ", startLimitIndex=" + startLimitIndex + "]";
    }
    
    public void setPager(int pageNo, Map<?, ?> data) {
	int count = numerable.readCount( data );
	int diff = ((pageNo - 1) % pageCount);
	
	// 시작, 끝, 현재 페이지 번호 설정
	this.startPageNumber = pageNo - diff;
	this.endPageNumber = pageNo + (pageCount - diff - 1);
	this.currentPageNumber = pageNo;
	
	// 각 페이지의 시작하는 포스트의 번호 설정
	this.startPostNumber = count - ((pageNo - 1) * postCount);
	
	// 전체 페이지의 수 설정
	if ( (count % this.postCount) == 0 ) {
	    this.totalPageCount = count / postCount;
	} else {
	    this.totalPageCount = (count / postCount) + 1;
	}
	
	// Query에 사용할 LIMIT 시작 번호
	this.startLimitIndex = (this.currentPageNumber - 1) * postCount;
	
	// 좌, 우 네비게이터 화면 표시 설정
	this.leftNavigator = false;
	this.rightNavigator = false;

	if ( this.endPageNumber < this.totalPageCount ) {
	    this.rightNavigator = true;
	}
	if ( this.startPageNumber > this.pageCount ) {
	    this.leftNavigator = true;
	}
    }
}