package com.kedu.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kedu.commons.EncryptionUtils;
import com.kedu.dao.MemberDAO;
import com.kedu.dto.MemberDTO;

@Controller
@RequestMapping("/member")
public class RegisterController {
	
	@Autowired
	private MemberDAO dao;
	
	@RequestMapping("/signup")
	public String signup() {
		return "member/signup";
	}
	
	@RequestMapping("/register")
	public String register(MemberDTO dto) throws Exception {
		dto.setPw(EncryptionUtils.encryptSHA512(dto.getPw()));
		dao.insert(dto);
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping("/idcheck")
	public boolean idcheck(String id) throws Exception {
	    return dao.idCheck(id);
	}
}
