package com.cafe24.bitmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.repository.CategoryRepository;
import com.cafe24.bitmall.vo.CategoryVO;

@Service
public class CategoryService {
    @Autowired
    private CategoryRepository categoryRepository;
    
    public List<CategoryVO> getAllCategories() {
	return categoryRepository.readAll();
    }
    
    public CategoryVO getCategory(Integer no) {
	return categoryRepository.read(no);
    }
}
