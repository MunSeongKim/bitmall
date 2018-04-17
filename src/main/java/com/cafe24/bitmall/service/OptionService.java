package com.cafe24.bitmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.repository.OptionRepository;
import com.cafe24.bitmall.vo.OptionVO;
import com.cafe24.bitmall.vo.SuboptionVO;

@Service
public class OptionService {
    @Autowired
    private OptionRepository optionRepository;

    public List<OptionVO> getAllOptions() {
	return optionRepository.readAll();
    }

    public OptionVO getOption( Integer no ) {
	return optionRepository.read( no );
    }

    public void modifyOption( OptionVO optionVo ) {
	if ( !optionRepository.update( optionVo ) ) {
	    throw new RuntimeException();
	}
    }

    public void addOption( String name ) {
	if ( !optionRepository.insert( name ) ) {
	    throw new RuntimeException();
	}
    }
    
    public void removeOption( Integer optionNo ) {
	if ( !optionRepository.delete( optionNo ) ) {
	    throw new RuntimeException();
	}
    }

    public List<SuboptionVO> getAllSuboptionByOption( Integer optionNo ) {
	return optionRepository.readAllSuboption( optionNo );
    }

    public SuboptionVO getSuboption( Integer suboptionNo ) {
	return optionRepository.readSuboption( suboptionNo );
    }

    public void modifySuboption( SuboptionVO suboptionVo ) {
	if ( !optionRepository.update( suboptionVo ) ) {
	    throw new RuntimeException();
	}
    }

}
