package com.java.event.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.event.dao.EventDao;

@Component
public class EventServiceImp implements EventService {
	@Autowired
	private EventDao eventDao;
}
