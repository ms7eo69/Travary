package com.kosmo.travary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	
	@RequestMapping("/Admin_user.do")
	public String admin_user() {return "admin/admin_user";}
	@RequestMapping("/Admin_user_All.do")
	public String admin_user_All() {return "admin/admin_user_All";}
	@RequestMapping("/Admin_loc.do")
	public String admin_loc() {return "admin/admin_loc";}
	@RequestMapping("/Admin_loc_All.do")
	public String admin_loc_All() {return "admin/admin_loc_All";}
	@RequestMapping("/Admin_loc_edit.do")
	public String admin_loc_edit() {return "admin/admin_loc_edit";}
}
