package com.kosmo.travary.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;



//제너릭 인터페이스
//메소드명은 업무처리로직에 적합한 이름
//메소드의 인자 타입은 매퍼 인터페이스의 인자 타입과 일치시키자
public interface BoardService<T> {

	//로그인 용
	boolean isLogin(Map map);
	//목록용
	ListPagingData<T> selectList(Map map,HttpServletRequest req,int nowPage);
	//상세보기용
	T selectOne(Map map);
	//입력 수정 삭제용
	int insert(Map map);
	int update(T record);
	int delete(T record);
	
}
