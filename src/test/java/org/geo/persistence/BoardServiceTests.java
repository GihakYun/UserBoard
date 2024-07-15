package org.geo.persistence;

import java.time.LocalDateTime;

import org.geo.domain.BoardVO;
import org.geo.domain.Criteria;
import org.geo.mapper.BoardMapper;
import org.geo.service.BoardService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	    "file:src/main/webapp/WEB-INF/spring/root-context.xml",
	    "file:src/main/webapp/WEB-INF/spring/security-context.xml"
	})
@Log4j2
public class BoardServiceTests {

	@Autowired
	private BoardService service;

	
//	@Test
//	public void testService() {
//		log.info(service);
//		
//		
//	}
	
	
//	@Test
//	public void testReg() {
//		BoardVO board = new BoardVO();
//		board.setBTitle("new_title");
//		board.setBContent("new_Content");
//		board.setBWriter("new_writer");
//		board.setBRegdate(LocalDateTime.now());
//		
//		service.registerBoard(board);
//	}
	
//	@Test
//	public void testGetList() {
//		
//		service.getList(new Criteria(2, 10)).forEach(board -> System.out.println(board));
//	}
	@Test
	public void testUpdate() {
		
		service.getList(new Criteria(2, 10)).forEach(board -> System.out.println(board));
	}
}
