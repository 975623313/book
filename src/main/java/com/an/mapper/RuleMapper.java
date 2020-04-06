package com.an.mapper;

import com.an.pojo.Rules;

import java.util.List;

public interface RuleMapper {
	public List<Rules> findAllRule();
	
	public void addRules(Rules rules);

	public void deleteRules(int ruleId);
	
	
	public Rules findById(int ruleId);
	public void updateRule(Rules rule);
}
