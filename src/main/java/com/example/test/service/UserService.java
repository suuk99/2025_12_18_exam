package com.example.test.service;

import org.springframework.stereotype.Service;

import com.example.test.dao.UserDao;
import com.example.test.dto.User;

@Service
public class UserService {

	private UserDao userDao;
	
	public UserService(UserDao userDao) {
		this.userDao = userDao;
	}
	
	public boolean getUsersId(String loginId) {
		return this.userDao.getUsersId(loginId) > 0;
	}

	public void doJoin(String loginId, String pw, String name) {
		this.userDao.doJoin(loginId, pw, name);
	}

	public User getLoginUser(String loginId) {
		return this.userDao.getLoginUser(loginId);
	}

	public void updatePw(String newPw, String loginId) {
		this.userDao.updatePw(newPw, loginId);
	}
}
