package com.skilldistillery.mvctrailmixer.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

@Transactional
@Component
public class PreferenceDAOImpl {
	
	@PersistenceContext
	private EntityManager em;

}
