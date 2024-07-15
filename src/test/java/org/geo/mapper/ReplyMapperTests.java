package org.geo.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.geo.controller.BoardController;
import org.geo.domain.Criteria;
import org.geo.domain.ReplyVO;
import org.geo.domain.SampleVO;
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
	})@Log4j2
public class ReplyMapperTests {
	
	@Autowired
	private ReplyMapper mapper;
	
	@Test
	public void testMapper() {
		log.info("mapper : " + mapper);
	}
//	@Test
//	public void testCreate() {
//		log.info("testCreate()...");
//		
//		IntStream.rangeClosed(1, 10).forEach(i ->{
//			ReplyVO vo = new ReplyVO();
//			// 게시물 번호
//			vo.setBid(2L);
//			vo.setReply("댓글 테스트" + i);
//			vo.setReplyer("replyer" + i);
//			mapper.insert(vo);
//		});
//		
//	}
//	
//	@Test
//	public void testRead() {
//		Long targetRId = 11L;
//		
//		ReplyVO vo = mapper.read(targetRId);
//		
//		log.info("vo : " + vo);
//	}
	
//	@Test
//	public void testDelete() {
//		Long targetRId = 11L;
//		mapper.delete(targetRId);
//		
//	}
	
//	@Test
//	public void testUpdate() {
//		Long targetRId = 12L;
//		ReplyVO vo = mapper.read(targetRId);
//		
//		vo.setReply("updated reply");
//		vo.setReplyUpdate(1);
//		
//		int count = mapper.update(vo);
//		
//		log.info("UPDATE COUNT: " + count);
//	}
	
//	@Test
//	public void testList() {
//		Criteria cri = new Criteria();
//		List<ReplyVO> replies = mapper.getListWithPaging(cri, 2L);
//		
//		replies.forEach(reply -> log.info("reply : " + reply));
//		
//		SampleVO vo = new SampleVO();
//	}
	
//	@Test
//	public void testList2() {
//		Criteria cri = new Criteria(2, 10);
//		
//		List<ReplyVO> replies = mapper.getListWithPaging(cri, 2L);
//		
//		replies.forEach(reply -> log.info(reply));
//		
//	}
	
//	@Test
//	public void testReplyCount() {
//		log.info("Reply Count : " + mapper.getCountByBid(2L));
//		
//	}
	
	
	
}
