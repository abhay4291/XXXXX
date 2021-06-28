package com.synechron.proc.boot.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.synechron.proc.boot.model.UserRegistration;


@Repository
public interface DataRepository extends JpaRepository<UserRegistration, Long> 
{
	
}
