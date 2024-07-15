package org.geo.mapper;

import org.apache.logging.log4j.message.Message;
import org.geo.domain.AuthVO;
import org.geo.domain.MemberVO;

public interface MemberMapper {

	public MemberVO readMember(String userid);
	
	public MemberVO findByUserId(String userid);
	
	public void insertMember(MemberVO vo);
	
	public void insertAuth(AuthVO vo);
	
	public int deleteMember(String userid);
	
	public int deleteAuth(String userid);

	public boolean selectUserid(String userid); //중복 Id 검색
		
	
}	
