package org.geo.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.geo.domain.AuthVO;
import org.geo.domain.MemberVO;
import org.geo.service.BoardService;
import org.geo.service.MemberService;
import org.geo.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("member/*")
@Log4j2
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private JavaMailSenderImpl mailSender;

	
	@GetMapping("/get")
	public void get() {
		log.info("MemberController Get()...");
	}

	@GetMapping("/register")
	public void register(MemberVO vo, ModelMap model) {
		log.info("MemberController Get register()...");
		model.addAttribute("member", vo);
	}
	
	@PostMapping("/register")
	public String register(MemberVO vo, RedirectAttributes rttr) {
		log.info("MemberController Post register()... �Ϲ� ���� ����");
		memberService.registerMember(vo);
		memberService.insertAuth(new AuthVO(vo.getUserid(), "ROLE_USER"));
		return "redirect:/board/list";
	}
	
	@GetMapping("/registerAdmin")
	public void registerAdmin(MemberVO vo, ModelMap model) {
		log.info("MemberController Get registerAdmin()...");
		model.addAttribute("member", vo);
	}
	
	
	@PostMapping("/registerAdmin")
	public String registerAdmin(MemberVO vo, RedirectAttributes rttr) {
		log.info("MemberController Post register()... ������ ����");
		memberService.registerMember(vo);
		memberService.insertAuth(new AuthVO(vo.getUserid(), "ROLE_ADMIN"));
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(MemberVO vo, RedirectAttributes rttr) {
		log.info("MemberController Post remove()... ȸ�� ����");
		String userid = vo.getUserid();
		
		memberService.deleteAuth(userid);
		memberService.deleteMember(userid);
		boardService.removeBoardByUserid(userid);	// ������ ���õ� �Խñ� ����
		replyService.removeReplyByUserid(userid);	// ������ ���õ� ��� ����
		
		return "redirect:/board/list";
	}
	
	
	@GetMapping("/findByUserId")
	public void findByUserId(MemberVO vo, ModelMap model) {
		log.info("MemberController Get findByUserId()...");
		model.addAttribute("member", vo);
	}
	
	
	@PostMapping("/findByUserId")
	public String findByUserId(MemberVO vo, RedirectAttributes rttr) {
		log.info("MemberController Post findByUserId...");
		memberService.findByUserId(vo.getUserid());
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/getByAdmin")
	public void getByAdmin(String userid, ModelMap model) {
		
		log.info("MemberController getByAdmin()...");
		model.addAttribute("member", memberService.findByUserId(userid));

	}
	

	// �̸��� ����
	@PostMapping("/emailAuth")
	@ResponseBody
	public int emailAuth(String email) {

		log.info("���� ���� �̸��� �ּ� : " + email);

		// ������ ���� 111111 ~ 999999 (6�ڸ� ����)
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		// �̸��� ���� ���
		String setFrom = "adad0208@gmail.com"; // ���� ����� �̸��� �ּҷ� ����
		String toMail = email;
		String title = "ȸ������ ���� �̸��� �Դϴ�.";
		String content = "���� �ڵ�� " + checkNum + " �Դϴ�." + "<br>" + "�ش� ���� �ڵ带 ���� �ڵ� Ȯ�ζ��� �����Ͽ� �ּ���.";

		try {
			MimeMessage message = mailSender.createMimeMessage(); // Spring���� �����ϴ� mail API
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}

		log.info("�������� : " + checkNum);
		return checkNum;
	}

	// Id �ߺ� Ȯ��
	@PostMapping("/confirmUserid")
	@ResponseBody
	public ResponseEntity<Boolean> confirmUserid(String userid) {
		log.info("confirmUserid.........");
		log.info("userid : " + userid);
		boolean result = true;

		if (userid.trim().isEmpty()) {
			log.info("userid: " + userid);
			log.info("trim false ");
			result = false;
		} else {
			if (memberService.selectUserid(userid)) {
				log.info("false ");
				result = false;
			} else {
				log.info("true ");
				result = true;
			}
		}

		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	


}
