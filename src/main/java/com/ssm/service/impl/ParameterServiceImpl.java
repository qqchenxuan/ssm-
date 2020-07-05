package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.ParameterDao;
import com.ssm.entity.Parameter;
import com.ssm.service.ParameterService;

import javax.annotation.Resource;

@Service("parameterService")
public class ParameterServiceImpl implements ParameterService{
	@Resource(name = "parameterDao")
	private ParameterDao parameterDao;

	@Override
	public List<Parameter> selectParameter() {
		return parameterDao.selectParameter();
	}

	@Override
	public Parameter selectParameterOne(int SerialID) {
		return parameterDao.selectParameterOne(SerialID);
	}

	@Override
	public void updateParameter(Parameter Parameter) {
		parameterDao.updateParameter(Parameter);
	}


	
}
