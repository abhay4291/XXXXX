package com.synechron.proc.boot.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.synechron.proc.boot.model.CustomerDetails;
import com.synechron.proc.boot.model.InsurancePlanDetails;
import com.synechron.proc.boot.model.User;
import com.synechron.proc.boot.model.UserRegistration;
import com.synechron.proc.boot.service.UserService;

@RestController
public class HomeController {

	@Autowired
	UserService userService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView Home(HttpServletRequest req, HttpServletResponse res) {
		ModelAndView mv = new ModelAndView("home");
		return mv;
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView RegisterUser(HttpServletRequest req, HttpServletResponse res,
			@ModelAttribute("userregistration") UserRegistration userregistration) {
		ModelAndView mv = null;
		// validate the user Registration
		if (userregistration.getPassword().equals(userregistration.getRePassword())) {
			try {
				UserRegistration isSaveData = userService.addNewUser(userregistration);
				// System.out.println("USER IS SAVED OR NOT:-" + isSaveData);
				if (isSaveData != null) {
					req.setAttribute("regsiterd", "User registerd successfully..!!");
					mv = new ModelAndView("home");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			req.setAttribute("registraionfailed", "Password and re-password does not matched");
			ModelAndView mv1 = new ModelAndView("home");
			return mv1;
		}
		return mv;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginPost(HttpServletRequest req, HttpServletResponse res, @ModelAttribute("user") User user) {
		ModelAndView mv = null;
		// validate the user
		try {
			boolean isValidUser = userService.isValidUser(user);
			// System.out.println("USER VALID OR NOT:-" + isValidUser);
			if (isValidUser) {
				// System.out.println("User Login Successful");
				req.setAttribute("loggedInUser", user.getUserName());
				mv = new ModelAndView("welcome");

			} else {
				req.setAttribute("loginfailed", "Please enter coreect login id");
				ModelAndView mv1 = new ModelAndView("home");
				return mv1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "/customerdetails", method = RequestMethod.POST)
	public ModelAndView getPlan(HttpServletRequest req, HttpServletResponse res,
			@ModelAttribute("customerdetails") CustomerDetails customerdetails,
			@ModelAttribute("insuranceplandetails") InsurancePlanDetails insuranceplandetails) {
		ModelAndView mv = null;
		try {
			CustomerDetails isSaveCustomers = userService.addNewCustomers(customerdetails);
			// System.out.println("CUSTOMER IS SAVED OR NOT:-" + isSaveCustomers);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv = new ModelAndView("selectplan");
		List<InsurancePlanDetails> insurancePlanDetailsList = userService.getSourcelist();
		mv.addObject("JspPlanDetailsList", insurancePlanDetailsList);
		return mv;
	}

	@RequestMapping(value = "/addplan", method = RequestMethod.POST)
	public ModelAndView addPlan(HttpServletRequest req, HttpServletResponse res,
			@ModelAttribute("insuranceplandetails") InsurancePlanDetails insuranceplandetails) {
		ModelAndView mv = new ModelAndView("selectplan");
		InsurancePlanDetails isSavePlan = null;
		// validate the user Registration
		try {
			isSavePlan = userService.addNewPlan(insuranceplandetails);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// System.out.println("---PLAN IS SAVED OR NOT:-" + isSavePlan);
		if (isSavePlan != null) {
			req.setAttribute("planRegsiterd", "Plan registered successfully..!!");
			List<InsurancePlanDetails> insurancePlanDetailsList = userService.getSourcelist();
			mv.addObject("JspPlanDetailsList", insurancePlanDetailsList);
		} else {
			req.setAttribute("planRegistraionFailed", "Plan registeration unsuccessful..!!");
			List<InsurancePlanDetails> insurancePlanDetailsList = userService.getSourcelist();
			mv.addObject("JspPlanDetailsList", insurancePlanDetailsList);
		}
		return mv;
	}

	@RequestMapping(value = "/deleteplan/{InsuranceId}", method = RequestMethod.GET)
	public ModelAndView deletePlan(HttpServletRequest req, HttpServletResponse res,
			@PathVariable("InsuranceId") int InsuranceId) {
		Boolean isDeletePlan = null;
		ModelAndView mv = new ModelAndView("selectplan");
		try {
			isDeletePlan = userService.deletePlan(InsuranceId);
			// System.out.println("---DELETED---PLAN-IS-" + "ID=" + InsuranceId + "		// INSURANCE TYPE=" + InsuranceType);
			if (isDeletePlan != null) {
				req.setAttribute("planDeleted", "Plan deleted successfully..!!");
				try {
					List<InsurancePlanDetails> insurancePlanDetailsList = userService.getSourcelist();
					mv.addObject("JspPlanDetailsList", insurancePlanDetailsList);
				} catch (EmptyResultDataAccessException e) {
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = "/editplan/{InsuranceId}", method = RequestMethod.GET)
	public ModelAndView editPlan(HttpServletRequest req, HttpServletResponse res,
			@PathVariable("InsuranceId") int InsuranceId,
			@ModelAttribute("insuranceplandetails") InsurancePlanDetails insuranceplandetails) {
		InsurancePlanDetails insplanbyId = null;
		ModelAndView mv = new ModelAndView("editplan");
		try {
			insplanbyId = userService.getPlanByID(InsuranceId);
			// System.out.println("-------xxXX----" + insplanbyId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (insplanbyId != null) {
			mv.addObject("insplanbyId", insplanbyId);
			List<InsurancePlanDetails> insurancePlanDetailsList = userService.getSourcelist();
			mv.addObject("JspPlanDetailsList", insurancePlanDetailsList);

		}
		return mv;
	}

	@RequestMapping(value = "/editplanupdate", method = RequestMethod.POST)
	public ModelAndView editPlanUpdate(HttpServletRequest req, HttpServletResponse res,@ModelAttribute("insuranceplandetails") InsurancePlanDetails insuranceplandetails) 
	{
		int idOfPlan=Integer.parseInt(req.getParameter("inputName"));
		ModelAndView mv = new ModelAndView("selectplan");
		InsurancePlanDetails isSavePlan = null;
		try {
			isSavePlan = userService.updateNewPlan(insuranceplandetails,idOfPlan);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (isSavePlan != null) {
			req.setAttribute("planRegsiterd", "Plan updated successfully..!!");
			List<InsurancePlanDetails> insurancePlanDetailsList = userService.getSourcelist();
			mv.addObject("JspPlanDetailsList", insurancePlanDetailsList);
		} else {
			req.setAttribute("planRegistraionFailed", "Plan updation unsuccessful..!!");
			List<InsurancePlanDetails> insurancePlanDetailsList = userService.getSourcelist();
			mv.addObject("JspPlanDetailsList", insurancePlanDetailsList);
		}
		return mv;
	}

	@RequestMapping(value = "/bookplan/{InsuranceType}/{PremiumName}/{NumberOfBranch}/{TotalInsuranceAmount}/{CoverLimit}", method = RequestMethod.GET)
	public ModelAndView getInsuranceDetails(HttpServletRequest req, HttpServletResponse res,
			@PathVariable("InsuranceType") String InsuranceType, @PathVariable("PremiumName") String PremiumName,
			@PathVariable("NumberOfBranch") long NumberOfBranch,
			@PathVariable("TotalInsuranceAmount") long TotalInsuranceAmount,
			@PathVariable("CoverLimit") String CoverLimit) {
		double EMIInsuranceAmount = TotalInsuranceAmount / 12;
		req.setAttribute("InsuranceType", "InsuranceType");
		req.setAttribute("PremiumName", "PremiumName");
		req.setAttribute("NumberOfBranch", "NumberOfBranch");
		req.setAttribute("TotalInsuranceAmount", "TotalInsuranceAmount");
		req.setAttribute("CoverLimit", "CoverLimit");
		req.setAttribute("EMIInsuranceAmount", EMIInsuranceAmount);
		ModelAndView mv = new ModelAndView("adddetails");
		return mv;
	}
}
