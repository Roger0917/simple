package com.zhgl.module.common.web;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import sun.util.logging.resources.logging;

import com.sun.org.apache.regexp.internal.recompile;
import com.zhgl.module.bean.IdentityGenerator;
import com.zhgl.module.common.ebean.Project;
import com.zhgl.module.common.ebean.Student;
import com.zhgl.module.common.service.StudentService;
import com.zhgl.module.common.service.StudentServiceBean;
import com.zhgl.module.document.ebean.Category;
import com.zhgl.util.WebUtil;
import com.zhgl.util.dao.PageView;
import com.zhgl.util.dao.QueryResult;

@Controller
@RequestMapping("/stu/")
public class StudentController {

	@Autowired
	private StudentService studentService;
	
	private ModelAndView mav;
	
	private int maxresult = 3;
	
	@RequestMapping("create")
	public ModelAndView create() {
		ModelAndView mav = new ModelAndView("student/student_create");
		return mav;
	}
	
	@RequestMapping("save")
	public ModelAndView save(@ModelAttribute Student student){
		ModelAndView mav = new ModelAndView("student/student_create");
		studentService.save(student);
		return mav;
	}
	
	/*@RequestMapping("listAll")
	@ResponseBody
	public List listAll(@RequestParam(required = false, defaultValue = "1") int page){
		PageView<Student> pageView = new PageView<>(maxresult, page);
		
		LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("number", "asc");
		StringBuffer jpql = new StringBuffer("");
		List<Object> params = new ArrayList<Object>();
		
		pageView.setQueryResult(studentService.getScrollData(pageView.getFirstResult(), maxresult, jpql.toString(),
				params.toArray(), orderby));
		
		return pageView.getRecords();
	}*/
	
	@RequestMapping("delete")
	@ResponseBody
	public String delete(@RequestParam String name){
		Student entity = studentService.findByName(name);
		entity.setVisible(false);
		studentService.update(entity);
		return "success";
	}
	
	@RequestMapping("edit")
	public ModelAndView edit(String name) {
		ModelAndView mav = new ModelAndView("student/student_edit");
		Student student = studentService.findByName(name);
		mav.addObject("student", student);
		return mav;
	}
	
	@RequestMapping("update")
	public ModelAndView update(@ModelAttribute Student student){
		ModelAndView mav = new ModelAndView("student/student_edit");
		Student entity = studentService.findByName(student.getName());
		entity.setAge(entity.getAge());
		studentService.update(entity);
		return mav;
	}
	
	/**
	 * 不传关键字时,查询所有数据按照升序排列并分页,传关键字时,查询结果按照升序排列并分页
	 * @param page
	 * @param keyword
	 * @return
	 */
	@RequestMapping("listAllPage")
	public ModelAndView listAllPage(@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false,defaultValue="") String keyword){
		StringBuffer jpql = null;
		ModelAndView mav = new ModelAndView("student/student_list");
		PageView<Student> pageView = new PageView<>(maxresult, page);
		List<Object> params = new ArrayList<Object>();
		LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("age", "asc");
		
		jpql = new StringBuffer("o.visible=?1");
		params.add(true);
		//params.add("%"+keyword+"%");
		System.out.println(params);
		System.out.println(pageView.getFirstResult());
		System.out.println(jpql);
		System.out.println(orderby);
		QueryResult<Student> qResult= studentService.getScrollData(pageView.getFirstResult(), maxresult, jpql.toString(),
				params.toArray(), orderby);
		pageView.setQueryResult(qResult);
		List<Student> list = pageView.getRecords();
		for (Student student : list) {
			System.out.print(student.getName()+student.getAge());
		}
		mav.addObject("pageView",pageView);
		mav.addObject("page",page);
		mav.addObject("keyword",keyword);
		
		return mav;
	}
	
	
}
