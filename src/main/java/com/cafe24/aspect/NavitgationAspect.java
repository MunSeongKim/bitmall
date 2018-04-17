package com.cafe24.aspect;

import java.util.List;

import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.bitmall.service.CategoryService;
import com.cafe24.bitmall.vo.CategoryVO;

@Aspect
@Component
public class NavitgationAspect {
    @Autowired
    private CategoryService categoryService;

    @AfterReturning(value="execution(* *..controller.*.*(..)) "
    	+ "&& !execution(* *..controller.Admin*.*(..)) "
    	+ "&& !@args(org.springframework.web.bind.annotation.ModelAttribute)", returning="returnValue")
    public ModelAndView navAdvice(Object returnValue ) throws Throwable {
	ModelAndView mav = (ModelAndView) returnValue;
	ModelMap modelMap = mav.getModelMap();
	
	List<CategoryVO> categories = categoryService.getAllCategories();
	modelMap.addAttribute( "categories", categories );
	return mav;
    }
    
}