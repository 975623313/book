package com.an.service;

import com.an.pojo.Rules;

import java.util.List;

public interface RuleService {

	public List<Rules> findAllRule();
	public void addRules(Rules rules);
	public void deleteRules(int ruleId);
	public Rules findById(int ruleId);
	public void updateRule(Rules rule);
}
