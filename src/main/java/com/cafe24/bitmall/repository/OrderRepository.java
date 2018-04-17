package com.cafe24.bitmall.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.AccountVO;
import com.cafe24.bitmall.vo.CardVO;
import com.cafe24.bitmall.vo.OrderProductVO;
import com.cafe24.bitmall.vo.OrderVO;

@Repository
public class OrderRepository {
    @Autowired
    private SqlSession sqlSession;

    public Map<String, Object> readProductWithSuboption( Map<?, ?> data ) {
	return sqlSession.selectOne( "order.selectProductWithSuboption", data );
    }

    public boolean createOrder( OrderVO orderVo ) {
	return (sqlSession.insert( "order.insertOrder", orderVo ) == 1);
    }

    public boolean createOrderProduct( OrderProductVO orderProductVo ) {
	return (sqlSession.insert( "order.insertOrderProduct", orderProductVo ) == 1);
    }
    public boolean createOrderProductWithSuboption( OrderProductVO orderProductVo ) {
	return (sqlSession.insert( "order.insertOrderProductWithSuboption", orderProductVo ) == 1);
    }

    public boolean createCard( CardVO cardVo ) {
	return (sqlSession.insert( "order.insertCard", cardVo ) == 1);
    }

    public boolean createAccount( AccountVO accountVo ) {
	return (sqlSession.insert( "order.insertAccount", accountVo ) == 1);
    }

    public List<Map<String, Object>> readAll( String id ) {
	return sqlSession.selectList("order.selectInquireOrder", id);
    }

    public OrderVO readOrder( Map<String, Object> data ) {
	return sqlSession.selectOne("order.selectOrderByMember", data);
    }
    
    public OrderVO readOrder( Integer orderNo ) {
	return sqlSession.selectOne("order.selectOrderByNo", orderNo);
    }

    public List<Map<String, Object>> readAllOrderProduct( Map<String, Object> data ) {
	return sqlSession.selectList("order.selectAllOrderProductByMember", data);
    }
    
    public List<Map<String, Object>> readAllOrderProduct( Integer orderNo ) {
	return sqlSession.selectList("order.selectAllOrderProduct", orderNo);
    }

    public CardVO readCard( Integer orderNo ) {
	return sqlSession.selectOne("order.selectCard", orderNo);
    }

    public AccountVO readAccount( Integer orderNo ) {
	return sqlSession.selectOne("order.selectAccount", orderNo);
    }

    public Boolean readOrderProduct( OrderProductVO orderProductVo ) {
	return ((Integer)sqlSession.selectOne("order.selectCountOfOrderProduct", orderProductVo) == 1);
    }

    public List<Map<String, Object>> readAll() {
	return sqlSession.selectList("order.selectAllOrders");
    }

    public boolean updateState( Map<String, Object> data ) {
	return (sqlSession.update("order.updateState", data) == 1);
    }

    public boolean deleteOrder( Integer orderNo ) {
	return (sqlSession.delete("order.deleteOrder", orderNo) == 1);
    }

}
