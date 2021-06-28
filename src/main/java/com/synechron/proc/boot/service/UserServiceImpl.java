package com.synechron.proc.boot.service;

import java.util.List;
import java.util.Optional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.synechron.proc.boot.model.CustomerDetails;
import com.synechron.proc.boot.model.InsurancePlanDetails;
import com.synechron.proc.boot.model.User;
import com.synechron.proc.boot.model.UserRegistration;
import com.synechron.proc.boot.repo.CustomerRepository;
import com.synechron.proc.boot.repo.DataRepository;
import com.synechron.proc.boot.repo.InsurancPlanRepository;
import com.synechron.proc.boot.repo.InsuranceDetailsRepository;
import com.synechron.proc.boot.repo.InsurancePlanDeleteRepo;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private DataRepository repo;
	@Autowired
	private CustomerRepository customerrepo;
	@Autowired
	private InsuranceDetailsRepository insurancerepo;
	@Autowired
	private InsurancPlanRepository insuranceplanrepo;
	@Autowired
	private InsurancePlanDeleteRepo insuranceplandeleterepo;

	@Override
	@SuppressWarnings("unchecked")
	public UserRegistration addNewUser(UserRegistration userregistration) {
		return repo.save(userregistration);
	}

	@Override
	@SuppressWarnings("unchecked")
	public boolean isValidUser(User user) {
		boolean usrvalidornot = false;
		List al = repo.findAll();
		System.out.println(al);
		for (int i = 0; i < al.size(); i++) {
			UserRegistration dbUser = (UserRegistration) al.get(i);
			if (user.getUserName().equals(dbUser.getUserName()) && user.getPassword().equals(dbUser.getPassword())) {
				usrvalidornot = true;
				break;
			}
		}
		return usrvalidornot;
	}

	@Override
	@SuppressWarnings("unchecked")
	public CustomerDetails addNewCustomers(CustomerDetails customerdetails) {
		return customerrepo.save(customerdetails);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<InsurancePlanDetails> getSourcelist() {
		List<InsurancePlanDetails> ips = null;
		try {
			ips = insurancerepo.findAll();
		} catch (EmptyResultDataAccessException e) {
			e.printStackTrace();
		}
		return ips;
	}

	@Override
	@SuppressWarnings("unchecked")
	public InsurancePlanDetails addNewPlan(InsurancePlanDetails insuranceplandetails) {
		return insuranceplanrepo.save(insuranceplandetails);
	}

	@Override
	@SuppressWarnings("unchecked")
	public Boolean deletePlan(int insuranceId) {
			insuranceplandeleterepo.deleteById(insuranceId);
		return true;
	}

	@Override
	@SuppressWarnings("unchecked")
	public InsurancePlanDetails getPlanByID(int insuranceId) {
		InsurancePlanDetails isp = insuranceplandeleterepo.findById(insuranceId).orElse(null);
		return isp;
	}

	@Override
	@SuppressWarnings("unchecked")
	public InsurancePlanDetails updateNewPlan(InsurancePlanDetails insuranceplandetails, int idOfPlan) {

		List<InsurancePlanDetails> allinsurancelist = insurancerepo.findAll();
		InsurancePlanDetails actualPalnEdit = insuranceplandeleterepo.findById(idOfPlan).orElse(null);
		actualPalnEdit.setInsurancetype(insuranceplandetails.getInsurancetype());
		actualPalnEdit.setPremiumname(insuranceplandetails.getPremiumname());
		actualPalnEdit.setNumberofbranch(insuranceplandetails.getNumberofbranch());
		actualPalnEdit.setTotalinsuranceamount(insuranceplandetails.getTotalinsuranceamount());
		actualPalnEdit.setCoverlimit(insuranceplandetails.getCoverlimit());

		return insuranceplanrepo.save(actualPalnEdit);
	}

}
