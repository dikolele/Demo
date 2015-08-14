package com.weihui.dao;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.weihui.po.Person;

@Repository
public class PersonDAOImpl implements PersonDAO {
	
	@Resource
	@PersistenceContext(unitName="persistenceUnit")
	private EntityManager entityManager;
	
	public void save(Person person) {
		try {
			entityManager.persist(person);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Person> plist() {
		List<Person> plist=null;
		try {
			plist=entityManager.createQuery("from Person").getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
			return plist;
	}
	
	public void delete(Person person) {
		try {
			Person person1=entityManager.find(Person.class, person.getId());
			entityManager.remove(person1);	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void update(Person person) {
		try {
			entityManager.merge(person);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Person queryByOne(Person person) {
		// TODO Auto-generated method stub
		Person person1=entityManager.find(Person.class, person.getId());
		return person1;
	}
	
	
	
	public Person queryById(int id) {
		// TODO Auto-generated method stub
		Person person=entityManager.find(Person.class,id);
		return person;
	}

	
	
	public EntityManager getEntityManager() {
		return entityManager;
	}


	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	
}
