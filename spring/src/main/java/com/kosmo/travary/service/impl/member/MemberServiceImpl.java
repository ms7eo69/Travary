package com.kosmo.travary.service.impl.member;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.travary.service.DaoService;

import lombok.RequiredArgsConstructor;

/*
 * ID 미 지정시 ID값은 소문자로 시작하는 클래스명
 * value속성으로 지정도 가능하다
 */
@Service("memberService")
@RequiredArgsConstructor
public class MemberServiceImpl implements DaoService {
	//매퍼 인터페이스 주입
	@Autowired
	private MemberMapper mapper;
	
	/*
	 * @Override public ListPagingData<BoardDTO> selectList(Map map,
	 * HttpServletRequest req, int nowPage) {
	 *
	 * //글 전체 목록 얻기 List records = mapper.findAll(map);
	 *
	 * ListPagingData<BoardDTO> listPagingData = ListPagingData.builder()
	 * .records(records) .build(); return listPagingData; }
	 */

	public boolean isMember(Map map) {
		return mapper.findByIdAndPwd(map); 
	}
	
	@Override
	public int insert(Map map) {
		return mapper.save(map);
	}	
	public int insertAuth(Map map) {
		return mapper.saveAuth(map);
	}

	@Override
	public List<Map> selectList(Map map) {
		return mapper.findAll(map);
	}
	@Override
	public int update(Map map) {
		return 0;
	}
	@Override
	public int delete(Map map) {
		return 0;
	}
	@Override
	public Map selectOne(Map map) {
		return null;
	}
	
	public int GoogleInsert(Map map) {
		
		return mapper.GoogleLoginsave(map);
	}
	public boolean selectApiLoginOne(Map apiLoginMap) {
		
		return mapper.ApiMemberConfirm(apiLoginMap);
	}

	public String selectKey(String string) {
		return mapper.findKeyByIdentifier(string);
	}

	public int insertKey(Map map) {
		return mapper.saveKey(map);
	}
	
}