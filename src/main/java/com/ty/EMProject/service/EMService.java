package com.ty.EMProject.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.ty.EMProject.entity.Employee;
import com.ty.EMProject.repository.EMRepository;

import jakarta.mail.internet.MimeMessage;

@Repository
public class EMService {

	@Autowired
	private EMRepository emRepository;
	
    @Autowired
    private JavaMailSender mailSender;

	public String register(Employee employee) {
		Optional<Employee> opt = emRepository.findByEmail(employee.getEmail());

		if (opt.isPresent()) {
			return employee.getEmail() + " is already registered!!!";
		} else {
			Employee save = emRepository.save(employee);
			return "Registered successfully! Employee ID: " + save.getEid();
		}
	}

	public boolean login(String email, String password) {
		Optional<Employee> opt = emRepository.findByEmail(email);

		if (opt.isPresent()) {
			if (opt.get().getPassword().equals(password)) {
				return true;
			}
			return false;
		}
		return false;
	}

	public Employee findById(Integer eid) {
		return emRepository.findById(eid).get();
	}

	public List<Employee> getAll() {
		return emRepository.findAll();
	}
	
	public String deleteById(Integer eid) {
		emRepository.deleteById(eid);
		return "Deleted Employee with ID : "+ eid;
	}
	
	
//	public String update(Employee employee) {
//		Optional<Employee> existEmail = emRepository.findByEmail(employee.getEmail());
//		
//		if(existEmail.isPresent()) {
//			Employee ExistEmployee = existEmail.get();
//		
//			ExistEmployee.setName(employee.getName());
//			ExistEmployee.setEmail(employee.getEmail());
//			ExistEmployee.setPhone(employee.getPhone());
//			ExistEmployee.setPassword(employee.getPassword());
//			
//			emRepository.save(ExistEmployee);
//			return "Employee updated successfully!";
//		} else {
//			return "Employee not found!";
//		}
//	}
	
	public String update(Employee employee) {
		Optional<Employee> existingEmployeeOpt = emRepository.findById(employee.getEid());
		if (existingEmployeeOpt.isPresent()) {
			Employee existingEmployee = existingEmployeeOpt.get();
			// Update the employee fields (including email)
			existingEmployee.setEid(employee.getEid());
			existingEmployee.setName(employee.getName());
			existingEmployee.setEmail(employee.getEmail());
			existingEmployee.setPhone(employee.getPhone());
			existingEmployee.setPassword(employee.getPassword());

			emRepository.save(existingEmployee);
			return "Employee updated successfully!";
		} else {
			return "Employee not found!";
		}
	}
	
	public String sendEmail(String to, String subject, String body) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(to);
            message.setSubject(subject);
            message.setText(body);
            mailSender.send(message);
            return "Email sent successfully!";
        } catch (Exception e) {
            return "Failed to send email";
        }
    }
	
    public String sendEmailWithAttachment(String to, String subject, String body, MultipartFile attachment) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);

            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(body, true); 
            helper.addAttachment(attachment.getOriginalFilename(), attachment);

            mailSender.send(message);
            return "Email with attachment sent successfully!";
        } catch (Exception e) {
            return "Failed to send email with attachment: " + e.getMessage();
        }
    }
}
