package com.jspider.springmvc.pojo;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Data
@Table(name="Login_details")
public class AdminPojo {
	@Id
	@GeneratedValue(strategy = GenerationType.TABLE)
	private int id;
	private String username;
	private String password;

	}


