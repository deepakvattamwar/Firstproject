package com.jspider.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jspider.springmvc.pojo.AdminPojo;
import com.jspider.springmvc.repository.AdminRepository;

@Service
public class AdminService {
	@Autowired
	AdminRepository repository;
	public AdminPojo login(String username, String password) {
		AdminPojo pojo = repository.login(username,password);
		return pojo;
	
		
	}
	public AdminPojo addAdmin(String username, String password) {
		AdminPojo pojo = repository.addAdmin(username,password);
		return pojo;
	}
	public List<AdminPojo> getAdmin() {
		List<AdminPojo> admin=repository.getAdmin();
		return admin;
		
	}

}
