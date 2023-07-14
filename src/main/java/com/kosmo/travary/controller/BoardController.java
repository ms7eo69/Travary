package com.kosmo.travary.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
//@RequestMapping("/board")
@RequestMapping("/admin")
public class BoardController {

	@Autowired
	BoardServiceImpl boardService;
	
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
	
	//목록
	@GetMapping("/anno/List.do")
	public String list(@RequestParam Map map, Model model) {
	    List<Map> records = boardService.selectList(map);
	    //map.put("records", records);
	    //System.out.println(records);
		model.addAttribute("records", records);
	    return "qna_N_Anno/anno/List"; 
	}
	
	//글작성
	@GetMapping("/anno/Write.do")
	public String write() {
		return "/qna_N_Anno/anno/Write";
	}
	@PostMapping("/anno/Write")
	public String writeOk(@RequestParam Map map, Model model) {
		int affected = boardService.insert(map);
		System.out.println("ddddddddd");
		model.addAttribute("records", map);
		return affected == 1 ? "redirect:/admin/anno/List.do" : "forward:/";
	}
	
	
	//상세보기
	@RequestMapping("/anno/View.do")
	public String view(@RequestParam Map map, Model model) {
		Map records = boardService.selectOne(map);
		model.addAttribute("record", records);
		//System.out.println("ssssssssssssssssss");
		return "qna_N_Anno/anno/View";
	}
	
	//삭제
	@GetMapping("/anno/Delete.do")
	public String Delete(@RequestParam Map map) {
		boardService.delete(map);
		//System.out.println("ddddddddddddddd");
		return "redirect:/admin/anno/List.do";
	}
	
	//수정
	@GetMapping("/anno/Edit.do")
	public String edit(@RequestParam Map map, Model model) {
		Map records = boardService.selectOne(map);
		model.addAttribute("record", records);
		//System.out.println("eeeeeeeeeeeeeeeeee");		
		return "qna_N_Anno/anno/Edit";
	}
	
	@PostMapping("/anno/Edit.do")
	public String editok(@RequestParam Map map, Model model) {
		
		int affected = boardService.update(map);
		Object postno = map.get("postno");
		System.out.println(postno);
		//System.out.println("xxxxxxxxxxxxxxxxxxxxxx");
		return "redirect:/admin/anno/View.do?POSTNO="+postno;		
	}
	
	
	/*
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
	*/
}
