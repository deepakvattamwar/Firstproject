package com.jspider.springmvc.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.jspider.springmvc.pojo.AdminPojo;

@Repository
public class AdminRepository {
	
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

	public AdminPojo login(String username, String password) {
		openConnection();
		transaction.begin();
		AdminPojo pojo=manager.find(AdminPojo.class, 1);
		String username2 = pojo.getUsername();
		String password2 = pojo.getPassword();
		if(username.equals(username2)&& (password.equals(password2))) {
			transaction.commit();
			closeConnection();
			return pojo;
		}
		
		transaction.commit();
		closeConnection();
		return null;
		
	}

	public AdminPojo addAdmin(String username, String password) {
		openConnection();
		transaction.begin();
		AdminPojo pojo=new AdminPojo();
		pojo.setUsername(username);
		pojo.setPassword(password);
		manager.persist(pojo);
		transaction.commit();
		closeConnection();
		
		return pojo;
		
	}

	public List<AdminPojo> getAdmin() {
		openConnection();
		transaction.begin();
		jpql="from AdminPojo";
		query=manager.createQuery(jpql);
		List<AdminPojo> admin = query.getResultList();
		transaction.commit();
		closeConnection();
		return admin;
		
		
	}

}
