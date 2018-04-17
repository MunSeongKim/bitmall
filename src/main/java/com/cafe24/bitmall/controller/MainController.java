package com.cafe24.bitmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.bitmall.service.ProductService;
import com.cafe24.bitmall.vo.ProductVO;

@Controller
public class MainController {
    @Autowired
    private ProductService productService;
    
    @RequestMapping( "" )
    public ModelAndView index(){
	ModelAndView mav = new ModelAndView("main/index");
	List<ProductVO> newProducts = productService.getNewProducts();
	mav.addObject("newProducts", newProducts);
	return mav;
    }
    
    @RequestMapping( "/company" )
    public ModelAndView company() {
	return new ModelAndView("main/company");
    }

    @RequestMapping( "/test" )
    public ModelAndView test() {
	return new ModelAndView("temp/login");
    }
    
    @RequestMapping( value = "/zipcode", method = RequestMethod.GET )
    public ModelAndView zipcode(@RequestParam("k") Integer zipKind) {
	ModelAndView mav = new ModelAndView("main/zipcode");
	mav.addObject( "zipKind", zipKind);
	return mav;
    }
    
}
