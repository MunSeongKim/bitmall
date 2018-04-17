package com.cafe24.bitmall.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.bitmall.service.MemberService;
import com.cafe24.dto.JSONResult;

@Controller( "MemberAPIController" )
@RequestMapping( "/api/member" )
public class MemberController {
    @Autowired
    private MemberService memberService;

    @ResponseBody
    @RequestMapping( "/checkid" )
    public JSONResult checkId( @RequestParam( value = "id", required = true, defaultValue = "" ) String id ) {
	if ( memberService.isExistMember( id ) ) {
	    return JSONResult.success( "exist" );
	}
	return JSONResult.success( "not exists" );
    }

    @ResponseBody
    @RequestMapping( value="/modify", method=RequestMethod.POST )
    public JSONResult modifyClassify( @RequestParam( value = "id", required = true, defaultValue = "" ) String id,
	    @RequestParam( value = "classify" ) String classify ) {
	return JSONResult.success( memberService.modifyClassify(id, classify) );
    }
}
