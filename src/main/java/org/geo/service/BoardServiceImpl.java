package org.geo.service;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

import org.geo.controller.BoardController;
import org.geo.domain.BoardVO;
import org.geo.domain.Criteria;
import org.geo.mapper.BoardMapper;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Service
@AllArgsConstructor
@Log4j2
public class BoardServiceImpl implements BoardService{

	private BoardMapper mapper;
	
	@Override
	public BoardVO getBoard(long bid) {
		log.info("getBoard()..........." + bid);
		
		return mapper.read(bid);
	}

	@Override
	public void registerBoard(BoardVO board) {
		log.info("registerBoard()..........." + board);
		
		mapper.insert(board);
	}

	@Override
	public boolean modifyBoard(BoardVO board) {
		log.info("modifyBoard()..........." + board);
		
		return mapper.update(board) == 1;
	}

	@Override
	public boolean removeBoard(long bid) {
		log.info("removeBoard()..........." + bid);
		
		return mapper.delete(bid) == 1;
	}

//	@Override
//	public List<BoardVO> getBoardList() {
//		log.info("ServiceImpl getBoardList()......");
//		
//		
//		return mapper.getList();
//	}
	
//	@Override
//	public List<BoardVO> getBoardList() {
//		log.info("ServiceImpl getBoardList()......");
//		
//		
//		return mapper.getList();
//	}
	
	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("ServiceImpl getList()......");
		
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int removeBoardByUserid(String userid) {
		log.info("ServiceImpl removeBoardByUserid()......");
		return mapper.deleteBoardByUserid(userid);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		log.info("get Total count()......");
		return mapper.getTotalCount(cri);
	}



	
}
