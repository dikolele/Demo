package com.weihui.service;

import java.util.List;

import com.weihui.po.Person;

public interface PersonService {
	public void save(Person person);
	public List<Person> plist();
	public void delete(Person person);
	public void update(Person person);
	public Person queryByOne(Person person);
	public Person queryById(int id);
}
