package com.kosmo.travary.service.impl.member;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.travary.service.DaoService;

@Service("memberService")
public class MemberServiceImpl implements DaoService {
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