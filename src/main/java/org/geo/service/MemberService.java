package org.geo.service;

import java.util.List;

import org.geo.domain.AuthVO;
import org.geo.domain.BoardVO;
import org.geo.domain.Criteria;
import org.geo.domain.MemberVO;

public interface MemberService {
	
	public MemberVO getMember(String userid);
	public MemberVO findByUserId(String userid);

	public void registerMember(MemberVO vo);
	
	public void insertAuth(AuthVO vo);
	public int deleteMember(String userid);
	public int deleteAuth(String userid);
	
	public boolean selectUserid(String userid);
	
}
