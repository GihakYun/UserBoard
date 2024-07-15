package org.geo.service;

import java.util.List;

import org.geo.domain.Criteria;
import org.geo.domain.ReplyPageDTO;
import org.geo.domain.ReplyVO;
import org.geo.mapper.ReplyMapper;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@AllArgsConstructor
@Log4j2
public class ReplySeriveImpl implements ReplyService {

	private ReplyMapper mapper;

	@Override
	public int register(ReplyVO vo) {
		log.info("ReplyServiceImpl register..." + vo);
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rid) {
		log.info("ReplyServiceImpl get..." + rid);

		return mapper.read(rid);
	}

	@Override
	public int modify(ReplyVO vo) {
		log.info("ReplyServiceImpl modify..." + vo);

		return mapper.update(vo);

	}

	@Override
	public int remove(Long rid) {
		log.info("ReplyServiceImpl remove..." + rid);

		return mapper.delete(rid);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bid) {
		log.info("ReplyServiceImpl getListPage..." + bid);

		return new ReplyPageDTO(mapper.getCountByBid(bid), mapper.getListWithPaging(cri, bid));
	}

	@Override
	public int removeReplyByUserid(String userid) {
		log.info("ReplyServiceImpl removeReplyByUserid..." + userid);

		return mapper.deleteReplyByUserid(userid);
	}

}
