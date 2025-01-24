package com.ty.EMProject.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ty.EMProject.entity.Employee;

public interface EMRepository extends JpaRepository<Employee, Integer> {

	public Optional<Employee> findByEmail(String email);
	
}
