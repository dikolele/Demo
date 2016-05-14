package com.weihui.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@ResponseBody
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public Person save(@RequestParam String name, @RequestParam int age){
		Person person = new Person();
		person.setAge(age);
		person.setName(name);
		personService.save(person);
		return person; 
	}
	
	/**
	 * 查询person
	 * @param person
	 * @return
	 */
	@RequestMapping(value="/query",method=RequestMethod.GET)
	//@ResponseBody
	public String query(Model model){
		List<Person> plist=personService.plist();
		model.addAttribute("plist", plist);
		return "query";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public List<Person> query() {
		return personService.plist();
	}
	
	/**
	 * 删除person
	 * @param person
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public Person delete(@RequestParam int id ){
		Person person1=personService.queryById(id);
		personService.delete(person1);
		return person1;
	}

	/**
	 * 修改person
	 * @param person
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/updateto",method=RequestMethod.POST)
	public Person update(@RequestParam String name, @RequestParam int age,@RequestParam int id){
		Person person1=personService.queryById(id);
		person1.setAge(age);
		person1.setName(name);
		personService.update(person1);
		return person1;
	}
	

	@RequestMapping(value="/update",method=RequestMethod.GET)
	public ModelAndView queryByOne(@RequestParam int id){
		ModelAndView mav = new ModelAndView();
		Person person1=personService.queryById(id);
		mav.addObject("person", person1);
		mav.setViewName("update");
		return mav;
		//将person对象存入mav中，将视图层update存入mav中，将二者渲染到一起，这样在视图update中就可以通过jstl使用person对象，
		//person对象的属性就可以传送到视图update中。
	}
	
	
	public PersonService getPersonService() {
		return personService;
	}
	public void setPersonService(PersonService personService) {
		this.personService = personService;
	}
	
	
}
