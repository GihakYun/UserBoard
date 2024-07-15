package org.geo.mapper;

import java.util.List;
import java.util.stream.IntStream;import org.apache.catalina.authenticator.jaspic.AuthConfigFactoryImpl;
import org.geo.controller.BoardController;
import org.geo.domain.AuthVO;
import org.geo.domain.Criteria;
import org.geo.domain.MemberVO;
import org.geo.domain.ReplyVO;
import org.geo.domain.SampleVO;
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
public class MemberMapperTests {
	
	@Autowired
	private MemberMapper mapper;
	
	
	@Autowired
	@Qualifier("bcryptPasswordEncoder")
	private PasswordEncoder pwencoder;
	
//	@Test
//	public void testMapper() {
//		log.info("mapper : " + mapper);
//	}
	
	
	@Test
	public void testRegistAdmin() {
		
		MemberVO vo = new MemberVO();
		vo.setUserid("admin");
		vo.setUsername("admin");
		vo.setUserpw(pwencoder.encode("1234"));
		vo.setEmail("adad0208@gmail.com");
		
		mapper.insertMember(vo);
		mapper.insertAuth(new AuthVO("admin", "ROLE_ADMIN"));
		
	}
	
	
	
}
