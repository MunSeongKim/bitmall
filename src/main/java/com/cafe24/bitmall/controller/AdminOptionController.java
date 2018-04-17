package com.cafe24.bitmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.bitmall.service.OptionService;
import com.cafe24.bitmall.vo.OptionVO;
import com.cafe24.bitmall.vo.SuboptionVO;
import com.cafe24.security.Auth;
import com.cafe24.security.Auth.Role;

@Controller
@RequestMapping( "/admin/option" )
@Auth( role = Role.ADMIN )
public class AdminOptionController {
    @Autowired
    private OptionService optionService;

    @RequestMapping( value = "", method = RequestMethod.GET )
    public String option( Model model ) {
	List<OptionVO> options = optionService.getAllOptions();
	model.addAttribute( "options", options );
	return "admin/option/index";
    }

    @RequestMapping( value = "/new", method = RequestMethod.GET )
    public String optionNew() {
	return "admin/option/new";
    }

    @RequestMapping( value = "/new", method = RequestMethod.POST )
    public String optionNew( @RequestParam( "name" ) String name ) {
	optionService.addOption( name );
	return "redirect:/admin/option";
    }

    @RequestMapping( value = "/edit/{path1}", method = RequestMethod.GET )
    public String optionEdit( @PathVariable( "path1" ) Integer no, Model model ) {
	OptionVO option = optionService.getOption( no );
	model.addAttribute( "option", option );
	return "admin/option/edit";
    }

    @RequestMapping( value = "/edit", method = RequestMethod.POST )
    public String optionEdit( @ModelAttribute OptionVO optionVo ) {
	optionService.modifyOption( optionVo );
	return "redirect:/admin/option";
    }
    
    @RequestMapping( value = "/delete/{path1}", method = RequestMethod.GET )
    public String optionDelete( @PathVariable("path1") Integer optionNo ){
	optionService.removeOption( optionNo );
	return "redirect:/admin/option";
    }

    @Transactional
    @RequestMapping( value = "/{path1}", method = RequestMethod.GET )
    public String suboption( @PathVariable( "path1" ) Integer optionNo, Model model ) {
	OptionVO option = optionService.getOption( optionNo );
	List<SuboptionVO> suboptions = optionService.getAllSuboptionByOption( optionNo );
	model.addAttribute( "option", option );
	model.addAttribute( "suboptions", suboptions );
	return "admin/option/sub/index";
    }

    @RequestMapping( value = "/{path1}/suboption/edit/{path2}", method = RequestMethod.GET )
    public String suboptionEdit( @PathVariable( "path1" ) Integer optionNo,
	    @PathVariable( "path2" ) Integer suboptionNo, Model model ) {
	SuboptionVO suboption = optionService.getSuboption( suboptionNo );
	model.addAttribute( "optionNo", optionNo );
	model.addAttribute( "suboption", suboption );
	return "admin/option/sub/edit";
    }

    @RequestMapping( value = "/suboption/edit", method = RequestMethod.POST )
    public String suboptionEdit( @ModelAttribute SuboptionVO suboptionVo ) {
	optionService.modifySuboption( suboptionVo );
	return "redirect:/admin/option/" + suboptionVo.getOptionNo();
    }
}
