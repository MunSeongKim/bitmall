package com.cafe24.bitmall.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.ProductVO;

@Repository
public class ProductRepository {
    @Autowired
    private SqlSession sqlSession;

    public boolean create( ProductVO productVo ) {
	return (sqlSession.insert( "product.insert", productVo ) == 1);
    }

    public List<Map<String, Object>> readAll() {
	return sqlSession.selectList( "product.selectAll" );
    }

    public boolean createOption( Map<?, ?> productOptionMap ) {
	return (sqlSession.insert( "product.insertOption", productOptionMap ) == 1);
    }

    public ProductVO read( String code ) {
	return sqlSession.selectOne( "product.selectByCode", code );
    }

    public boolean update( ProductVO productVo ) {
	return (sqlSession.update( "product.update", productVo ) == 1);
    }

    public boolean delete( String code ) {
	return (sqlSession.delete( "product.delete", code ) == 1);
    }

    public boolean deleteOption( String code ) {
	return (sqlSession.delete( "product.deleteOption", code ) == 1);
    }

    public List<ProductVO> readAllByNew() {
	return sqlSession.selectList( "product.selectAllByNew" );
    }

    public List<ProductVO> readAllByCategory(Integer categoryNo) {
	return sqlSession.selectList( "product.selectAllByCategory", categoryNo );
    }

    public List<ProductVO> readAllSortedByCategory( Map<String, Object> data ) {
	return sqlSession.selectList( "product.selectAllSortedByCategory", data );
    }
}
