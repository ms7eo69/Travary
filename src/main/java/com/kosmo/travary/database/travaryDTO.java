package com.kosmo.travary.database;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Alias("travaryDto")
public class travaryDTO {
	private String id;
	private String pwd;
	private String nickname;
	private String gender;
	private String birth;
	private String phone;
	private java.sql.Date regdate;
}
