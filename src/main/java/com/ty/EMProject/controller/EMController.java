package com.ty.EMProject.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ty.EMProject.entity.Employee;
import com.ty.EMProject.service.EMService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class EMController {

	private EMService emService;
	
	public EMController(EMService emService) {
		this.emService=emService;
	}

	@GetMapping("/")
	public ModelAndView getRegister() {
		ModelAndView mv = new ModelAndView("register.jsp");
		mv.addObject("employee", new Employee());
		return mv;
	}
	
	@PostMapping("/register")
	public ModelAndView registerEmp(Employee employee) {
		String msg = emService.register(employee);
		ModelAndView mv = new ModelAndView("login.jsp");
		mv.addObject("msg", msg);
		return mv;
	}
	
	@GetMapping("/login")
	public ModelAndView gotoLogin() {
		ModelAndView mv = new ModelAndView("login.jsp");
		return mv;
	}
	
	@PostMapping("/login")
	public ModelAndView loginEmp(HttpServletRequest request) {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		boolean login = emService.login(email, password);
		
		ModelAndView mv = new ModelAndView();
		
		if(login) {
			mv.setViewName("home.jsp");
			List<Employee> employees = emService.getAll();
			
			mv.addObject("emps", employees);
			mv.addObject("msg", "Login Successfull");
		} else {
			mv.setViewName("login.jsp");
			mv.addObject("msg", "Invalid Credentials");
		}
		return mv;
	}
	
	@GetMapping("/home")
	public ModelAndView home() {
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("home.jsp");
//		
//		List<Employee> employees = emService.getAll();
//		mv.addObject("emps", employees);
//		return mv;

		ModelAndView mv = new ModelAndView("home.jsp");

		List<Employee> employees = emService.getAll();

		// Add null check and error handling
		if (employees == null) {
			mv.addObject("msg", "Error retrieving employees from database.");
			return mv;
		}

		mv.addObject("emps", employees);
		return mv;
	}

	@GetMapping("/add")
	public ModelAndView gotoAdd() {
		ModelAndView mv = new ModelAndView("add.jsp");
		return mv;
	}
	
	@PostMapping("/add")
	public ModelAndView add(Employee employee) {
		String msg = emService.register(employee);
		
	    List<Employee> employees = emService.getAll();
		ModelAndView mv = new ModelAndView("home.jsp");
	    mv.addObject("emps", employees);
		mv.addObject("msg", msg);
		return mv;
	}
	
	@GetMapping("/edit")
	public ModelAndView editEmployee(@RequestParam Integer eid) {
		Employee employee = emService.findById(eid);
		ModelAndView mv = new ModelAndView("add.jsp");
		mv.addObject("emp", employee);
		return mv;
	}
	
	@PostMapping("/edit")
	public ModelAndView editEmployee(Employee employee) {
		String msg = emService.update(employee);
		List<Employee> employees = emService.getAll();
		ModelAndView mv = new ModelAndView("home.jsp");
		mv.addObject("emps", employees);
		mv.addObject("msg", msg);
		return mv;
	}
	
	@GetMapping("/delete")
	public ModelAndView delete(@RequestParam Integer eid) {
		String msg = emService.deleteById(eid);
		
	    List<Employee> employees = emService.getAll();
		ModelAndView mv = new ModelAndView("home.jsp");
		mv.addObject("emps", employees);
		mv.addObject("msg", msg);
		return mv;
	}
	
	@GetMapping("/email")
	public ModelAndView gotoEmail(@RequestParam Integer eid) {
		Employee employee = emService.findById(eid);
		ModelAndView mv = new ModelAndView("sendEmail.jsp");
		mv.addObject("emp", employee);
		return mv;
	}
	
	@PostMapping("/sendemail")
	public ModelAndView sendEmail(
	        @RequestParam String to, 
	        @RequestParam String subject, 
	        @RequestParam String body, 
	        @RequestParam(required = false) MultipartFile attachment) {

	    String result; 
	    try {
	        if (attachment != null && !attachment.isEmpty()) {
	            result = emService.sendEmailWithAttachment(to, subject, body, attachment);
	        } else {
	            result = emService.sendEmail(to, subject, body);
	        }
	    } catch (Exception e) {
	        result = "Failed to send email: " + e.getMessage();
	    }

	    List<Employee> employees = emService.getAll(); // Move this line outside the try-catch block
	    ModelAndView mv = new ModelAndView("home.jsp"); 
	    mv.addObject("emps", employees);
	    mv.addObject("msg", result);
	    return mv;
	}
}
