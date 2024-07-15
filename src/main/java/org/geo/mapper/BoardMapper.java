package org.geo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.geo.domain.BoardVO;
import org.geo.domain.Criteria;

@Mapper
public interface BoardMapper {
	public List<BoardVO> getList();

	public void insert(BoardVO vo);

//	public void insertSelectKey(BoardVO vo);

	public BoardVO read(Long bId);
	
	public int delete(Long bId);

	public int update(BoardVO vo);
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public int deleteBoardByUserid(String userid);
}
