package com.java.event.dao;

import java.util.HashMap;
import java.util.List;

import com.java.event.dto.EventDto;

public interface EventDao {

	public int getCount();

	public List<EventDto> eventList(int startRow, int endRow);

	public int eventWriteNumber(EventDto eventDto);

	public int EventGroupNumberMax();

	public int eventWriteNumber(HashMap<String, Integer> hMap);

	public EventDto read(int enumber);

	public EventDto eventSelect(int enumber);

	public int eventDeleteOk(int enumber);

	public int eventUpdateOk(EventDto eventDto);
}
