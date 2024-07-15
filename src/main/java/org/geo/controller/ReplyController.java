package org.geo.controller;

import java.util.List;

import javax.print.attribute.standard.Media;

import org.apache.catalina.connector.Response;
import org.geo.domain.Criteria;
import org.geo.domain.ReplyPageDTO;
import org.geo.domain.ReplyVO;
import org.geo.service.ReplyService;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController
@RequestMapping("replies/*")
@AllArgsConstructor
@Log4j2	
public class ReplyController {

	
	private ReplyService service;		// @RequiredArgsConstructor 占쏙옙占쏙옙求쨉占� 占쏙옙占쏙옙 占쏙옙占쏙옙 @Autowired 占쏙옙占� 占쏙옙占쌩울옙 占쏙옙치占쏙옙
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/new", consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
		log.info("ReplyController create()...");
		log.info("ReplyVO:" + vo);
		
		int insertCount = service.register(vo);
		
		log.info("ReplyInsert Count : " + insertCount);
		
		return insertCount == 1? new ResponseEntity<String>("success", HttpStatus.OK) :
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		
		
	}
	
	@GetMapping(value = "/pages/{bid}/{page}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page,
			@PathVariable("bid") Long bid ) {
		log.info("Reply Controller getList().....");
		
		Criteria cri = new Criteria(page, 10);
		
		log.info(cri);
		
		HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON_UTF8); // 응답 데이터의 MIME 타입을 JSON으로 설정
		return new ResponseEntity<>(service.getListPage(cri, bid), headers, HttpStatus.OK);	
	}
	
	@GetMapping(value = "/{rid}", produces = {MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("rid") Long rid) {
		log.info("get: " + rid);
		
		HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON_UTF8); // 응답 데이터의 MIME 타입을 JSON으로 설정
		return new ResponseEntity<ReplyVO>(service.get(rid), headers, HttpStatus.OK);
	}
	
	@DeleteMapping(value = "/{rid}", produces = {MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rid") Long rid) {
		log.info("remove: " + rid);
		
		return service.remove(rid)  == 1
			? new ResponseEntity<>("success", HttpStatus.OK)
			:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value = "/{rid}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("rid") Long rid) {
		vo.setRid(rid);
		log.info("rid : " + rid);
		log.info("modify : " + vo);
		
		return service.modify(vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
