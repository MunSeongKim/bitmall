package com.cafe24.bitmall.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.bitmall.service.CartService;
import com.cafe24.bitmall.service.MemberService;
import com.cafe24.bitmall.service.OrderService;
import com.cafe24.bitmall.vo.AccountVO;
import com.cafe24.bitmall.vo.CardVO;
import com.cafe24.bitmall.vo.MemberVO;
import com.cafe24.bitmall.vo.OrderProductVO;
import com.cafe24.bitmall.vo.OrderVO;
import com.cafe24.security.Auth;
import com.cafe24.security.AuthMember;

@Controller
@RequestMapping( "/order" )
@Auth
@SessionAttributes( { "orderProducts", "orderVo", "path" } )
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private MemberService memberService;
    @Autowired
    private CartService cartService;
    
    
    @RequestMapping( value="", method=RequestMethod.GET)
    public ModelAndView main(@AuthMember MemberVO authMember){
	ModelAndView mav = new ModelAndView("order/index");
	List<Map<String, Object>> carts = cartService.getAllCarts( authMember.getId() );
	Map<String, Object> member = memberService.getMemberInfo( authMember.getId() );
	
	mav.addObject("orderProducts", carts);
	mav.addObject("member", member);
	mav.addObject("path", "cart");
	return mav;
    }
    
    @RequestMapping( value = "", method = RequestMethod.POST )
    public ModelAndView main( @RequestParam( "productCode" ) String productCode,
	    @RequestParam( "amount" ) Integer amount, @RequestParam( "suboptionNo" ) Integer suboptionNo,
	    @AuthMember MemberVO authMember ) {
	ModelAndView mav = new ModelAndView( "order/index" );

	Map<String, Object> data = new HashMap<String, Object>();
	data.put( "productCode", productCode );
	data.put( "suboptionNo", suboptionNo );

	List<Map<String, Object>> orderProducts = orderService.getProductWithSuboption( data );
	Map<String, Object> member = memberService.getMemberInfo( authMember.getId() );

	orderProducts.get(0).put( "amount", amount );
	mav.addObject( "orderProducts", orderProducts );
	mav.addObject( "member", member );
	mav.addObject("path", "order");
	return mav;
    }

    @RequestMapping( value = "/pay", method = RequestMethod.POST )
    public ModelAndView pay( @ModelAttribute( "orderProducts" ) ArrayList<HashMap<?, ?>> orderProducts,
	    @ModelAttribute OrderVO orderVo ) {
	ModelAndView mav = new ModelAndView( "order/pay" );
	System.out.println( orderProducts );
	mav.addObject( "orderVo", orderVo );
	return mav;
    }

    @RequestMapping( value = "/complete", method = RequestMethod.GET )
    public ModelAndView complete() {
	return new ModelAndView( "order/complete" );
    }

    @Transactional
    @RequestMapping( value = "/complete", method = RequestMethod.POST )
    public ModelAndView complete( @ModelAttribute( "orderProducts" ) List<HashMap<String, Object>> orderProducts,
	    @ModelAttribute( "orderVo" ) OrderVO orderVo, @ModelAttribute CardVO cardVo,
	    @ModelAttribute AccountVO accountVo, @RequestParam( "payType" ) String payType,
	    @ModelAttribute("path") String path, @AuthMember MemberVO authMember ) {
	ModelAndView mav = new ModelAndView( "order/complete" );
	orderVo.setPayType( payType );
	orderVo.setUserId( authMember.getId() );
	System.out.println( cardVo );
	if ( "card".equals( payType ) ) {
	    orderService.addOrder( orderVo, cardVo );
	} else {
	    orderService.addOrder( orderVo, accountVo );
	}

	orderService.addOrderProduct(orderVo, orderProducts);
	
	if( "cart".equals(path) ){
	    cartService.clean( authMember.getId() );   
	}
	return mav;
    }

    @RequestMapping( "/list" )
    public ModelAndView list( @AuthMember MemberVO authMember ) {
	ModelAndView mav = new ModelAndView( "order/list" );
	List<Map<String, Object>> orders = orderService.getAllOrders( authMember.getId() );
	mav.addObject( "orders", orders );
	return mav;
    }

    @Transactional
    @RequestMapping( "/{path1}" )
    public ModelAndView info( @PathVariable( "path1" ) Integer orderNo, @AuthMember MemberVO authMember ) {
	ModelAndView mav = new ModelAndView( "order/info" );
	String memberId = authMember.getId();
	OrderVO orderVo = orderService.getOrder( memberId, orderNo );
	List<Map<String, Object>> orderProducts = orderService.getAllOrderProduct( memberId, orderNo );
	if ( "card".equals( orderVo.getPayType() ) ) {
	    CardVO cardVo = orderService.getCard( orderNo );
	    mav.addObject( "card", cardVo );
	} else {
	    AccountVO accountVo = orderService.getAccount( orderNo );
	    mav.addObject( "account", accountVo );
	}
	mav.addObject( "order", orderVo );
	mav.addObject( "orderProducts", orderProducts );
	return mav;
    }

}
