package com.kosmo.travary.service;

import java.util.List;
import java.util.Map;

public interface DaoService {

	List<Map> selectList(Map map);
	Map selectOne(Map map);
	int insert(Map map);
	int update(Map map);
	int delete(Map map);
	String getAccessToken(String authorize_code) throws Exception;
}
