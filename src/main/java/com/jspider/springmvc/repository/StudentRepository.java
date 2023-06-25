package com.jspider.springmvc.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.jspider.springmvc.pojo.AdminPojo;
import com.jspider.springmvc.pojo.StudentPojo;

@Repository
public class StudentRepository {
	private static EntityManagerFactory factory;
	private static EntityManager manager;
	private static EntityTransaction transaction;
	private static Query query;
	private static String jpql;
	
	private static void openConnection() {
		factory=Persistence.createEntityManagerFactory("mvc");
		manager=factory.createEntityManager();
		transaction=manager.getTransaction();
	}
	
	private static void closeConnection() {
		if(factory!=null) {
			factory.close();
		}
		if(manager!=null) {
			manager.close();
		}
		if(transaction!=null) {
			if(transaction.isActive()) {
				transaction.rollback();
			}
		}
	}
	
	
	

	public StudentPojo addStudent(String name, String email, long mobile, String address) {
		openConnection();
		transaction.begin();
		StudentPojo pojo=new StudentPojo();
		pojo.setName(name);
		pojo.setEmail(email);
		pojo.setMobile(mobile);
		pojo.setAddress(address);
		
		manager.persist(pojo);
		
		
		if(pojo!=null) {
			transaction.commit();
			closeConnection();
			return pojo;
		}
		
		transaction.commit();
		closeConnection();
		return pojo;

		}

	public StudentPojo searchStudent(int id) {
		openConnection();
		transaction.begin();
		StudentPojo pojo = manager.find(StudentPojo.class, id);
		
		if(pojo!=null) {
			return pojo;
		}
		transaction.commit();
		
		closeConnection();
		
		
		return null;
		
	}

	public List<StudentPojo> allStudents() {
		openConnection();
		transaction.begin();
		jpql="from StudentPojo";
		query=manager.createQuery(jpql);
		List<StudentPojo> Students = query.getResultList();
		
		transaction.commit();
		
		closeConnection();
		
		return Students;
		
	}

	public StudentPojo removeStudent(int id) {
		openConnection();
		transaction.begin();
		StudentPojo pojo = manager.find(StudentPojo.class, id);
		manager.remove(pojo);
		transaction.commit();
		closeConnection();
		return pojo;
		
	}

	public boolean loginValidation(String username, String password) {
		openConnection();
		transaction.begin();
			AdminPojo credentail1 = manager.find(AdminPojo.class, 1);
			String username2 = credentail1.getUsername();
			String password2 = credentail1.getPassword();
		
		if(username.equals(username2)&& (password.equals(password2))) {
			transaction.commit();
			closeConnection();
			return true;
		}
		
		transaction.commit();
		closeConnection();
		return false;
		
	}

	public StudentPojo updateinfo(int id, String name, String email, String mobile, String address) {
		openConnection();
		transaction.begin();
		StudentPojo pojo = manager.find(StudentPojo.class, id);
		if(name!="") {
		pojo.setName(name);
		}
		if(email!="") {
			pojo.setEmail(email);
			}
		if(mobile!="") {
			long mobile1=Long.parseLong(mobile); 
			pojo.setMobile(mobile1);
			}
		if(address!="") {
			pojo.setAddress(address);
			}
	manager.persist(pojo);
		

		
		transaction.commit();
		closeConnection();
		
		return pojo;
		
	}

	public StudentPojo getData(int id) {
		
		openConnection();
		transaction.begin();
		StudentPojo pojo = manager.find(StudentPojo.class, id);
		
		if(pojo!=null) {
			return pojo;
		}
		transaction.commit();
		
		closeConnection();
		
		
		return null;
	}

	


}
