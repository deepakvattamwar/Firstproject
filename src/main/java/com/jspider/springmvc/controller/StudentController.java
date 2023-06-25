package com.jspider.springmvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.jspider.springmvc.pojo.AdminPojo;
import com.jspider.springmvc.pojo.StudentPojo;
import com.jspider.springmvc.service.StudentService;

import net.bytebuddy.asm.Advice.OffsetMapping.ForOrigin.Renderer.ForReturnTypeName;
@Controller
public class StudentController {
	@Autowired
	StudentService service;
	
	@GetMapping("/home")
	public String home(@SessionAttribute (name="login",required = false) AdminPojo admin,ModelMap map) {
		if(admin!=null) {
		return "Home";
		}
		map.addAttribute("msg", "Login in first");
		return "Login";
	}
	@PostMapping("/add")
	public String addStudent(@RequestParam String name,
			@RequestParam String email,
			@RequestParam long mobile,
			@RequestParam String address,
			ModelMap model,@SessionAttribute (name="login",required = false) AdminPojo admin) {
if(admin!=null) {
	StudentPojo addStudent = service.addStudent(name,email,mobile,address);
	if(addStudent!=null) {
	model.addAttribute("msg", "Details inserted Succesfully ");
	return "Add";
	}

	model.addAttribute("msg", "Details not inserted");

	return "Add";
}
model.addAttribute("msg", "Login in first");
return "Login";
	}
	@GetMapping("/add")
	public String add(@SessionAttribute (name="login",required = false) AdminPojo admin,ModelMap map) {
		if(admin!=null) {
			return "Add";
		}
		map.addAttribute("msg", "Login in first");
		return "Login";
	}
	
	@PostMapping("/search")
	public String searchStudent(@RequestParam int id,ModelMap map,@SessionAttribute (name="login",required = false) AdminPojo admin) {
		if(admin!=null) {
			StudentPojo pojo = service.searchStudent(id);
			if(pojo!=null) {
				map.addAttribute("student", pojo);
				map.addAttribute("msg", "Student data found");
				return "Search";
			}
			map.addAttribute("msg", "Student data does not exists");
			return "Search";
		}
		map.addAttribute("msg", "Login in first");
		return "Login";
	}
	
	
   
	
	@GetMapping("/remove")
	public String remove(ModelMap map,@SessionAttribute (name="login",required = false) AdminPojo admin) {
		if(admin!=null) {
			List<StudentPojo> students = service.allStudents();
			map.addAttribute("student", students);
			return "Remove";
		}
		map.addAttribute("msg", "Login in first");
		return "Login";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam int id,ModelMap map,@SessionAttribute (name="login",required = false) AdminPojo admin) {
		if(admin!=null) {
			StudentPojo pojo = service.removeStudent(id);
			if(pojo!=null) {
				map.addAttribute("msg", "record removed Succesfully");
				List<StudentPojo> students = service.allStudents();
				map.addAttribute("student", students);
				return "Remove";
			}
			map.addAttribute("msg", "Student data does not exists");
			return "Remove";
		}
		map.addAttribute("msg", "Login in first");
		return "Login";
	}
	@GetMapping("/update")
	public String update(ModelMap map,@SessionAttribute (name="login",required = false) AdminPojo admin) {
		if(admin!=null) {
			List<StudentPojo> students = service.allStudents();
			map.addAttribute("students", students);
			return "Update";
		}
		map.addAttribute("msg", "Login in first");
		return "Login";
	}
	
	@PostMapping("/update")
	public String updateStudent(@RequestParam int id,ModelMap map,@SessionAttribute (name="login",required = false) AdminPojo admin) {
		
		if(admin!=null) {
			StudentPojo pojo = service.searchStudent(id);
			if(pojo!=null) {
			map.addAttribute("student", pojo);
			return "Update";
			}
			List<StudentPojo> students = service.allStudents();
			map.addAttribute("students", students);
			map.addAttribute("msg", "Student data does not exists");
			return "Update";
		}
		map.addAttribute("msg", "Login in first");
		return "Login";
	}
	@PostMapping("/updateData")
public String updateStudent(@RequestParam int id,@RequestParam String name,@RequestParam String email,@RequestParam String mobile,@RequestParam String address,ModelMap map,@SessionAttribute (name="login",required = false) AdminPojo admin) {
		if(admin!=null) {

			StudentPojo updatinfo = service.updatinfo(id,name,email,mobile,address);
			
			if(updatinfo!=null) {
				map.addAttribute("msg", "record update Succesfully");
				List<StudentPojo> students = service.allStudents();
				map.addAttribute("students", students);
					
			}
			return "Update";
		}
		map.addAttribute("msg", "Login in first");
		return "Login";
	}
	
	@GetMapping("/search")
	public String search(@SessionAttribute (name="login",required = false) AdminPojo admin,ModelMap map) {
		if(admin!=null) {
			return "Search";
		}
		map.addAttribute("msg", "Login in first");
		return "Login";
	}
	
	


	
}