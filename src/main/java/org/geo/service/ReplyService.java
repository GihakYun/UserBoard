package org.geo.service;

import java.util.List;

import org.geo.domain.Criteria;
import org.geo.domain.ReplyPageDTO;
import org.geo.domain.ReplyVO;

public interface ReplyService {

	public int register(ReplyVO vo);
	
	public ReplyVO get(Long rid);
	
	public int modify(ReplyVO vo);
	
	public int remove(Long rid);
	
	public int removeReplyByUserid(String userid);
 	
	public ReplyPageDTO getListPage(Criteria cri, Long bid);
}
