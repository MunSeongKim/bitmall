package com.cafe24.bitmall.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cafe24.bitmall.service.CategoryService;
import com.cafe24.bitmall.service.FileService;
import com.cafe24.bitmall.service.OptionService;
import com.cafe24.bitmall.service.ProductService;
import com.cafe24.bitmall.vo.CategoryVO;
import com.cafe24.bitmall.vo.OptionVO;
import com.cafe24.bitmall.vo.ProductVO;
import com.cafe24.security.Auth;
import com.cafe24.security.Auth.Role;

@Controller
@RequestMapping( "/admin/product" )
@Auth( role = Role.ADMIN )
public class AdminProductController {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private OptionService optionService;
    @Autowired
    private ProductService productService;
    @Autowired
    private FileService fileService;

    @RequestMapping( value = "", method = RequestMethod.GET )
    public String product( Model model ) {
	List<Map<String, Object>> products = productService.getAllProducts();
	model.addAttribute( "products", products );
	return "admin/product/index";
    }

    @Transactional
    @RequestMapping( value = "/new", method = RequestMethod.GET )
    public String newProduct( Model model ) {
	List<CategoryVO> categories = categoryService.getAllCategories();
	List<OptionVO> options = optionService.getAllOptions();
	model.addAttribute( "categories", categories );
	model.addAttribute( "options", options );
	return "admin/product/new";
    }

    @Transactional
    @RequestMapping( value = "/new", method = RequestMethod.POST )
    public String newProduct( @ModelAttribute ProductVO productVo,
	    @RequestParam( "image" ) MultipartFile[] multipartFile ) {
	productVo.setImagePath1( fileService.restore( 0, multipartFile[0] ) );
	productVo.setImagePath2( fileService.restore( 1, multipartFile[1] ) );
	productVo.setImagePath3( fileService.restore( 2, multipartFile[2] ) );
	if( productVo.getOptionNo() == 0 ){
	    productVo.setOptionNo(1);
	}
	productService.addProduct( productVo );
	return "redirect:/admin/product";
    }

    @Transactional
    @RequestMapping( value = "/modify/{path1}", method = RequestMethod.GET )
    public String modifyProduct( @PathVariable( "path1" ) String code, Model model ) {
	List<CategoryVO> categories = categoryService.getAllCategories();
	List<OptionVO> options = optionService.getAllOptions();
	ProductVO product = productService.getProduct( code );
	model.addAttribute( "categories", categories );
	model.addAttribute( "options", options );
	model.addAttribute( "product", product );
	return "admin/product/modify";
    }

    @Transactional
    @RequestMapping( value = "/modify", method = RequestMethod.POST )
    public String modifyProduct( @ModelAttribute ProductVO productVo,
	    @RequestParam( "image" ) MultipartFile[] multipartFiles,
	    @RequestParam( value = "delImg", required = false ) Integer[] checkDel,
	    @RequestParam( value = "del-img" ) String[] deleteImgPath ) {

	// When click the checkbox
	if ( checkDel != null ) {
	    for ( int i = 0; i < checkDel.length; i++ ) {
		fileService.remove( checkDel[i], deleteImgPath[checkDel[i]] );
		deleteImgPath[checkDel[i]] = "";
		switch ( checkDel[i] ) {
		case 0:
		    productVo.setImagePath1( "remove" );
		    break;
		case 1:
		    productVo.setImagePath2( "remove" );
		    break;
		case 2:
		    productVo.setImagePath3( "remove" );
		    break;
		}
	    }
	}

	// When Delete & Update
	for ( int i = 0; i < multipartFiles.length; i++ ) {
	    boolean isExistDelImgPath = !"".equals( deleteImgPath[i] );
	    boolean isExistFile = !"".equals( multipartFiles[i].getOriginalFilename() );
	    // Delete
	    if ( isExistDelImgPath && isExistFile ) {
		fileService.remove( i, deleteImgPath[i] );
	    }
	    // Update
	    switch ( i ) {
	    case 0:
		if ( !"remove".equals( productVo.getImagePath1() )
			|| isExistFile ) {
		    productVo.setImagePath1( fileService.restore( 0, multipartFiles[0] ) );
		}
		break;
	    case 1:
		if ( !"remove".equals( productVo.getImagePath2() ) 
			|| isExistFile ) {
		    productVo.setImagePath2( fileService.restore( 1, multipartFiles[1] ) );
		}
		break;
	    case 2:
		if ( !"remove".equals( productVo.getImagePath3() ) 
			|| isExistFile ) {
		    productVo.setImagePath3( fileService.restore( 2, multipartFiles[2] ) );
		}
		break;
	    }
	}

	productService.modifyProduct( productVo );
	return "redirect:/admin/product";
    }

    @Transactional
    @RequestMapping( value = "/delete/{path1}", method = RequestMethod.GET )
    public String removeProduct( @PathVariable( "path1" ) String code ) {
	ProductVO productVo = productService.getProduct( code );
	fileService.remove(0, productVo.getImagePath1() );
	fileService.remove(1, productVo.getImagePath2() );
	fileService.remove(2, productVo.getImagePath3() );
	productService.removeProduct( code );
	return "redirect:/admin/product";
    }

}
