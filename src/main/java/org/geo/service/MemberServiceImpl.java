package org.geo.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.util.List;

import javax.sql.DataSource;

import org.geo.controller.BoardController;
import org.geo.domain.AuthVO;
import org.geo.domain.BoardVO;
import org.geo.domain.Criteria;
import org.geo.domain.MemberVO;
import org.geo.mapper.BoardMapper;
import org.geo.mapper.MemberMapper;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Service
@AllArgsConstructor
@Log4j2
public class MemberServiceImpl implements MemberService{
	
	private MemberMapper mapper;
	
	@Autowired
	@Qualifier("bcryptPasswordEncoder")
	private PasswordEncoder pwencoder;
	
	@Override
	public MemberVO getMember(String userid) {
		
		
		return null;
	}

	@Override
	public void registerMember(MemberVO vo) {
		log.info("MemberServiceImpl registMember()...");
		vo.setUserpw(pwencoder.encode(vo.getUserpw()));
		mapper.insertMember(vo);
		
	}


	@Override
	public void insertAuth(AuthVO vo) {
		log.info("MemberServiceImpl registMember()...");
		
		mapper.insertAuth(vo);
		
	}

	@Override
	public boolean selectUserid(String userid) {
		log.info("MemberServiceImpl selectUserid()...");
		return mapper.selectUserid(userid);
	}

	@Override
	public MemberVO findByUserId(String userid) {
		log.info("MemberServiceImpl findByUserId()...");
		return mapper.findByUserId(userid);
	}

	@Override
	public int deleteMember(String userid) {
		log.info("MemberServiceImpl deleteMember()...");

		return mapper.deleteMember(userid);
	}

	@Override
	public int deleteAuth(String userid) {
		log.info("MemberServiceImpl deleteAuth()...");
		
		return mapper.deleteAuth(userid);
	}

	
	


	

	
}
