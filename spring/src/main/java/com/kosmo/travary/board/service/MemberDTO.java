package com.kosmo.travary.service;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
@Alias(value = "MemberDTO")
public class MemberDTO {
	
	private String no;
	private String title;
	private String content;
	private Date postDate;
	private String id;
	
	//아래는 SELECT시 게시글 정보를 담기 위한 필드들
	private String name;
	//각 글 번호(no)에 따른 모든 댓글 수 저장용
	private String commentCounts;
	
	//no에 따른 모든 한줄 댓글 목록 저장용
	//마이바티스의 ResultMap 태그의 collection태그 적용해야함
}
