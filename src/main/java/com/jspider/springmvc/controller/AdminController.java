package com.jspider.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jspider.springmvc.pojo.AdminPojo;
import com.jspider.springmvc.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	AdminService service;
	
	@GetMapping("/logout")
	public String logout(ModelMap map,HttpSession session) {
		session.invalidate();
		map.addAttribute("msg", "Logged out succesfully. ");
		return "Login";
	}
		
	
	@PostMapping("/login")
	public String login(@RequestParam String username,@RequestParam String password,ModelMap map,HttpSession session) {
	
		  AdminPojo pojo = service.login(username,password);
		  if(pojo!=null) {
			  session.setAttribute("login",pojo );
			  session.setMaxInactiveInterval(200);
			  return "Home";
		  }
		 map.addAttribute("msg", "Invalid credentials.  Try again. ");
		 return "Login";
			
	}
	
	@PostMapping("/createAdmin")
	public String createAdmin(@RequestParam String username,@RequestParam String password,ModelMap map) {
		AdminPojo pojo=service.addAdmin(username,password);
		if(pojo!=null) {
			map.addAttribute("msg", "Admin account created. Login now.");
			return "Login";
		}
		map.addAttribute("msg", "Failed to create account. Try again.");
		return "CreateAccount";
	}
	
	@GetMapping("/createAdmin")
	public String createPage(ModelMap map) {
		List<AdminPojo> admin = service.getAdmin();
		if(admin.isEmpty()) {
			return "createAdmin";
			
		}
		map.addAttribute("msg", "Admin account already exists. ");
		return "Login";
	}

}
