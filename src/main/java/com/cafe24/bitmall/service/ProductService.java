package com.cafe24.bitmall.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.bitmall.repository.ProductRepository;
import com.cafe24.bitmall.vo.ProductVO;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;

    private void addProductOption( String code, Integer optionNo ) {
	Map<String, Object> productOptionMap = new HashMap<String, Object>();
	productOptionMap.put( "code", code );
	productOptionMap.put( "optionNo", optionNo );
	if ( !productRepository.createOption( productOptionMap ) ) {
	    throw new RuntimeException();
	}
    }

    @Transactional
    public void addProduct( ProductVO productVo ) {
	if ( !productRepository.create( productVo ) ) {
	    throw new RuntimeException();
	}
	addProductOption( productVo.getCode(), productVo.getOptionNo() );
    }

    public List<Map<String, Object>> getAllProducts() {
	List<Map<String, Object>> products = productRepository.readAll();
	for ( Map<String, Object> product : products ) {
	    String status = (String) product.get( "state" );
	    switch ( status ) {
	    case "sale":
		product.put( "state", "판매중" );
		break;
	    case "not-sale":
		product.put( "state", "판매중지" );
		break;
	    case "sold-out":
		product.put( "state", "품절" );
		break;
	    }
	}
	return products;
    }

    public ProductVO getProduct( String code ) {
	return productRepository.read( code );
    }

    @Transactional
    public void modifyProduct( ProductVO productVo ) {
	if ( !productRepository.update( productVo ) ) {
	    throw new RuntimeException();
	}
	if ( !productRepository.deleteOption( productVo.getCode() ) ) {
	    throw new RuntimeException();
	}
	addProductOption( productVo.getCode(), productVo.getOptionNo() );
    }

    @Transactional
    public void removeProduct( String code ) {
	if ( !productRepository.deleteOption( code ) ) {
	    throw new RuntimeException();
	}
	if ( !productRepository.delete( code ) ) {
	    throw new RuntimeException();
	}
    }

    public List<ProductVO> getNewProducts() {
	return productRepository.readAllByNew();
    }

    public List<ProductVO> getProductsByCategory( Integer categoryNo ) {
	return productRepository.readAllByCategory(categoryNo);
    }

    public List<ProductVO> getSortedProductsByCategory( Integer categoryNo, String sortValue ) {
	Map<String, Object> data = new HashMap<String, Object>();
	data.put("categoryNo", categoryNo);
	data.put("sortValue", sortValue);
	return productRepository.readAllSortedByCategory(data);
    }
}
