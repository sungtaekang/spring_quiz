package com.quiz.lesson07.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson07.entity.EmploymentEntity;

@Repository
public interface EmploymentRepository extends JpaRepository<EmploymentEntity, Integer> {

//	public List<EmploymentEntity> findByCompanyId(int companyId);
	
//	public List<EmploymentEntity> findByPositionAndType(String position, String Type);
//	
//	public List<EmploymentEntity> findByPositionAndType(String position, String Type);
	
	public List<EmploymentEntity> findTop3ByTypeAndOrderBySalaryDesc(String Type);
}
