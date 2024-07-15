package org.geo.mapper;

import java.sql.Timestamp;
import java.util.List;

import org.apache.tomcat.jni.Local;
import org.geo.domain.BoardVO;
import org.geo.domain.Criteria;
import org.geo.mapper.BoardMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	    "file:src/main/webapp/WEB-INF/spring/root-context.xml",
	    "file:src/main/webapp/WEB-INF/spring/security-context.xml",
	    "file:src/main/webapp/WEB-INF/spring/servlet-context.xml"
	})
@Log4j2
public class BoardMapperTest {
//    Logger log = LoggerFactory.getLogger(MapperTest.class);


	@Autowired
	private BoardMapper mapper;

	
	@Test
	public void testTest() {
		log.info("test()...");

	}
	
//	@Test
//	public void testInsert() {
//		BoardVO board = new BoardVO();
//		board.setTitle("sampleTitle");
//		board.setContent("sampleContent");
//		board.setWriter("sampleWriter");
//		
//		log.info("=========================getPost()...");
//		
//		mapper.insert(board);
//	}
	
//	@Test
//	public void testGetList() {
//		
//		log.info("=========================testGetList()...");
//		
//		mapper.getList().forEach(board ->log.info(board));
//		
//	}
	
//	@Test
//	public void testRead() {
//		
//		log.info("=========================testRead()...");
//		BoardVO board = mapper.read(1L);
//		System.out.println("read: " + board);
//		
//	}
	
//	@Test
//	public void testDelete() {
//		
//		log.info("=========================testDelete()...");
//		mapper.delete(1L);
//		
//	}
	
//	@Test
//	public void testUpdate() {
//		BoardVO board = new BoardVO();
//		board.setBid(2L);
//		board.setTitle("updatedTitle");
//		board.setContent("updatedContent");
//		board.setWriter("updatedWriter");
//		board.setRegDate(new Timestamp(System.currentTimeMillis()));
//		log.info("=========================testUpdate()...");
//		mapper.update(board);
//		
//	}
	
//	@Test
//	public void testPaging() {
//		
//		log.info("=========================test Paging()...");
//		Criteria cri = new Criteria();
//		
//		List<BoardVO> list = mapper.getListWithPaging(cri);
//		
//		list.forEach(board -> log.info("board"  + board));
//		
//	}
	
//	@Test
//	public void testPaging() {
//
//		Criteria cri = new Criteria();
//		
//	    //10개씩 3페이지 
//	    cri.setPageNum(3);
//	    cri.setAmount(10);
//
//
//		List<BoardVO> list = mapper.getListWithPaging(cri);
//
//		list.forEach(board -> System.out.println(board));
//
//	}
}
