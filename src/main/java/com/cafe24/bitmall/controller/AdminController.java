package com.cafe24.bitmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.security.Auth;
import com.cafe24.security.Auth.Role;

@Controller
@RequestMapping( "/admin" )
@Auth( role = Role.ADMIN )
public class AdminController {
    @RequestMapping( value = "", method = RequestMethod.GET )
    public String main() {
	return "admin/login";
    }
}
