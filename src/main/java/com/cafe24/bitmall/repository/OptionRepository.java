package com.cafe24.bitmall.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.OptionVO;
import com.cafe24.bitmall.vo.SuboptionVO;

@Repository
public class OptionRepository {
    @Autowired
    private SqlSession sqlSession;

    public List<OptionVO> readAll() {
	return sqlSession.selectList( "option.selectAll" );
    }

    public OptionVO read( Integer no ) {
	return sqlSession.selectOne( "option.selectByNo", no );
    }

    public boolean update( OptionVO optionVo ) {
	return (sqlSession.update( "option.update", optionVo ) == 1);
    }

    public boolean insert( String name ) {
	return (sqlSession.insert( "option.insert", name ) == 1);
    }
    
    public boolean delete( Integer optionNo ) {
	return (sqlSession.delete( "option.delete", optionNo ) == 1);
    }

    public List<SuboptionVO> readAllSuboption( Integer optionNo ) {
	return sqlSession.selectList( "option.selectAllSuboption", optionNo );
    }

    public SuboptionVO readSuboption( Integer suboptionNo ) {
	return sqlSession.selectOne( "option.selectSuboption", suboptionNo );
    }

    public boolean update( SuboptionVO suboptionVo ) {
	return (sqlSession.update( "option.updateSuboption", suboptionVo ) == 1);
    }

}
