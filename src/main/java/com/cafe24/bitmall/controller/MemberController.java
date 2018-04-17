package com.cafe24.bitmall.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.bitmall.service.MemberService;
import com.cafe24.bitmall.vo.MemberVO;
import com.cafe24.security.Auth;
import com.cafe24.security.Auth.Role;
import com.cafe24.security.AuthMember;

@Controller
@RequestMapping( "/member" )
public class MemberController {
    @Autowired
    private MemberService memberService;

    @RequestMapping( value = "/agree", method = RequestMethod.GET )
    public ModelAndView agree() {
	return new ModelAndView("member/agree");
    }

    @RequestMapping( value = "/join", method = RequestMethod.GET )
    public ModelAndView join() {
	return new ModelAndView("member/join");
    }

    @RequestMapping( value = "/join", method = RequestMethod.POST )
    public ModelAndView join( @ModelAttribute MemberVO memberVo ) {
	memberService.joinMember( memberVo );
	return new ModelAndView("redirect:/member/joinend");
    }

    @RequestMapping( value = "/joinend", method = RequestMethod.GET )
    public ModelAndView joinend() {
	return new ModelAndView("member/joinend");
    }

    @RequestMapping( value = "/login", method = RequestMethod.GET )
    public ModelAndView login() {
	return new ModelAndView("member/login");
    }
    @Auth
    @RequestMapping( value = "/modify", method = RequestMethod.GET )
    public ModelAndView modify(@AuthMember MemberVO authMember, Model model) {
	Map<String, Object> result = memberService.getMemberInfo( authMember.getId() );
	
	model.addAttribute( "member", result.get("member") );
	model.addAttribute( "birth", result.get("birth") );
	model.addAttribute( "tel", result.get("tel") );
	model.addAttribute( "phone", result.get("phone") );
	model.addAttribute( "zipcode", result.get("zipcode") );
	return new ModelAndView("member/modify");
    }
    
    @Auth(role = Role.USER)
    @RequestMapping( value = "/modify", method = RequestMethod.POST )
    public ModelAndView modify(@ModelAttribute MemberVO memberVo) {
	memberService.modifyMember( memberVo );
	return new ModelAndView("member/modifyend");
    }

    @RequestMapping( value = "/modifyend", method = RequestMethod.GET )
    public ModelAndView modifyend() {
	return new ModelAndView("member/modifyend");
    }
}
