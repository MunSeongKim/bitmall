package com.cafe24.bitmall.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.bitmall.service.CartService;
import com.cafe24.bitmall.vo.CartVO;
import com.cafe24.bitmall.vo.MemberVO;
import com.cafe24.dto.JSONResult;
import com.cafe24.security.Auth;
import com.cafe24.security.AuthMember;

@Controller( "CartAPIController" )
@RequestMapping( "/api/cart" )
@Auth
public class CartController {
    @Autowired
    private CartService cartService;
    
    
    @ResponseBody
    @RequestMapping( value="", method=RequestMethod.POST )
    public JSONResult cart(@RequestBody CartVO cartVo,
	    @AuthMember MemberVO memberVo){
	
	cartVo.setUserId(memberVo.getId());
	System.out.println( cartVo );
	if( cartService.addCart(cartVo) ){
	    return JSONResult.success("added");
	}
	return JSONResult.fail("Cannot add to cart");
    }
}
