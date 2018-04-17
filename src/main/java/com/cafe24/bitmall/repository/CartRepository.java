package com.cafe24.bitmall.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.CartVO;

@Repository
public class CartRepository {
    @Autowired
    private SqlSession sqlSession;
    
    public boolean create(CartVO cartVo){
	return (sqlSession.insert("cart.insert", cartVo) == 1);
    }
    
    public boolean createSuboption(CartVO cartVo){
	return (sqlSession.insert("cart.insertSuboption", cartVo) == 1);
    }

    public boolean read( CartVO cartVo ) {
	return ((Integer)sqlSession.selectOne("cart.select", cartVo)== 1);
    }
    
    public boolean readSuboption( CartVO cartVo ) {
	return ((Integer)sqlSession.selectOne("cart.selectSuboption", cartVo) == 1);
    }
    
    public boolean readCountOfSuboption( CartVO cartVo ){
	return ((Integer)sqlSession.selectOne("cart.selectCountOfSuboption", cartVo) == 1);
    }

    public boolean updateSuboptionWithInsert( CartVO cartVo ) {
	return (sqlSession.update("cart.updateSuboptionWithInsert", cartVo) == 1);
    }

    public List<Map<String, Object>> readAll( String id ) {
	return sqlSession.selectList("cart.selectAll", id);
    }

    public boolean updateSuboption( CartVO cartVo ) {
	return (sqlSession.update("cart.updateSuboption", cartVo) == 1);
    }
    
    public boolean deleteSuboption( CartVO cartVo ) {
	return (sqlSession.delete("cart.deleteSuboption", cartVo) == 1);
    }

    public boolean delete( CartVO cartVo ) {
	return (sqlSession.delete("cart.delete", cartVo) == 1);
    }

    public boolean deleteAllSuboption( String id ) {
	return (sqlSession.delete("cart.deleteAllSuboption", id) >= 1);
    }
    
    public boolean deleteAll( String id ) {
	return (sqlSession.delete("cart.deleteAll", id) == 1);
    }
}
