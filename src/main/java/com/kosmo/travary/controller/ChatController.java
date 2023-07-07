package com.kosmo.travary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.WebSocketSession;

import com.kosmo.travary.service.impl.chat.OpenchatService;

@Controller
@RequestMapping("chat")
public class ChatController {
	
	@Autowired
	OpenchatService openchatService;
	/*
	@GetMapping("createOpenChat.do")
	public String OpenChat() {
		openchatService.createWebSocketServer(session);
		return null;
	}*/
}
