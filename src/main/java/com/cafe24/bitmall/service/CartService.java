package com.cafe24.bitmall.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.bitmall.repository.CartRepository;
import com.cafe24.bitmall.vo.CartVO;

@Service
public class CartService {
    @Autowired
    private CartRepository cartRepository;

    @Transactional
    public boolean addCart( CartVO cartVo ) {
	boolean isExistCart = cartRepository.read( cartVo );
	boolean isExistSuboption = cartRepository.readSuboption( cartVo );

	boolean isCreatedCart = false;
	boolean isCreatedSuboption = false;

	if ( !isExistCart ) {
	    isCreatedCart = cartRepository.create( cartVo );
	}

	if ( !isExistSuboption ) {
	    isCreatedSuboption = cartRepository.createSuboption( cartVo );
	} else {
	    isCreatedSuboption = cartRepository.updateSuboptionWithInsert( cartVo );
	}

	return (isExistCart || isCreatedCart) && isCreatedSuboption;
    }

    public List<Map<String, Object>> getAllCarts( String id ) {
	return cartRepository.readAll( id );
    }

    @Transactional
    public void modifyCart( CartVO cartVo ) {
	if ( !cartRepository.updateSuboption( cartVo ) ) {
	    throw new RuntimeException();
	}
    }

    @Transactional
    public void deleteCart( CartVO cartVo ) {
	boolean isExistOneSuboption = cartRepository.readCountOfSuboption( cartVo );
	if ( !cartRepository.deleteSuboption( cartVo ) ) {
	    throw new RuntimeException();
	}

	if ( isExistOneSuboption ) {
	    if ( !cartRepository.delete( cartVo ) ) {
		throw new RuntimeException();
	    }
	}
    }

    @Transactional
    public void clean( String id ) {
	if ( !cartRepository.deleteAllSuboption( id ) ) {
	    throw new RuntimeException();
	}
	if ( !cartRepository.deleteAll( id ) ) {
	    throw new RuntimeException();
	}
    }
}
