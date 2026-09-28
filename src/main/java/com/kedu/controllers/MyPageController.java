package com.kedu.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kedu.dto.MemberDTO;

@Controller
@RequestMapping("/member")
public class MyPageController {
	@Autowired
	MemberDAO dao;
	
	@RequestMapping("/mypage")
	public String mypage (MemberDTO dto, Session session, Model model) {		
		model.addAttribute("list", dao.listAll(dto));
		return "mypage";
	}
	@RequestMapping("/update")
	public String update( MemberDTO dto) {
		dao.update(dto);

		return "redirect:/mypage";
	}
}
