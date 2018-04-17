package com.cafe24.bitmall.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.CategoryVO;

@Repository
public class CategoryRepository {
    @Autowired
    private SqlSession sqlSession;
    
    public List<CategoryVO> readAll() {
	return sqlSession.selectList( "category.selectAll" );
    }

    public CategoryVO read( Integer no ) {
	return sqlSession.selectOne( "category.select", no );
    }
}
