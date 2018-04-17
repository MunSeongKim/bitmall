package com.cafe24.bitmall.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.MemberVO;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSession sqlSession;
    
    public List<MemberVO> readAll() {
	return sqlSession.selectList("member.selectAll");
    }
    
    public MemberVO read(MemberVO memberVo){
	return sqlSession.selectOne("member.selectByEmailAndPassword", memberVo);
    }
    
    public int read(String id){
	return sqlSession.selectOne("member.selectCountById", id);
    }

    public boolean create( MemberVO memberVo ) {
	return (sqlSession.insert("member.insert", memberVo) == 1);
    }

    public MemberVO readById( String id ) {
	return sqlSession.selectOne("member.selectById", id);
    }

    public boolean update( MemberVO memberVo ) {
	return (sqlSession.update("member.update", memberVo) == 1);
    }

    public boolean update( Map<?, ?> data ) {
	return (sqlSession.update("member.updateByMap", data) == 1);
    }
}
