package com.cafe24.bitmall.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.bitmall.service.OrderService;
import com.cafe24.bitmall.vo.AccountVO;
import com.cafe24.bitmall.vo.CardVO;
import com.cafe24.bitmall.vo.OrderVO;
import com.cafe24.security.Auth;
import com.cafe24.security.Auth.Role;

@Controller
@RequestMapping( "/admin/order" )
@Auth( role = Role.ADMIN )
public class AdminOrderController {
    @Autowired
    private OrderService orderService;

    @RequestMapping( value = "", method = RequestMethod.GET )
    public String order( Model model ) {
	List<Map<String, Object>> orders = orderService.getAllOrders();
	model.addAttribute( "orders", orders );
	return "admin/order/index";
    }

    @Transactional
    @RequestMapping( value = "/{path1}", method = RequestMethod.GET )
    public String info( @PathVariable( "path1" ) Integer orderNo, Model model ) {
	OrderVO orderVo = orderService.getOrder( orderNo );
	List<Map<String, Object>> orderProducts = orderService.getAllOrderProduct( orderNo );
	if ( "card".equals( orderVo.getPayType() ) ) {
	    CardVO cardVo = orderService.getCard( orderNo );
	    model.addAttribute( "card", cardVo );
	} else {
	    AccountVO accountVo = orderService.getAccount( orderNo );
	    model.addAttribute( "account", accountVo );
	}
	model.addAttribute( "orderProducts", orderProducts );
	model.addAttribute( "order", orderVo );
	return "admin/order/info";
    }

    @RequestMapping( value = "/modify/{path1}", method = RequestMethod.POST )
    public String modify( @PathVariable( "path1" ) Integer orderNo, @RequestParam( "state" ) String state ) {
	orderService.modifyState( orderNo, state );
	return "redirect:/admin/order";
    }

    @RequestMapping( value = "/delete/{path1}", method = RequestMethod.GET )
    public String delete( @PathVariable( "path1" ) Integer orderNo ) {
	orderService.removeOrder( orderNo );
	return "redirect:/admin/order";
    }

}
