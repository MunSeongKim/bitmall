package com.cafe24.bitmall.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.FaqVO;

@Repository
public class FaqRepository {
    @Autowired
    private SqlSession sqlSession;

    public boolean create( FaqVO faqVo ) {
        return (sqlSession.insert("faq.insert", faqVo) == 1);
    }

    public List<FaqVO> readAll() {
	return sqlSession.selectList("faq.selectAll");
    }

    public FaqVO read( Integer no ) {
	return sqlSession.selectOne("faq.selectByNo", no);
    }

    public boolean update( FaqVO faqVo ) {
	return (sqlSession.update("faq.update", faqVo) == 1);
    }
    
    public boolean delete( Integer no ) {
	return (sqlSession.delete("faq.delete", no) == 1);
    }
}
