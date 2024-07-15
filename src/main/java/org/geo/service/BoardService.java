package org.geo.service;

import java.util.List;

import org.geo.domain.BoardVO;
import org.geo.domain.Criteria;

public interface BoardService {
	
	public BoardVO getBoard(long bid);
	
	public void registerBoard(BoardVO board);
	
	public boolean modifyBoard(BoardVO board);
	
	public boolean removeBoard(long bid);
	
	public int removeBoardByUserid(String userid);
	
//	public List<BoardVO> getBoardList();
	
	public List<BoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
}
