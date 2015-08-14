package com.weihui.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.weihui.po.Person;
import com.weihui.service.PersonService;


@Controller
@RequestMapping("/person")
public class PersonController {
	@Resource
	private PersonService personService;
	
	/**
	 * 增加person
	 * @param person
	 * @return
	 */
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public String save(@ModelAttribute Person person){
		personService.save(person);
		return "redirect:/person/query";
	}
	
	/**
	 * 查询person
	 * @param person
	 * @return
	 */
	@RequestMapping(value="/query",method=RequestMethod.GET)
	public String query(Model model){
		List<Person> plist=personService.plist();
		model.addAttribute("plist", plist);
		return "query";
	}
	
	/**
	 * 删除person
	 * @param person
	 * @return
	 */
	@RequestMapping(value="/delete/id/{id}",method=RequestMethod.GET)
	public String delete(@ModelAttribute Person person){
		personService.delete(person);
		return "redirect:/person/query";
	}

	/**
	 * 修改person
	 * @param person
	 * @return
	 */
	@RequestMapping(value="update/id/{id}",method=RequestMethod.POST)
	public String update(@PathVariable int id,Person person){
		Person person1=personService.queryById(id);
		
		person1.setName(person.getName());
		person1.setAge(person.getAge());
		personService.update(person1);
		return "redirect:/person/query";
	}
	
	@RequestMapping(value="/update/id/{id}",method=RequestMethod.GET)
	public String queryByOne(@ModelAttribute Person person,Model model){
		Person person1 = personService.queryByOne(person);
		model.addAttribute("person1", person1);
		return "update";
	}
	
	
	public PersonService getPersonService() {
		return personService;
	}
	public void setPersonService(PersonService personService) {
		this.personService = personService;
	}
	
	
}
