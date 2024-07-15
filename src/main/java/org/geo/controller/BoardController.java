package org.geo.controller;

import org.geo.domain.BoardVO;
import org.geo.domain.Criteria;
import org.geo.domain.PageDTO;
import org.geo.service.BoardService;
import org.geo.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("board/*")
@Log4j2
public class BoardController {

	
	@Autowired
	private BoardService boardService;		
	
	
	
	@GetMapping("/list")
	public void list(Criteria cri, ModelMap model) {
		
		
		log.info("list: " + cri);
		
		model.addAttribute("list", boardService.getList(cri));
		
		int total = boardService.getTotal(cri);
		
		log.info("total : " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}
	
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register(BoardVO board, ModelMap model) {
		
		log.info("BoardController getRegisterPage()...");
		model.addAttribute("board", board);
		
	}
	
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(BoardVO board, RedirectAttributes rttr) {
		
		log.info("BoardController register()...");
		
		boardService.registerBoard(board);
		
		
		return "redirect:/board/list";
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bid") long bid, @ModelAttribute("cri")Criteria cri, ModelMap model) {
		
		log.info("BoardController get(), modify()..." + boardService.getBoard(bid));
		log.info("Cir : " + cri);
		
		model.addAttribute("board", boardService.getBoard(bid));
	}
	
	@PreAuthorize("principal.username == #board.writer")
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("BoradController modify()...");
		
		
		if(boardService.modifyBoard(board)) {	// modify 실행
			rttr.addFlashAttribute("result", "success");
			rttr.addAttribute("bid", board.getBid());	// bid 값을 url에 파라미터로 추가
		}
		return "redirect:/board/get";
	}
	
	@GetMapping("/remove")
	public void remove() {
		log.info("BoardController remove()...");
		
		
		
	}
	
	@PreAuthorize("principal.username == #board.writer")
	@PostMapping("/remove")
	public String remove(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("BoradController remove()...");
		
		if(boardService.removeBoard(board.getBid())) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addFlashAttribute("pageNum", cri.getPageNum());
		rttr.addFlashAttribute("amount", cri.getAmount());
		
		return "redirect:/board/list";
		
	}
	
	@PostMapping("/removeByAdmin")
	public String removeByAdmin(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("BoradController removeByAdmin()...");
		
		if(boardService.removeBoard(board.getBid())) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addFlashAttribute("pageNum", cri.getPageNum());
		rttr.addFlashAttribute("amount", cri.getAmount());
		
		return "redirect:/board/list";
		
	}
	
	
}
