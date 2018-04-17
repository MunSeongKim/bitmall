package com.cafe24.bitmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.bitmall.service.CategoryService;
import com.cafe24.bitmall.service.OptionService;
import com.cafe24.bitmall.service.ProductService;
import com.cafe24.bitmall.vo.CategoryVO;
import com.cafe24.bitmall.vo.ProductVO;
import com.cafe24.bitmall.vo.SuboptionVO;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductService productService;
    @Autowired
    private OptionService optionService;
    @Autowired
    private CategoryService categoryService;
    
    @Transactional
    @RequestMapping("/{path}")
    public ModelAndView product(@PathVariable("path") String value,
	    @RequestParam(value="sort", required=true, defaultValue="new") String sortValue){
	ModelAndView mav = new ModelAndView();
	if( value.matches("(^[0-9]+$)") ){
	    Integer categoryNo = Integer.valueOf(value);
	    List<ProductVO> products = productService.getSortedProductsByCategory(categoryNo, sortValue);
		CategoryVO category = categoryService.getCategory( categoryNo );
		mav.addObject( "products", products );
		mav.addObject( "category", category );
		mav.setViewName( "product/category" );
	    return mav;
	}
	
	ProductVO product = productService.getProduct(value);
	List<SuboptionVO> suboptions = optionService.getAllSuboptionByOption( product.getOptionNo() );
	mav.addObject("product", product);
	mav.addObject( "suboptions", suboptions );
	mav.setViewName("product/detail");
	return mav;
    }
}
