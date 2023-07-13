package com.kosmo.travary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Admin")
public class AdminController {

	
	@RequestMapping("/user/Index.do")
	public String admin_user() {return "admin/user/Index";}
	@RequestMapping("/user/All.do")
	public String admin_user_All() {return "admin/user/All";}
	@RequestMapping("/loc/Index.do")
	public String admin_loc() {return "admin/loc/Index";}
	@RequestMapping("/loc/All.do")
	public String admin_loc_All() {return "admin/loc/All";}
	@RequestMapping("/loc/Edit.do")
	public String admin_loc_edit() {return "admin/loc/Edit";}
	@RequestMapping("/loc/Boundary.do")
	public String admin_loc_boundary() {return "admin/loc/Boundary";}
	
	
	//@RequestMapping("/anno/List.do")
	//public String admin_anno() {System.out.println("ddddddddddddd"); return "qna_N_Anno/anno/List";}
	
	@RequestMapping("/anno/View.do")
	public String admin_anno_view() {return "qna_N_Anno/anno/View";}
	/*
	@GetMapping("/anno/Write.do")
	public String admin_anno_write() {return "qna_N_Anno/anno/Write";}
	@PostMapping("/anno/Write.do")
	public String admin_anno_writeok() {return "qna_N_Anno/anno/Write";}*/
	
	@GetMapping("/anno/Edit.do")
	public String admin_anno_edit() {return "qna_N_Anno/anno/Edit";}
	@PostMapping("/anno/Edit.do")
	public String admin_anno_editok() {return "qna_N_Anno/anno/List";}

	
	@RequestMapping("/qna/List.do")
	public String admin_qna_list() {return "qna_N_Anno/qna/List";}
	@RequestMapping("/qna/View.do")
	public String admin_qna_view() {return "qna_N_Anno/qna/View";}
	@GetMapping("/qna/Edit.do")
	public String admin_qna_edit() {return "qna_N_Anno/qna/Edit";}
	@PostMapping("/qna/Edit.do")
	public String admin_qna_editok() {return "qna_N_Anno/qna/List";}
	@GetMapping("/qna/Write.do")
	public String admin_qna_write() {return "qna_N_Anno/qna/Write";}
	@PostMapping("/qna/Write.do")
	public String admin_qna_writeok() {return "qna_N_Anno/qna/List";}
		
}
