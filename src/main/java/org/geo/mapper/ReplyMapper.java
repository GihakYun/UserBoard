package org.geo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.geo.domain.Criteria;
import org.geo.domain.ReplyVO;

@Mapper
public interface ReplyMapper {
	
	public int insert(ReplyVO vo);
	
	public ReplyVO read(Long bid);
	
	public int delete(Long rid);	// 특정 댓글 삭제
	
	public int update(ReplyVO reply);
	
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri,
			@Param("bid")Long bid);
	
	public int getCountByBid(Long bid);
	
	public int deleteReplyByUserid(String userid);
}
