package com.example.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test.dto.User;
import com.example.test.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	private UserService userService;
	
	public UserController(UserService userService) {
		this.userService = userService;
	}
	
	@GetMapping("/test/user/join")
	public String join() {
		return "test/user/join";
	}
	
	@PostMapping("/test/user/doJoin")
	@ResponseBody
	public String doJoin(String loginId, String pw, String pwChk, String name) {
		
		if(loginId == null || loginId.isEmpty() ) {
			return "<script>alert('아이디를 입력하세요.'); history.back();</script>";
		}
		
		if(this.userService.getUsersId(loginId)) {
			return "<script>alert('이미 사용중인 아이디입니다..'); history.back();</script>";
		}
		
		if(pw == null || pw.isEmpty() ) {
			return "<script>alert('비밀번호를 입력하세요.'); history.back();</script>";
		}
		
		if(pwChk == null || pwChk.isEmpty() ) {
			return "<script>alert('비밀번호 확인을 입력하세요.'); history.back();</script>";
		}
		
		if(!pw.equals(pwChk)) {
			return "<script>alert('비밀번호가 일치하지 않습니다.'); history.back();</script>";
		}
		
		if(name == null || name.isEmpty() ) {
			return "<script>alert('이름을 입력하세요.'); history.back();</script>";
		}
		
		this.userService.doJoin(loginId, pw, name);
		
		return "<script>alert('회원가입이 완료되었습니다.'); location.href='/test/home/main';</script>";
	}
	
	@GetMapping("/test/user/login")
	public String login() {
		return "test/user/login";
	}
	
	@PostMapping("/test/user/doLogin")
	@ResponseBody
	public String doLogin(HttpSession session, String loginId, String pw) {
		
		User user = this.userService.getLoginUser(loginId);
		
		if(loginId == null || loginId.isEmpty()) {
			return "<script>alert('아이디를 입력하세요.'); history.back();</script>";
		}
		
		if(!loginId.equals(user.getLoginId())) {
			return "<script>alert('아이디와 비밀번호를 확인하세요.'); history.back();</script>";
		}
		
		if(pw == null || pw.isEmpty() ) {
			return "<script>alert('비밀번호를 입력하세요.'); history.back();</script>";
		}
		
		if(!pw.equals(user.getPw())) {
			return "<script>alert('아이디와 비밀번호를 확인하세요.'); history.back();</script>";
		}
		
		session.setAttribute("loginUserId", user.getLoginId());
		session.setAttribute("loginUserName", user.getName());
		
		return "<script>alert('로그인이 되었습니다.'); location.href='/test/home/main';</script>";
	}
	
	@GetMapping("/test/user/logout")
	@ResponseBody
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "<script>alert('로그아웃이 되었습니다.'); location.href='/test/home/main';</script>";
	}
	
	@GetMapping("/test/user/changePw")
	public String changePw() {
		return "test/user/changePw";
	}
	
	@PostMapping("/test/user/doChange")
	@ResponseBody
	public String doChange(HttpSession session,  String newPw) {
		
		String loginId = (String) session.getAttribute("loginUserId");
		
		this.userService.updatePw(newPw, loginId);
		
		return "<script>alert('비밀번호 변경이 완료 되었습니다.'); location.href='/test/home/main';</script>";
	}
}