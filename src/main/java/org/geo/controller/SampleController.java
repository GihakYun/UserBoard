package org.geo.controller;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.geo.domain.SampleVO;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j2;

@RestController
@RequestMapping("/sample/*")
@Log4j2
public class SampleController {
	
	@GetMapping(value = "/getText", produces = "text/plain; charset=UTF-8")
	public String getText() {
		log.info("MIME TYPE: " + MediaType.TEXT_PLAIN_VALUE);
		
		return "�ȳ��ϼ���";
	}
	
	@GetMapping(value = "/getSample", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,
			MediaType.APPLICATION_XML_VALUE})
	public SampleVO getSample() {
		log.info("MIME TYPE: " + MediaType.TEXT_PLAIN_VALUE);
		
		return new SampleVO(112, "��Ÿ", "�ε�");
	}
	
	@GetMapping(value = "/getSample2")
	public SampleVO getSample2() {
		return new SampleVO(113, "����", "����");
	}
	
	@GetMapping(value = "/getList")
	public List<SampleVO> getList() {
		return IntStream.range(1, 10).mapToObj(i -> new SampleVO(i, i + "First", i + "Last"))
				.collect(Collectors.toList());
	}
	
}
