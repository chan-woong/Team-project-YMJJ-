package com.java.notice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.notice.dao.NoticeDao;

@Component
public class NoticeServiceImp implements NoticeService {
	@Autowired
	private NoticeDao noticeDao;
}
