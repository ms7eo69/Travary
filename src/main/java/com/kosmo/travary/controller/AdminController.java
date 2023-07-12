package com.kosmo.travary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	
	@RequestMapping("/User.do")
	public String admin_user() {return "admin/admin_user";}
//	@RequestMapping("/Admin_user_All.do")
//	public String admin_user_All() {return "admin/admin_user_All";}
	@RequestMapping("/loc_boundary.do")
	public String admin_loc() {return "admin/admin_loc_boundary";}
//	@RequestMapping("/Admin_loc_All.do")
//	public String admin_loc_All() {return "admin/admin_loc_All";}
//	@RequestMapping("/Admin_loc_edit.do")
//	public String admin_loc_edit() {return "admin/admin_loc_edit";}
//	
//	@RequestMapping("/Admin_anno_List.do")
//	public String admin_anno() {return "QnA_N_Anno/List";}
//	
//	@RequestMapping("/Admin_anno_View.do")
//	public String admin_anno_view() {
//		return "QnA_N_Anno/View";
//		}
//	
//	@GetMapping("/Admin_anno_Write.do")
//	public String admin_anno_write() {return "QnA_N_Anno/Write";}
//	@PostMapping
//	public String admin_anno_writeok() {return "QnA_N_Anno/Write";}
//	
//	@GetMapping("/Admin_anno_edit.do")
//	public String admin_anno_edit() {return "QnA_N_Anno/Edit";}
//	@PostMapping("/Admin_anno_edit.do")
//	public String admin_anno_editok() {return "QnA_N_Anno/List";}
//	@RequestMapping("/Admin_loc_boundary.do")
//	public String admin_loc_boundary() {return "admin/admin_loc_boundary";}
}
