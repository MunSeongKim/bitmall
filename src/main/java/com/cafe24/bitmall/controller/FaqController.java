package com.cafe24.bitmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.bitmall.service.FaqService;
import com.cafe24.bitmall.vo.FaqVO;

@Controller
@RequestMapping("/faq")
public class FaqController {
    @Autowired
    private FaqService faqService;
    
    @RequestMapping("")
    public ModelAndView main(){
	ModelAndView mav = new ModelAndView("faq/index");
	List<FaqVO> faqs = faqService.getAllFaqs();
	mav.addObject( "faqs", faqs );
	return mav;
    }
    
    @RequestMapping("/{path1}")
    public ModelAndView read(@PathVariable("path1") Integer no){
	ModelAndView mav = new ModelAndView("faq/read");
	FaqVO faq = faqService.getFaq( no );
	mav.addObject( "faq", faq );
	return mav;
    }
}
