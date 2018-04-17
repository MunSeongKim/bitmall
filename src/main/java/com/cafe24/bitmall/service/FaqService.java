package com.cafe24.bitmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.repository.FaqRepository;
import com.cafe24.bitmall.vo.FaqVO;

@Service
public class FaqService {
    @Autowired
    private FaqRepository faqRepository;
    
    public void addFaq(FaqVO faqVo) {
	if ( !faqRepository.create( faqVo ) ) {
	    throw new RuntimeException();
	}
    }

    public List<FaqVO> getAllFaqs() {
	return faqRepository.readAll();
    }

    public FaqVO getFaq( Integer no ) {
	return faqRepository.read(no);
    }

    public void editFaq( FaqVO faqVo ) {
	if ( !faqRepository.update( faqVo ) ) {
	    throw new RuntimeException();
	}
    }
    
    public void deleteFaq( Integer no ) {
	if ( !faqRepository.delete( no ) ) {
	    throw new RuntimeException();
	}
    }
}
