package com.kosmo.travary.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("RegisterController.kosmo")
public class RegisterController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("member/Register").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String nickname = req.getParameter("nickname");
		String gender = req.getParameter("gender");
		String birth = req.getParameter("birth");
		String phone = req.getParameter("phone");
		req.getRequestDispatcher("member/Login").forward(req, resp);
	}

}
