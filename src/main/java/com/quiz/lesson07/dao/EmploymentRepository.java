package com.quiz.lesson07.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson07.entity.EmploymentEntity;

@Repository
public interface EmploymentRepository extends JpaRepository<EmploymentEntity, Integer> {

	// JPQL -> entity 조회
	public List<EmploymentEntity> findByCompanyId(int companyId);
	
	public List<EmploymentEntity> findByPositionAndType(String position, String Type);
	
	public List<EmploymentEntity> findByTypeOrSalaryGreaterThanEqual(String type, int salary);
	
	public List<EmploymentEntity> findTop3ByTypeOrderBySalaryDesc(String Type);
	
	public List<EmploymentEntity> findByRegionAndSalaryBetween(String region, int start, int end);
	
	// native query => DB에 직접 조회
	@Query(value = "select * from employment where deadline > :deadline and salary >= :salary and type = :type order by salary desc", nativeQuery = true)
	public List<EmploymentEntity> findByDeadlineAfterAndSalaryAndTypeOrderBySalaryDesc(
			@Param("deadline") String deadline,
			@Param("salary") int salary,
			@Param("type") String type);
}
