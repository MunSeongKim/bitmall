package com.cafe24.bitmall.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.bitmall.repository.OrderRepository;
import com.cafe24.bitmall.vo.AccountVO;
import com.cafe24.bitmall.vo.CardVO;
import com.cafe24.bitmall.vo.OrderProductVO;
import com.cafe24.bitmall.vo.OrderVO;

@Service
public class OrderService {
    @Autowired
    private OrderRepository orderRepository;

    public List<Map<String, Object>> getProductWithSuboption( Map<?, ?> data ) {
	List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
	result.add( orderRepository.readProductWithSuboption( data ) );
	return result;
    }

    @Transactional
    public void addOrder( OrderVO orderVo, Object payVo ) {
	orderVo.setOrderTel( orderVo.getOrderTel().replace( ",", "-" ) );
	orderVo.setOrderPhone( orderVo.getOrderPhone().replace( ",", "-" ) );
	orderVo.setOrderZipcode( orderVo.getOrderZipcode().replace( ",", "-" ) );
	orderVo.setRcvTel( orderVo.getRcvTel().replace( ",", "-" ) );
	orderVo.setRcvPhone( orderVo.getRcvPhone().replace( ",", "-" ) );
	orderVo.setRcvZipcode( orderVo.getRcvZipcode().replace( ",", "-" ) );

	if ( !orderRepository.createOrder( orderVo ) ) {
	    throw new RuntimeException();
	}

	if ( "card".equals( orderVo.getPayType() ) ) {
	    CardVO cardVo = (CardVO) payVo;
	    cardVo.setOrderNo( orderVo.getNo() );
	    cardVo.setNo( cardVo.getNo().replace( ",", "-" ) );
	    cardVo.setDueDate( cardVo.getDueDate().replace( ",", "/" ) );
	    if ( !orderRepository.createCard( cardVo ) ) {
		throw new RuntimeException();
	    }
	} else {
	    AccountVO accountVo = (AccountVO) payVo;
	    accountVo.setOrderNo( orderVo.getNo() );
	    if ( !orderRepository.createAccount( accountVo ) ) {
		throw new RuntimeException();
	    }
	}
    }

    @Transactional
    public void addOrderProduct( OrderVO orderVo, List<HashMap<String, Object>> orderProducts ) {
	for ( HashMap<String, Object> orderProduct : orderProducts ) {
	    OrderProductVO orderProductVo = new OrderProductVO();
	    orderProductVo.setProductCode( (String) orderProduct.get( "productCode" ) );
	    orderProductVo.setAmount( (Integer) orderProduct.get( "amount" ) );
	    orderProductVo.setSuboptionNo( (Integer) orderProduct.get( "suboptionNo" ) );
	    orderProductVo.setOrderNo( orderVo.getNo() );

	    Boolean isExistProduct = orderRepository.readOrderProduct( orderProductVo );

	    if ( !isExistProduct ) {
		if ( !orderRepository.createOrderProduct( orderProductVo ) ) {
		    throw new RuntimeException();
		}
	    }

	    if ( !orderRepository.createOrderProductWithSuboption( orderProductVo ) ) {
		throw new RuntimeException();
	    }
	}

    }

    public List<Map<String, Object>> getAllOrders( String id ) {
	return orderRepository.readAll( id );
    }

    public OrderVO getOrder( String memberId, Integer orderNo ) {
	Map<String, Object> data = new HashMap<String, Object>();
	data.put( "memberId", memberId );
	data.put( "orderNo", orderNo );
	return orderRepository.readOrder( data );
    }

    public OrderVO getOrder( Integer orderNo ) {
	return orderRepository.readOrder( orderNo );
    }

    public List<Map<String, Object>> getAllOrderProduct( String memberId, Integer orderNo ) {
	Map<String, Object> data = new HashMap<String, Object>();
	data.put( "memberId", memberId );
	data.put( "orderNo", orderNo );
	return orderRepository.readAllOrderProduct( data );
    }
    
    public List<Map<String, Object>> getAllOrderProduct( Integer orderNo ) {
	return orderRepository.readAllOrderProduct( orderNo );
    }

    public CardVO getCard( Integer orderNo ) {
	return orderRepository.readCard( orderNo );
    }

    public AccountVO getAccount( Integer orderNo ) {
	return orderRepository.readAccount( orderNo );
    }

    public List<Map<String, Object>> getAllOrders() {
	return orderRepository.readAll();
    }

    public void modifyState( Integer orderNo, String state ) {
	Map<String, Object> data = new HashMap<String, Object>();
	data.put( "orderNo", orderNo );
	data.put( "state", state );
	if ( !orderRepository.updateState( data ) ) {
	    throw new RuntimeException();
	}
    }

    public void removeOrder( Integer orderNo ) {
	if ( !orderRepository.deleteOrder( orderNo ) ) {
	    throw new RuntimeException();
	}
    }
}
