package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Company;

public interface CompanyService 
{
	public void addCompany(Company company);
	public Company checkCompanyLogin(String email,String password);
   
}
