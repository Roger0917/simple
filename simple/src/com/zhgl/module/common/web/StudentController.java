package com.zhgl.module.common.web;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.zhgl.module.common.ebean.Project;
import com.zhgl.module.common.ebean.Student;
import com.zhgl.module.common.service.StudentService;
import com.zhgl.module.common.service.StudentServiceBean;
import com.zhgl.util.dao.PageView;

@Controller
@RequestMapping("/stu/")
public class StudentController {

	@Autowired
	private StudentService studentService;
	
	private ModelAndView mav;
	
	private int maxresult = 3;
	
	@RequestMapping("save")
	public void save(Student student){
		studentService.save(student);
		listAllPage(1,"");
	}
	
	@RequestMapping("listAll")
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
	}
	
	@RequestMapping("delete")
	public void delete(@RequestParam long id){
		studentService.delete(id);
		listAllPage(1,"");
	}
	
	@RequestMapping("update")
	public void update(Student student){
		studentService.update(student);
		listAllPage(1,"");
	}
	
	/**
	 * 不传关键字时,查询所有数据按照升序排列并分页,传关键字时,查询结果按照升序排列并分页
	 * @param page
	 * @param keyword
	 * @return
	 */
	@RequestMapping("listAllPage")
	@ResponseBody
	public List listAllPage(@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false,defaultValue="") String keyword){
		PageView<Student> pageView = new PageView<>(maxresult, page);
		
		LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("number", "asc");
		StringBuffer jpql = new StringBuffer("o.number like ?1 or o.name like?2");
		List<Object> params = new ArrayList<Object>();
		params.add("%"+keyword+"%");
		params.add("%"+keyword+"%");
		
		pageView.setQueryResult(studentService.getScrollData(pageView.getFirstResult(), maxresult, jpql.toString(),
				params.toArray(), orderby));
		
		return pageView.getRecords();
		
		/*mav = new ModelAndView().addObject("listall", list);
		mav.setViewName("student/index");
		return mav;*/
	}
	
	
}
