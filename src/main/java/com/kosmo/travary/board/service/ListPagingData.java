package com.kosmo.travary.board.service;

import java.util.List;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//제너릭 클래스 : 페이징 관련 데이터를 저장하는 클래스
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ListPagingData<T> {

	//레코드 목록 데이터 저장
	private List<T> records;
	//페이징 관련 데이터 저장
	private Map map;
	//페이징 표시용 문자열 저장
	private String pagingString; 
}
