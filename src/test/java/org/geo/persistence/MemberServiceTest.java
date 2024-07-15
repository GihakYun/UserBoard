package org.geo.persistence;

import java.util.List;
import java.util.stream.IntStream;import org.apache.catalina.authenticator.jaspic.AuthConfigFactoryImpl;
import org.geo.controller.BoardController;
import org.geo.domain.AuthVO;
import org.geo.domain.Criteria;
import org.geo.domain.MemberVO;
import org.geo.domain.ReplyVO;
import org.geo.domain.SampleVO;
import org.geo.service.MemberService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		 "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j2
public class MemberServiceTest {
	
	
	@Autowired
	private MemberService service;
	
	
//	@Test
//	public void testCreate() {
//		log.info("testCreate()...");
//		
//		IntStream.rangeClosed(1, 10).forEach(i ->{
//			ReplyVO vo = new ReplyVO();
//			// 게시물 번호
//			vo.setBid(401L);
//			vo.setReply("댓글 테스트" + i);
//			vo.setReplyer("replyer" + i);
//			mapper.insert(vo);
//		});
//		
//	}
	
//	@Test
//	public void testRegistMember() {
//		MemberVO vo = new MemberVO();
//		vo.setUserid("userid1");
//		vo.setUserpw("pw1");
//		
//		service.registerMember(vo);
//		
//	}
	
	@Test
	public void testMemberDelete() {
		MemberVO vo = new MemberVO();
		vo.setUserid("new_id");
		
		service.deleteAuth(vo.getUserid());
		service.deleteMember(vo.getUserid());
		
	}
	
	
	
	
	
}
