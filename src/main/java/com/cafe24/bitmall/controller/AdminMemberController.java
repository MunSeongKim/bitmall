package com.cafe24.bitmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.bitmall.service.MemberService;
import com.cafe24.bitmall.vo.MemberVO;
import com.cafe24.security.Auth;
import com.cafe24.security.Auth.Role;

@Controller
@RequestMapping( "/admin/member" )
@Auth( role = Role.ADMIN )
public class AdminMemberController {
    @Autowired
    private MemberService memberService;
    
    @RequestMapping( value = "", method = RequestMethod.GET )
    public String member(Model model) {
	List<MemberVO> members = memberService.getAllMembers();
	model.addAttribute( "members", members );
	return "admin/member/index";
    }
}
