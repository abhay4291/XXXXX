package com.synechron.proc.boot.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="insuranceplandetails")
public class InsurancePlanDetails 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String insurancetype;
	private String premiumname;
	private long numberofbranch;
	private long totalinsuranceamount;
	private String coverlimit;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getInsurancetype() {
		return insurancetype;
	}
	public void setInsurancetype(String insurancetype) {
		this.insurancetype = insurancetype;
	}
	public String getPremiumname() {
		return premiumname;
	}
	public void setPremiumname(String premiumname) {
		this.premiumname = premiumname;
	}
	public long getNumberofbranch() {
		return numberofbranch;
	}
	public void setNumberofbranch(long numberofbranch) {
		this.numberofbranch = numberofbranch;
	}
	public long getTotalinsuranceamount() {
		return totalinsuranceamount;
	}
	public void setTotalinsuranceamount(long totalinsuranceamount) {
		this.totalinsuranceamount = totalinsuranceamount;
	}
	public String getCoverlimit() {
		return coverlimit;
	}
	public void setCoverlimit(String coverlimit) {
		this.coverlimit = coverlimit;
	}
	@Override
	public String toString() {
		return "InsurancePlanDetails [id=" + id + ", insurancetype=" + insurancetype + ", premiumname=" + premiumname
				+ ", numberofbranch=" + numberofbranch + ", totalinsuranceamount=" + totalinsuranceamount
				+ ", coverlimit=" + coverlimit + "]";
	}
	
	
}
