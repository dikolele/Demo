package com.weihui.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.weihui.dao.PersonDAO;
import com.weihui.po.Person;


@Service
public class PersonServiceImpl implements PersonService {

	@Autowired  //自动装配           @Qualifier   精确装配
	private PersonDAO personDao;//构造器
	
	@Transactional(propagation=Propagation.REQUIRED)
	public void save(Person person) {
		personDao.save(person);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	public List<Person> plist() {
		return personDao.plist();
	}

	@Transactional(propagation=Propagation.REQUIRED)
	public void delete(Person person) {
		personDao.delete(person);
	}
	
	@Transactional(propagation=Propagation.REQUIRED)
	public void update(Person person) {
		personDao.update(person);
	}
	
	@Transactional(propagation=Propagation.REQUIRED)
	public Person queryByOne(Person person) {	
		return personDao.queryByOne(person);
	}
	
	@Transactional(propagation=Propagation.REQUIRED)
	public Person queryById(int id) {	
		return personDao.queryById(id);
	}
	
	public PersonDAO getPersonDao() {
		return personDao;
	}

	public void setPersonDao(PersonDAO personDao) {
		this.personDao = personDao;
	}

	

	

	

	
	
}
