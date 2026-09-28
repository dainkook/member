package com.kedu.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kedu.dao.MemberDAO;
import com.kedu.dto.MemberDTO;

@Controller
@RequestMapping("/member")
public class MyPageController {
	@Autowired
	MemberDAO dao;
	
	@RequestMapping("/mypage")
	public String mypage (MemberDTO dto, HttpSession session, Model model) {
		String id = (String)session.getAttribute("loginId");
		model.addAttribute("list", dao.listAll(id));
		return "mypage";
	}
}
