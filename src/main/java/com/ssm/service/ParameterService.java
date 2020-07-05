package com.ssm.service;

import java.util.List;

import com.ssm.entity.Parameter;

public interface ParameterService {
	//查询所有
	public List<Parameter> selectParameter(); 
	//查询单个
	public Parameter selectParameterOne(int SerialID);
	//更新
	public void updateParameter(Parameter Parameter);
}
