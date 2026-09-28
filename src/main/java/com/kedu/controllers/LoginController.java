package com.kedu.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kedu.commons.EncryptionUtils;
import com.kedu.dao.MemberDAO;

@Controller
@RequestMapping("/member")
public class LoginController {
	
	@Autowired
	private MemberDAO dao;
	
	@RequestMapping("/login")
	public String login(String id, String pw, HttpSession session) throws Exception {
		pw = EncryptionUtils.encryptSHA512(pw);
		boolean result = dao.login(id, pw);
		if (result) {
			session.setAttribute("loginId", id);
		}
		return "redirect:/";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}

}
