package com.cafe24.bitmall.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.repository.MemberRepository;
import com.cafe24.bitmall.vo.MemberVO;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;
    
    public MemberVO getUserForLogin(MemberVO memberVo){
	return memberRepository.read(memberVo);
    }
    
    public boolean isExistMember(String id) {
	int count = memberRepository.read(id);
	return (count == 1);
    }

    public void joinMember( MemberVO memberVo ) {
	memberVo.setBirth(memberVo.getBirth().replace(",", "-"));
	memberVo.setTel(memberVo.getTel().replace(",", "-"));
	memberVo.setPhone(memberVo.getPhone().replace(",", "-"));
	memberVo.setZipcode(memberVo.getZipcode().replace(",", "-"));
	if( !memberRepository.create(memberVo) ) {
	    throw new RuntimeException();
	}
    }

    public Map<String, Object> getMemberInfo( String id ) {
	MemberVO memberVo = memberRepository.readById(id);
	String[] birth = memberVo.getBirth().split("-");
	String[] tel = memberVo.getTel().split("-");
	String[] phone = memberVo.getPhone().split("-");
	String[] zipcode = memberVo.getZipcode().split("-");
	
	Map<String, Object> data = new HashMap<String, Object>();
	data.put("member", memberVo);
	data.put("birth", birth);
	data.put("tel", tel);
	data.put("phone", phone);
	data.put("zipcode", zipcode);
	
	return data;
    }

    public void modifyMember( MemberVO memberVo ) {
	memberVo.setBirth(memberVo.getBirth().replace(",", "-"));
	memberVo.setTel(memberVo.getTel().replace(",", "-"));
	memberVo.setPhone(memberVo.getPhone().replace(",", "-"));
	memberVo.setZipcode(memberVo.getZipcode().replace(",", "-"));
	if( !memberRepository.update(memberVo) ) {
	    throw new RuntimeException();
	}
    }
    
    public List<MemberVO> getAllMembers(){
	return memberRepository.readAll();
    }

    public boolean modifyClassify( String id, String classify ) {
	Map<String, Object> data = new HashMap<String, Object>();
	data.put("id", id);
	data.put("classify", classify);
	return memberRepository.update(data);
    }
}
