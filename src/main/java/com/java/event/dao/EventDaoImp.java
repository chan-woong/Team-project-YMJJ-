package com.java.event.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.event.dto.EventDto;

@Component
public class EventDaoImp implements EventDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<EventDto> eventList(int startRow, int endRow) {
		HashMap<String, Integer> hMap = new HashMap<String, Integer>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		return sqlSessionTemplate.selectList("eventList", hMap);
	}

	@Override
	public int getCount() {
		return sqlSessionTemplate.selectOne("count");
	}

	@Override
	public int eventWriteNumber(EventDto eventDto) {
		return sqlSessionTemplate.insert("eventInsert", eventDto);
	}

	@Override
	public int eventWriteNumber(HashMap<String, Integer> hMap) {

		return sqlSessionTemplate.update("hMap", hMap);
	}

	@Override
	public int EventGroupNumberMax() {
		return sqlSessionTemplate.selectOne("eventGroupNumberMax");
	}

	@Override
	public EventDto read(int enumber) {
		EventDto eventDto = null;
		eventDto = sqlSessionTemplate.selectOne("eventRead", enumber);
		return eventDto;
	}

	@Override
	public EventDto eventSelect(int enumber) {
		return sqlSessionTemplate.selectOne("eventRead", enumber);
	}

	@Override
	public int eventDeleteOk(int enumber) {
		int check = sqlSessionTemplate.delete("eventDelete", enumber);
		return check;
	}

	@Override
	public int eventUpdateOk(EventDto eventDto) {
		return sqlSessionTemplate.update("eventUpdate", eventDto);
	}
}
