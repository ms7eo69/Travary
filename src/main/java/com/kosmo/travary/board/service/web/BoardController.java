package com.kosmo.travary.board.service.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpSessionRequiredException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.MoonSeongHyun2.board.service.BoardDTO;
import com.project.MoonSeongHyun2.board.service.BoardService;
import com.project.MoonSeongHyun2.board.service.ListPagingData;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("board")
@SessionAttributes({"id"})
public class BoardController {

	//서비스 호출
	@Autowired
	private BoardService<BoardDTO> boardService;
	
	@ExceptionHandler ({HttpSessionRequiredException.class})
	public String error(Model model,Exception e) {
		
		//에러에 따라 에러 메시지 및 포워드 URL변경
		String eProperty=null,eMessage=null,eUrl=null;
		if(e instanceof HttpSessionRequiredException) {
			eProperty="NotMember";
			eMessage="로그인 후 이용하세요";
			eUrl="_09onememo/member/Login";
		}
		//데이터 저장
		model.addAttribute(eProperty,eMessage);
		//뷰정보 반환
		return eUrl;
	}
	//목록 처리
	@RequestMapping(value="/List.do",method = {RequestMethod.GET,RequestMethod.POST})
	public String list(
			@ModelAttribute("id") String id,
			@RequestParam Map map,
			@RequestParam(required=false,defaultValue = "1") int nowPage,
			HttpServletRequest req,
			Model model) {
		
		//서비스 호출
		ListPagingData<BoardDTO> listPagingData = boardService.selectList(map, req,nowPage);
		
		//데이터 저장
		model.addAttribute("listPagingData", listPagingData);
		
		//뷰정보 반환
		return "_09onememo/bbs/List";
	}
}
