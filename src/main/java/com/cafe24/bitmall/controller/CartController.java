package com.cafe24.bitmall.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.bitmall.service.CartService;
import com.cafe24.bitmall.vo.CartVO;
import com.cafe24.bitmall.vo.MemberVO;
import com.cafe24.security.Auth;
import com.cafe24.security.AuthMember;

@Controller
@RequestMapping( "/cart" )
@Auth
public class CartController {
    @Autowired
    private CartService cartService;

    @RequestMapping( "" )
    public ModelAndView main( @AuthMember MemberVO authMember ) {
	ModelAndView mav = new ModelAndView( "cart/cart" );
	List<Map<String, Object>> carts = cartService.getAllCarts( authMember.getId() );
	mav.addObject( "carts", carts );
	return mav;
    }

    @RequestMapping( value = "/modify/{path1}/{path2}", method = RequestMethod.POST )
    public ModelAndView modify( @PathVariable( "path1" ) String productCode,
	    @PathVariable( "path2" ) Integer suboptionNo, @RequestParam( "amount" ) Integer amount,
	    @AuthMember MemberVO authMember ) {
	CartVO cartVo = new CartVO();
	cartVo.setUserId( authMember.getId() );
	cartVo.setProductCode( productCode );
	cartVo.setSuboptionNo( suboptionNo );
	cartVo.setAmount( amount );

	cartService.modifyCart( cartVo );
	return new ModelAndView( "redirect:/cart" );
    }

    @RequestMapping( value = "/delete/{path1}/{path2}", method = RequestMethod.GET )
    public ModelAndView delete( @PathVariable( "path1" ) String productCode,
	    @PathVariable( "path2" ) Integer suboptionNo,
	    @AuthMember MemberVO authMember ) {
	CartVO cartVo = new CartVO();
	cartVo.setUserId( authMember.getId() );
	cartVo.setProductCode( productCode );
	cartVo.setSuboptionNo( suboptionNo );

	cartService.deleteCart( cartVo );
	return new ModelAndView( "redirect:/cart" );
    }
    
    @RequestMapping( value = "/clean", method=RequestMethod.GET )
    public ModelAndView clean(@AuthMember MemberVO authMember){
	cartService.clean(authMember.getId());
	return new ModelAndView("redirect:/cart");
    }
}