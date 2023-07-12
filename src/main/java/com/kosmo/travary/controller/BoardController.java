package com.kosmo.travary.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.HttpSessionRequiredException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kosmo.travary.service.impl.board.BoardServiceImpl;


@Controller
@RequestMapping("/kosmo/board")
public class BoardController {

	@Autowired
	private BoardServiceImpl boardService;
	
	@ExceptionHandler ({HttpSessionRequiredException.class})
	public String error(Model model,Exception e) {
		
		//에러에 따라 에러 메시지 및 포워드 URL변경
		String eProperty=null,eMessage=null,eUrl=null;
		if(e instanceof HttpSessionRequiredException) {
			eProperty="NotMember";
			eMessage="로그인 후 이용하세요";
			eUrl="member/Login";
		}
		//데이터 저장
		model.addAttribute(eProperty,eMessage);
		//뷰정보 반환
		return eUrl;
	}
	//목록 처리
	@GetMapping("/List.msp")
	public String list(Model model) {
		
		List list = boardService.selectList(null);
		model.addAttribute("records", list);
		return "board/List";
	}
	
	@PostMapping("/Admin/anno/Write")
	public String write(@RequestParam Map map) {
		boardService.insert(map);
		System.out.println("ddddddddd");
		return "board/Write";
	}
	
	@PostMapping("/WriteProcess.msp")
	public String writeProcess(
			@RequestParam Map paramMap,
			@RequestParam MultipartFile files) {
		System.out.println(files);
		if(files!=null) {
			String fileName = StringUtils.cleanPath(files.getOriginalFilename());
			System.out.println(fileName);
		}
		return "board/List";
	}
}
