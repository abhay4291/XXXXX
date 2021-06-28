package com.synechron.proc.boot.service;

import java.util.List;
import java.util.Optional;

import com.synechron.proc.boot.model.CustomerDetails;
import com.synechron.proc.boot.model.InsurancePlanDetails;
import com.synechron.proc.boot.model.User;
import com.synechron.proc.boot.model.UserRegistration;

public interface UserService {
	
	public UserRegistration addNewUser(UserRegistration userregistration);
	public boolean isValidUser(User user);
	public CustomerDetails addNewCustomers(CustomerDetails customerdetails);
	public List<InsurancePlanDetails> getSourcelist();
	public InsurancePlanDetails addNewPlan(InsurancePlanDetails insuranceplandetails);
	public Boolean deletePlan(int insuranceId);
	public InsurancePlanDetails getPlanByID(int insuranceId);
	public InsurancePlanDetails updateNewPlan(InsurancePlanDetails insuranceplandetails, int idOfPlan);
	
}
