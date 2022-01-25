package com.java.aboutjeju.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.aboutjeju.dao.AboutjejuDao;

@Component
public class AboutjejuServiceImp implements AboutjejuService {
	@Autowired
	private AboutjejuDao aboutjejuDao;
}
