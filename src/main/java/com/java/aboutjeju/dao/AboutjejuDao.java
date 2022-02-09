package com.java.aboutjeju.dao;

import java.util.List;

import com.java.aboutjeju.dto.AboutjejuDto;

public interface AboutjejuDao {

	public int LMinsert(AboutjejuDto aboutjejuDto);

	public List<AboutjejuDto> IRead(String introduction);
	public List<AboutjejuDto> Lread(String location);
	public List<AboutjejuDto> Sread(String speciality);
	public List<AboutjejuDto> Aread(String activites);

	

}
