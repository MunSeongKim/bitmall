package com.cafe24.bitmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.bitmall.service.FaqService;
import com.cafe24.bitmall.vo.FaqVO;
import com.cafe24.security.Auth;
import com.cafe24.security.Auth.Role;

@Controller
@RequestMapping( "/admin" )
@Auth( role = Role.ADMIN )
public class AdminFaqController {
    @Autowired
    private FaqService faqService;

    @RequestMapping( value = "/faq", method = RequestMethod.GET )
    public String faq( Model model ) {
	List<FaqVO> faqs = faqService.getAllFaqs();
	model.addAttribute( "faqs", faqs );
	return "admin/faq/index";
    }

    @RequestMapping( value = "/faq/new", method = RequestMethod.GET )
    public String faqNew() {
	return "admin/faq/new";
    }

    @RequestMapping( value = "/faq/new", method = RequestMethod.POST )
    public String faqNew( @ModelAttribute FaqVO faqVo ) {
	faqService.addFaq( faqVo );
	return "redirect:/admin/faq";
    }

    @RequestMapping( value = "/faq/edit/{path1}", method = RequestMethod.GET )
    public String faqEdit( @PathVariable( "path1" ) Integer no, Model model ) {
	FaqVO faq = faqService.getFaq( no );
	model.addAttribute( "faq", faq );
	return "admin/faq/edit";
    }

    @RequestMapping( value = "/faq/edit", method = RequestMethod.POST )
    public String faqEdit( @ModelAttribute FaqVO faqVo ) {
	faqService.editFaq( faqVo );
	return "redirect:/admin/faq";
    }

    @RequestMapping( value = "/faq/delete/{path1}", method = RequestMethod.GET )
    public String faqEdit( @PathVariable( "path1" ) Integer no ) {
	faqService.deleteFaq( no );
	return "redirect:/admin/faq";
    }
}
