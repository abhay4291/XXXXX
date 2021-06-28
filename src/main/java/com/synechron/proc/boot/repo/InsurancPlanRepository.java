package com.synechron.proc.boot.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.synechron.proc.boot.model.InsurancePlanDetails;

public interface InsurancPlanRepository extends JpaRepository<InsurancePlanDetails, Long> {

}
