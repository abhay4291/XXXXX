package com.synechron.proc.boot.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.synechron.proc.boot.model.CustomerDetails;
import com.synechron.proc.boot.model.UserRegistration;

public interface CustomerRepository extends JpaRepository<CustomerDetails, Long> 
{

}
