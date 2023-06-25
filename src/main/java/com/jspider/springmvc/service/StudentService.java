package com.jspider.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jspider.springmvc.pojo.StudentPojo;
import com.jspider.springmvc.repository.StudentRepository;

@Service
public class StudentService {
	@Autowired
	StudentRepository repository;
	
	public StudentPojo addStudent(String name, String email, long mobile, String address) {
		 
		StudentPojo addStudent = repository.addStudent(name,email,mobile,address);
		
		return addStudent;
		
}

	public StudentPojo searchStudent(int id) {
	
		StudentPojo pojo = repository.searchStudent(id);
		return pojo;
		
	}

	public List<StudentPojo> allStudents() {
		List<StudentPojo> students = repository.allStudents();
		return students;
		
	}

	public StudentPojo removeStudent(int id) {
		StudentPojo pojo = (StudentPojo) repository.removeStudent(id);
		return pojo;
		
	}

	public boolean loginValidation(String username, String password) {
		boolean validation = repository.loginValidation(username,password);
		System.out.println(validation);
		return validation;
		
		
	}

	public StudentPojo updatinfo(int id, String name, String email, String mobile, String address) {
		StudentPojo updateinfo = repository.updateinfo(id,name,email,mobile,address);
		
		return updateinfo;
	
		
	}

	public StudentPojo getData(int id) {
		StudentPojo pojo = repository.getData(id);
		return  pojo;
	}

	
	
	


}
