package org.geo.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.log4j.Log4j2;


@Controller
@Log4j2
public class CommonController {

	@GetMapping("/accessError")
	public void accessError(Authentication auth, Model model) {

		log.debug("access Error : " + auth);

		model.addAttribute("msg", "Access Denied");
	}

	@GetMapping("/customLogin")
	public void loginInput(boolean error, String logout, ModelMap model) {

		log.info("error: " + error);
		log.info("logout: " + logout);

		if (error == true) {
			model.addAttribute("error", "아이디나 비밀번호가 일치하지 않습니다!");
			log.info("error 성공 ");

		} else {
			model.addAttribute("error", "");
			log.info("error 실패 ");
		}

		if (logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
	}

	@GetMapping("/customLogout")
	public void logoutGET() {

		log.info("custom logout");
	}

	@PostMapping("/customLogout")
	public void logoutPost() {

		log.info("post custom logout");
	}

}
